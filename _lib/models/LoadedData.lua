LoadedData = {
    IDCounter = 0,
    Files = {},
    CurrentActiveFile = "",
    CurrentTransformStep = "",
    CurrentTransformingFile = "",

    TransformedFiles = {},

    PreviousTransformedRowsInOperation = {},
    PreviousTransformedXMLOperations = {},
    PreviousRowsInOperation = {},

    -- Data
    TransformData = {};
    FilterData = {},
}

function LoadedData:new (o)
    o = o or {};
    setmetatable(o, self);
    self.__index = self;
    return o;
end

function LoadedData:AddFiles()
    for key, filter in pairs(self.FilterData) do
        self:LoadFile(key, filter);
    end
end

function LoadedData:LoadFile(key, filter)
    local file = assert(io.open(filter.FileName, "r"));
    local fileExtension = GetFileExtension(filter.FileName);
    self.Files[key] = {};
    self.CurrentActiveFile = key;

    if fileExtension == "tsv" then
        local firstLine = true;
        for line in file:lines() do
            local fields = Split(line, "\t");
            local matchesFilter = self:RowMatchesFilters(fields, filter.Filter);
            if firstLine == true or matchesFilter == true then
                table.insert(self.Files[key], fields);
                firstLine = false;
            end

            if filter.OnlyLoadHeader == true then
                break;
            end
        end
    elseif fileExtension == "xml" then
        local container = {};
        local foundRoot = false;
        local elementsWithinRoot = {};
        for line in file:lines() do
            if ContainsXMLRoot(line, filter.Filter.RootElement) then
                foundRoot = true;
                elementsWithinRoot[#elementsWithinRoot + 1] = line.."\n";
            elseif foundRoot == true then
                elementsWithinRoot[#elementsWithinRoot + 1] = line.."\n";
            elseif foundRoot == false then
                container[#container + 1] =  line;
            end
        end
        table.insert(self.Files[splitFileName], container);
        table.insert(self.Files[splitFileName], {ConvertTableValuesToString(elementsWithinRoot)});
    end

    file:close();
end

function LoadedData:WriteFiles()
    for key, file in pairs(self.TransformedFiles) do
        local filterData = self.FilterData[key];
        if filterData.OutputFile == true then
            local fileType = GetFileExtension(filterData.FileName);
            local outputFileName = filterData.FileName;
            outputFileName = "out/"..outputFileName.."_new."..fileType;

            local iostream = assert(io.open(outputFileName, "w+"));
            if fileType == "tsv" then
                local headerRow = self.Files[key][1];
                for headerKey, headerColumn in pairs(headerRow) do
                    if headerKey == #headerRow then
                        iostream:write(headerColumn.."\n");
                    else
                        iostream:write(headerColumn.."\t");
                    end
                end
                for rowKey, row in pairs(file) do
                    for columnKey, column in pairs(row) do
                        if columnKey == #row then
                            iostream:write(column.."\n");
                        else
                            iostream:write(column.."\t");
                        end
                    end
                end
            elseif fileType == "xml" then

                -- Print out the non-duplicated container
                for index, row in pairs(self.Files[key][1]) do
                    iostream:write(row.."\n");
                end

                -- Print out the transformed variables
                for index, row in pairs(file) do
                    iostream:write(row.."\n");
                end

                -- Add the closing tags
                local reversedTable = ReversePairs(self.Files[key][1]);
                for index, row in pairs(reversedTable) do
                    if string.match(row, "<?xml") then
                        
                    else
                        local extractedTag = string.match(row, "<(.*)");
                        extractedTag = string.match(extractedTag, "(.*) ");
                        iostream:write("</"..extractedTag..">\n");
                    end
                end

            end
            iostream:close();
        end
    end
end

function LoadedData:RowMatchesFilters(fields, filters)
    for fieldIndex, field in pairs(fields) do
        if self:CheckIfFieldIsValid(fieldIndex, field, filters) == false then
            return false;
        end
    end
    return true;
end

function LoadedData:CheckIfFieldIsValid(fieldIndex, field, filters)
    local filtersForColumn = self:GetFiltersForColumn(fieldIndex, filters);
    -- If there aren't any filters then there must be no way this field
    -- is invalid
    if filtersForColumn == nil then
        return true;
    end

    -- But otherwise we need to apply the filter
    local isOr = false;
    local foundValidOr = false;
    for filterIndex, filter in pairs(filtersForColumn) do
        if filter.Operator == "AND" then
            local filterResult = self:ApplyFilterToField(filter, field);
            if filterResult == false then
                return false;
            end
        elseif filter.Operator == "OR" and foundValidOr == false then
            isOr = true;
            local filterResult = self:ApplyFilterToField(filter, field);
            if filterResult == true then
                foundValidOr = true;
            end
        end
    end

    if isOr == true and foundValidOr == false then
        return false;
    end
    -- Everything is valid
    return true;
end

function LoadedData:GetFiltersForColumn(fieldIndex, filters)
    return FindDataItemsInTable(filters, "ColumnNumber", {fieldIndex, });
end

function LoadedData:ApplyFilterToField(filter, fieldValue)
    if filter.Type == "MATCHVALUE" then
        return filter.Value == fieldValue;
    elseif string.match(filter.Type, "CONTAINSVALUESTEP") then
        local stepNumber = string.match(filter.Type, "CONTAINSVALUE(.*)");
        if string.match(fieldValue, self.PreviousRowsInOperation[stepNumber][tonumber(filter.Value)]) then
            return true;
        end
        return false;
    elseif filter.Type == "CONTAINSVALUE" then
        local match = string.match(fieldValue, filter.Value);
        return match ~= nil;
    elseif filter.Type == "UNIQUE" then
        for index, row in pairs(self.Files[self.CurrentActiveFile]) do
            if row[filter.ColumnNumber] == fieldValue then
                return false;
            end
        end
    elseif filter.Type == "TRANSFORMUNIQUE" then
        local currentTableData = self.TransformedFiles[self.CurrentTransformingFile];
        if currentTableData == nil then
            return true;
        end
        for index, row in pairs(currentTableData) do
            if row[filter.ColumnNumber] == fieldValue then
                return false;
            end
        end
    elseif string.match(filter.Type, "MATCHINGSTEP")  then
        local stepNumber = string.match(filter.Type, "MATCHING(.*)");
        if Any(self.PreviousRowsInOperation[stepNumber], tonumber(filter.Value), fieldValue) then
            return true;
        end
        return false;
    elseif string.match(filter.Type, "MATCHINGTRANSFORMEDSTEP") then
        local stepNumber = string.match(filter.Type, "MATCHINGTRANSFORMED(.*)");
        if Any(self.PreviousTransformedRowsInOperation[stepNumber], tonumber(filter.Value), fieldValue) then
            return true;
        end
        return false;
    end
    return true;
end

function LoadedData:TransformFiles()
    for fileKey, file in pairs(self.Files) do
        if self.TransformData[fileKey] ~= nil then
            self.CurrentActiveFile = fileKey;
            self.CurrentTransformStep = 1;
            local transformedFile = self:TransformFile(file, self.CurrentTransformStep);
            if self.TransformedFiles[fileKey] == nil then
                self.TransformedFiles[fileKey] = {};
            end
            ConcatTable(self.TransformedFiles[fileKey], transformedFile);
        end
    end
end

function LoadedData:TransformFile(file, transformStep)
    local transformedFile = {};
    local stepKey = "STEP"..tostring(transformStep);
    local fileTransformData = self.TransformData[self.CurrentActiveFile];
    local transformStepData = fileTransformData[stepKey];
    local firstRow = false;

    for rowIndex, row in pairs(file) do
        if firstRow == false then
            firstRow = true;
        else
            if transformStep == 1 then
                print("\n");
            end
            if transformStep == 1 then
                ClearTable(self.PreviousTransformedRowsInOperation);
                ClearTable(self.PreviousRowsInOperation);
                self.PreviousTransformedRowsInOperation[stepKey] = {};
                self.PreviousRowsInOperation[stepKey] = {};
            end
            --[[if self.PreviousTransformedRowsInOperation[stepKey] == nil then
                self.PreviousTransformedRowsInOperation[stepKey] = {};
            end
            if self.PreviousRowsInOperation[stepKey] == nil then
                self.PreviousRowsInOperation[stepKey] = {};
            end--]]

            if self:RowMatchesFilters(row, transformStepData.Filters) then
                -- One row could be transformed into several rows so we need to concat
                local newRow = self:TransformRow(row, transformStepData);
                if transformStepData.PostTransformFilters == nil
                or self:RowMatchesFilters(newRow, transformStepData.PostTransformFilters) then
                    --[[if transformStep == 1 then
                        print("ROW: "..tostring(rowIndex).." STEP"..tostring(transformStep).." "..newRow[3]);
                    elseif transformStep == 2 then
                        print("ROW: "..tostring(rowIndex).." STEP"..tostring(transformStep).." "..newRow[1]);
                    elseif transformStep == 3 then
                        print("ROW: "..tostring(rowIndex).." STEP"..tostring(transformStep).." "..newRow[2]);
                    elseif transformStep == 4 then
                        print("ROW: "..tostring(rowIndex).." STEP"..tostring(transformStep).." "..newRow[1]);
                    end--]]
                    if newRow ~= nil then
                        ConcatTable(transformedFile, {newRow});
                    end

                    -- Check if there are further transformations that need to be performed after this row
                    if transformStepData.NextTransformOperation ~= nil then
                        self.PreviousRowsInOperation[stepKey] = row;
                        self.PreviousTransformedRowsInOperation[stepKey] = newRow;
                        local currentStep = transformStep;
                        local currentTransformingFile = self.CurrentTransformingFile;
                        self:PrepareForNextTransformStep(fileTransformData[transformStepData.NextTransformOperation], transformStep);
                        self.CurrentTransformStep = currentStep;
                        self.CurrentTransformingFile = currentTransformingFile;
                        self.PreviousTransformedRowsInOperation[stepKey] = {};
                        self.PreviousRowsInOperation[stepKey] = {};
                    end

                    if transformStepData.PerformOnce == true then
                        break;
                    end
                end
            end
        end
    end
    return transformedFile;
end

function LoadedData:PrepareForNextTransformStep(nextTransformOperation, transformStep)
    local currentTransformStep = "STEP"..tostring(transformStep);

    local fileTransformData = self.TransformData[self.CurrentActiveFile];
    if fileTransformData[currentTransformStep] ~= nil then
        self.CurrentTransformStep = transformStep + 1;
    end

    self.CurrentTransformingFile = nextTransformOperation.FileName;
    local transformedFile = self:TransformFile(self.Files[nextTransformOperation.FileName], self.CurrentTransformStep);
    if self.TransformedFiles[nextTransformOperation.FileName] == nil then
        self.TransformedFiles[nextTransformOperation.FileName] = {};
    end

    print("Concatting transformed files for STEP"..tostring(self.CurrentTransformStep));
    ConcatTable(self.TransformedFiles[nextTransformOperation.FileName], transformedFile);
end

function LoadedData:TransformRow(row, transformOperation)
    local newRow = {};
    for transformIndex, transform in pairs(transformOperation.Transforms) do
        if transform.Type == "NEWROW" then
            local transformedColumns = {};
            -- Iterate over each column in the row
            for columnIndex, column in pairs(row) do
                local columnValue = "";

                local appliedTransform = false;
                for columnTransformIndex, columnTransform in pairs(transform.Columns) do
                    if columnTransform.ColumnNumber == columnIndex then
                        -- Operations allow for incremental building of transform data
                        if columnTransform.Operations ~= nil then
                            local operationValue = "";
                            for i = 1, columnTransform.NumberOfOperations do 
                                local subOperation = columnTransform.Operations["OPERATION"..i];
                                if operationValue == "" then
                                    operationValue = self:ApplyTransformToColumn(column, subOperation);
                                else
                                    operationValue = self:ApplyTransformToColumn(operationValue, subOperation);
                                end
                            end
                            columnValue = self:ApplyTransformToColumn(operationValue, columnTransform);
                        else
                            columnValue = self:ApplyTransformToColumn(column, columnTransform);
                        end
                        appliedTransform = true;
                    end
                end
                -- If there was no transform applied, then apply the default one
                -- the default transform where missing
                if appliedTransform == false then
                    columnValue = self:ApplyTransformToColumn(column, transformOperation.DefaultColumnTransformBehaviour);
                end
                transformedColumns[#transformedColumns + 1] = columnValue;
            end
            newRow = transformedColumns;
        elseif transform.Type == "XMLDUPLICATE" then
            local transformedString = row[1];
            for i=1, transform.NumberOfOperations do
                local operationString = "OPERATION"..tostring(i);
                local xmlOperation = transform.Operations[operationString];
                self.PreviousTransformedXMLOperations[operationString] = "";
                local replaceValue = self:ApplyTransformToColumn(xmlOperation.Type, xmlOperation);
                self.PreviousTransformedXMLOperations[operationString] = replaceValue;
                transformedString = transformedString:gsub(xmlOperation.Keyword, replaceValue);
            end
            newRow = transformedString;
        end
    end
    return newRow;
end

function LoadedData:ApplyTransformToColumn(column, columnTransform)
    if type(columnTransform) == 'table' then
       if columnTransform.Type == "SELECTEXISTING" then
            return column;
        elseif columnTransform.Type == "REPLACE" then
            return columnTransform.Value;
        elseif string.match(columnTransform.Type, "REPLACEWITHTRANSFORMEDSTEP")  then
            local stepNumber = string.match(columnTransform.Type, "REPLACEWITHTRANSFORMED(.*)");
            local existingData = self.PreviousTransformedRowsInOperation[stepNumber];
            if existingData ~= nil then
                return existingData[tonumber(columnTransform.Value)];
            end
        elseif string.match(columnTransform.Type, "REPLACEWITH") then
            local replaceValue = string.match(columnTransform.Type, "REPLACEWITH(.*)");
            column = column:gsub(replaceValue, columnTransform.Value);
            return column;
        elseif columnTransform.Type == "APPEND" then
            if string.match(columnTransform.Value, "REPLACEWITHOPERATION") then
                local operationNumber = string.match(columnTransform.Value, "REPLACEWITH(.*)");
                return column..self.PreviousTransformedXMLOperations[operationNumber];
            end
            return column..columnTransform.Value;
        elseif columnTransform.Type == "PREPEND" then
            return columnTransform.Value..column;
        elseif string.match(columnTransform.Type, "MATCHINGSTEP") then
            local stepNumber = string.match(columnTransform.Type, "MATCHING(.*)");
            local existingData = self.PreviousRowsInOperation[stepNumber][tonumber(columnTransform.Value)];
            return existingData;
        elseif columnTransform.Type == "APPENDWITHSTEP" then
            local stepNumber = string.match(columnTransform.Type, "APPENDWITH(.*)");
            local existingData = FindMatchingData(self.PreviousRowsInOperation[stepNumber], tonumber(columnTransform.Value), column);
            local appendValue = "_"..existingData[tonumber(columnTransform.Value)];
            return column..appendValue;
        elseif columnTransform.Type == "NUMERICID" then
            local newID = columnTransform.Value..tostring(self.IDCounter);
            self.IDCounter = self.IDCounter + 1;
            return newID;
        elseif columnTransform.Type == "JOIN" then
            local finalJoinValue = self:GetJoinValue(columnTransform);
            return finalJoinValue;
        elseif columnTransform.Type == "GETNONBLANKRESULTFROMOPTIONS" then
            local transformedValue = "";
            for optionIndex, option in pairs(columnTransform.Options) do
                transformedValue = self:ApplyTransformToColumn(transformedValue, option);
                if transformedValue ~= "" then
                    break;
                end
            end
            return transformedValue;
        elseif string.match(columnTransform.Type, "REPLACEWITHOPERATION") then
            local transformedValue = "";
            return transformedValue;
        elseif string.match(columnTransform.Type, "DATAMAP") then
            local mapKey = string.match(columnTransform.Type, "DATAMAP(.*)");
            local map = _G[mapKey];
            local checkValue = self:ApplyTransformToColumn(column, columnTransform.Value);
            for key, value in pairs(map) do
                -- statements
                if string.match(checkValue, key) then
                    return value;
                end
            end
            return "";
        elseif columnTransform.Type == "REPLACEWITHSUBOPERATION" then
            local transformedValue = "";
            for xmlSubOperationIndex, xmlSubOperation in pairs(columnTransform.SubOperations) do
                transformedValue = self:ApplyTransformToColumn(transformedValue, xmlSubOperation);
            end
            return transformedValue;
        end
    else
        if columnTransform == "SELECTEXISTING" then
            return column;
        elseif string.match(columnTransform, "REPLACEWITHOPERATION") then
            local operationNumber = string.match(columnTransform, "REPLACEWITH(.*)");
            return self.PreviousTransformedXMLOperations[operationNumber];
        elseif columnTransform == "SELECTNONE" then
            return "";
        end
    end
    -- We shouldn't get here but just in case return the existing value
    -- by default
    return column;
end

function LoadedData:GetJoinValue(transformData)
    local valueToJoinOn = self:ApplyTransformToColumn("", transformData.SourceColumn);
    local finalValue = self:PerformJoin(transformData.Value, valueToJoinOn);
    return finalValue;
end

function LoadedData:PerformJoin(transformData, value)
    local fileToJoinOn = self.Files[transformData.File];
    local matchingRow = FindMatchingData(fileToJoinOn, tonumber(transformData.TargetColumn), value);
    local columnValue = matchingRow[tonumber(transformData.ReturnColumn)];
    if type(transformData.Value) == "table" then
        return self:PerformJoin(transformData.Value, columnValue);
    end
    return columnValue;
end
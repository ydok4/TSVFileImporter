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

    PreviousLuaParents = {};

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
        if not filter.ExportAsLua then
            self:LoadFile(key, filter);
        end
    end
end

function LoadedData:LoadFile(key, filter)
    local file = {};
    if filter.Directory ~= nil then
        file = assert(io.open(filter.Directory.."/"..filter.FileName, "r"));
    else
        file = assert(io.open("VanillaTSVs/"..filter.FileName, "r"));
    end
    local fileExtension = GetFileExtension(filter.FileName);
    self.Files[key] = {};
    self.CurrentActiveFile = key;

    if fileExtension == "tsv" then
        local lineNumber = 1;
        for line in file:lines() do
            local fields = Split(line, "\t");
            local matchesFilter = self:RowMatchesFilters(fields, filter.Filter);
            if lineNumber <= 2 or matchesFilter == true then
                table.insert(self.Files[key], fields);
            end

            if filter.OnlyLoadHeader == true then
                break;
            end

            lineNumber = lineNumber + 1;
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
        table.insert(self.Files[key], container);
        table.insert(self.Files[key], {ConvertTableValuesToString(elementsWithinRoot)});
    elseif fileExtension == "lua" then
        self.Files[key] = {};
        table.insert(self.Files[key], "--Adding some placeholder");
        table.insert(self.Files[key], "--lines");
    end

    file:close();
end

function LoadedData:WriteFiles()
    for key, file in pairs(self.TransformedFiles) do
        local filterData = self.FilterData[key];
        if filterData.OutputFile == true then
            local fileType = GetFileExtension(filterData.FileName);
            local outputFileName = RemoveFileExtension(filterData.FileName);

            local directoryPath = "";
            outputFileName = "out/"..directoryPath..outputFileName.."_new."..fileType;

            local iostream = assert(io.open(outputFileName, "w+"));
            if fileType == "tsv" then
                local headerRow = self.Files[key][1];
                for headerIndex, headerColumn in pairs(headerRow) do
                    if headerIndex == #headerRow then
                        iostream:write(headerColumn.."\n");
                    else
                        iostream:write(headerColumn.."\t");
                    end
                end
                local columnKeyRow = self.Files[key][2];
                for columnIndex, columnKeyColumn in pairs(columnKeyRow) do
                    if columnIndex == #columnKeyRow then
                        iostream:write(columnKeyColumn.."\n");
                    else
                        iostream:write(columnKeyColumn.."\t");
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

            elseif fileType == "lua" then
                local luaData = filterData.LuaData;
                -- We use this to keep track of the
                -- keys we've outputted
                local addedKeys = {};
                -- Print out the parent variable
                if luaData.RootName ~= nil then
                    iostream:write(luaData.RootName.." = {\n");
                else
                    iostream:write(key.." = {\n");
                end

                -- print out all the values as lua
                for rowIndex, row in pairs(file) do
                    if addedKeys[row[luaData.KeyColumn]] == nil then
                        OutputTabsForDepth(iostream, 1);
                        local keyValue = row[luaData.KeyColumn];
                        OutputKey(iostream, keyValue);
                        iostream:write(" = {\n");
                        -- Find all values which match the key in case there are duplicates
                        local firstKey = row[luaData.KeyColumn];
                        local foundFirstInstance = false;
                        local duplicateKeys = {};
                        for rowIndex2, row2 in pairs(file) do
                            if row2[luaData.KeyColumn] == firstKey then
                                duplicateKeys[#duplicateKeys + 1] = row2;
                            end
                        end

                        self.PreviousLuaParents[0]  = {
                            ColumnIndex = luaData.KeyColumn,
                            ColumnValue = keyValue,
                        };
                        self:PrintOutNestedColumns(iostream, luaData, luaData.ColumnNames, duplicateKeys, 2);
                        self.PreviousLuaParents[0] = nil;
                        addedKeys[row[luaData.KeyColumn]] = true;
                    end
                end

                -- Close the parent variable
                iostream:write("}");
            end
            iostream:close();
        end
    end
end

function LoadedData:PrintOutNestedColumns(iostream, luaData, columnParent,  duplicateKeys, depth)
    if #duplicateKeys > 0 and columnParent ~= nil then
        for index, outputColumnData in pairs(columnParent) do
            local keyNameIndex  = -1;
            if string.match(outputColumnData.KeyName, "COLUMN") then
                keyNameIndex = tonumber(string.match(outputColumnData.KeyName, "COLUMN(.*)"));
            end

            if outputColumnData.AsTableItem and not outputColumnData.SingleValue then
                OutputTabsForDepth(iostream, depth);
                OutputKey(iostream, outputColumnData.KeyName);
                iostream:write(" = {\n");
            end

            local insertedKeys = {};
            local firstRecord = true;
            for duplicateKeyIndex, duplicateRow in pairs(duplicateKeys) do
                if (outputColumnData.AllowDuplicates or not insertedKeys[duplicateRow[outputColumnData.TableColumn]]) and self:MatchesLuaParents(duplicateRow) then
                    local columnValue = duplicateRow[outputColumnData.TableColumn];
                    local keyName = outputColumnData.KeyName;
                    if keyNameIndex ~= -1 then
                        keyName = duplicateRow[keyNameIndex];
                        keyName = keyName:gsub("'", "_");
                        keyName = keyName:gsub("%s+", "");
                        keyName = keyName:gsub("-", "_");
                        keyName = keyName:gsub("é", "e");
                        keyName = keyName:gsub("‘", "_");
                        keyName = keyName:gsub(",", "_");

                        if keyName == "" then
                            keyName = keyName:gsub("", "_");
                        end
                    end

                    if outputColumnData.SingleValue == true and outputColumnData.AsTableItem == true then
                        OutputTabsForDepth(iostream, depth);
                        OutputKey(iostream, keyName);
                        iostream:write(" = \""..duplicateRow[outputColumnData.TableColumn].."\",\n");
                    elseif outputColumnData.SingleValue == true then
                        OutputTabsForDepth(iostream, depth);
                        OutputKey(iostream, keyName);
                        iostream:write(" = \""..duplicateRow[outputColumnData.TableColumn].."\",\n");
                    elseif outputColumnData.AsTableItem then
                        if outputColumnData.NestedColumns == nil then
                            if firstRecord == true then
                                OutputTabsForDepth(iostream, depth + 1);
                                firstRecord = false;
                            end
                            iostream:write(" \""..columnValue.."\",");
                        else
                            OutputTabsForDepth(iostream, depth + 1);
                            OutputKey(iostream, columnValue);
                            iostream:write(" = {\n");
                            self.PreviousLuaParents[depth] = {
                                ColumnIndex = outputColumnData.TableColumn,
                                ColumnValue = duplicateRow[outputColumnData.TableColumn],
                            };
                            self:PrintOutNestedColumns(iostream, luaData, outputColumnData.NestedColumns, duplicateKeys, depth + 2);
                            self.PreviousLuaParents[depth] = nil;
                        end
                    elseif not outputColumnData.AsTableItem then
                        OutputTabsForDepth(iostream, depth);
                        OutputKey(iostream, columnValue);
                        iostream:write(" = {\n");
                        self.PreviousLuaParents[depth] = {
                            ColumnIndex = outputColumnData.TableColumn,
                            ColumnValue = duplicateRow[outputColumnData.TableColumn],
                        };
                        self:PrintOutNestedColumns(iostream, luaData, outputColumnData.NestedColumns, duplicateKeys, depth + 1);
                        self.PreviousLuaParents[depth] = nil;
                    end

                    insertedKeys[duplicateRow[outputColumnData.TableColumn]] = true;
                end
            end

            if outputColumnData.AsTableItem == true and not outputColumnData.SingleValue then
                iostream:write("\n");
                OutputTabsForDepth(iostream, depth);
                iostream:write("},\n");
            end
        end
        OutputTabsForDepth(iostream, depth - 1)
        iostream:write("},\n");
    end
end

function LoadedData:MatchesLuaParents(row)
    for key, value in pairs(self.PreviousLuaParents) do
        if not row[value.ColumnIndex] or row[value.ColumnIndex] ~= value.ColumnValue then
            return false;
        end
    end
    return true;
end

function LoadedData:RowMatchesFilters(fields, filters)
    if #filters == 0 then
        return true;
    end

    local isOrRowOperator = false;
    for fieldIndex, field in pairs(fields) do
        local filtersForColumn = self:GetFiltersForColumn(fieldIndex, filters);
        local isFieldValid = self:CheckIfFieldIsValid(field, filtersForColumn);
        local isFieldConditionOr = false;
        if filtersForColumn then
            for filterIndex, filterData in pairs(filtersForColumn) do
                if filterData.RowOperator == "OR" then
                    isFieldConditionOr = true;
                    isOrRowOperator = true;
                end
            end
        end
        if isFieldConditionOr == false and isFieldValid == false then
            return false;
        elseif isFieldConditionOr == true and isFieldValid == true then
            return true;
        end
    end

    -- If we reach this point with an OR operator this means
    -- none of the or conditions are true
    if isOrRowOperator == true then
        return false;
    end

    return true;
end

function LoadedData:CheckIfFieldIsValid(field, filtersForColumn)
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
    elseif string.match(filter.Type, "ISVALUESTEP") then
        local stepNumber = string.match(filter.Type, "ISVALUE(.*)");
        if (fieldValue == self.PreviousRowsInOperation[stepNumber][tonumber(filter.Value)]) then
            return true;
        end
        return false;
    elseif string.match(filter.Type, "CONTAINSVALUESTEP") then
        local stepNumber = string.match(filter.Type, "CONTAINSVALUE(.*)");
        if string.match(fieldValue, self.PreviousRowsInOperation[stepNumber][tonumber(filter.Value)]) then
            return true;
        end
        return false;
    elseif string.match(filter.Type, "CONTAINSTRANSFORMEDVALUESTEP") then
        local stepNumber = string.match(filter.Type, "CONTAINSTRANSFORMEDVALUE(.*)");
        local stepColumn = -1;
        local concatString = "";
        if string.match(filter.Value, "+") then
            stepColumn = tonumber(string.match(filter.Value, "(.*)+"));
            concatString = string.match(filter.Value, "+(.*)");
        else
            stepColumn = tonumber(filter.Value);
        end
        local stepValue = self.PreviousTransformedRowsInOperation[stepNumber][stepColumn];
        if stepValue ~= '' and string.match(fieldValue, stepValue) then
            if concatString == "" or string.match(fieldValue, stepValue..concatString) then
                return true;
            end
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
            local transformedFile = self:TransformFile(file, self.FilterData[fileKey], self.CurrentTransformStep);
            if self.TransformedFiles[fileKey] == nil then
                self.TransformedFiles[fileKey] = {};
            end
            ConcatTable(self.TransformedFiles[fileKey], transformedFile);
        end
    end
end

function LoadedData:TransformFile(file, filter, transformStep)
    local transformedFile = {};
    local stepKey = "STEP"..tostring(transformStep);
    local fileTransformData = self.TransformData[self.CurrentActiveFile];
    local transformStepData = fileTransformData[stepKey];
    local firstRow = false;

    if filter.ExportAsLua then
        file = {};
        file[#file + 1] = {"dummy", "data"};
        file[#file + 1] = {"dummy", "data"};
        file[#file + 1] = {"dummy", "data"};
    end

    for rowIndex, row in pairs(file) do
        if transformStep == 1 then
            --local test = "";
        end
        if rowIndex <= 2 and filter.Directory ~= "PortraitGenerator" then
            firstRow = true;
        elseif rowIndex ~= 1 then
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

            if transformStepData.IgnoreFilter == true or self:RowMatchesFilters(row, transformStepData.Filters) then
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
    local transformedFile = self:TransformFile(self.Files[nextTransformOperation.FileName], self.FilterData[nextTransformOperation.FileName], self.CurrentTransformStep);
    if self.TransformedFiles[nextTransformOperation.FileName] == nil then
        self.TransformedFiles[nextTransformOperation.FileName] = {};
    end

    print("Concatting transformed files for STEP"..tostring(self.CurrentTransformStep));
    ConcatTable(self.TransformedFiles[nextTransformOperation.FileName], transformedFile);
end

function LoadedData:TransformRow(row, transformOperation)
    local newRow = {};
    for transformIndex, transform in pairs(transformOperation.Transforms) do
        if string.match(transform.Type, "COPYTABLE") then
            local stepNumber = string.match(transform.Type, "COPYTABLE(.*)");
            local transformedStepRow = self.PreviousTransformedRowsInOperation[stepNumber];
            transformedStepRow = self:TransformColumns(transformedStepRow, transform, transformOperation);
            return transformedStepRow;
        elseif transform.Type == "CREATETABLE" then
            newRow = self:CreateTable(transform, transformOperation);
        elseif transform.Type == "NEWROW" then
            newRow = self:TransformColumns(row, transform, transformOperation);
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

function LoadedData:CreateTable(transform, transformOperation)
    local newRow = self:CreateColumns(transform, transformOperation);
    return newRow;
end

function LoadedData:TransformColumns(row, transform, transformOperation)
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

    return transformedColumns;
end

function LoadedData:CreateColumns(transform, transformOperation)
    local newRow = {};
    for columnTransformIndex, columnTransform in pairs(transform.Columns) do
        if columnTransform.Index == columnTransformIndex then
            local columnValue = self:ApplyTransformToColumn("", columnTransform);
            newRow[#newRow + 1] = columnValue;
        end
    end
    return newRow;
end

function LoadedData:ApplyTransformToColumn(column, columnTransform)
    if type(columnTransform) == 'table' then
       if columnTransform.Type == "SELECTEXISTING" then
            return column;
        elseif columnTransform.Type == "REPLACEIFVALUE" then
            return columnTransform.Value;
        elseif columnTransform.Type == "REPLACE" then
            return columnTransform.Value;
        elseif string.match(columnTransform.Type, "REPLACEWITHTRANSFORMEDSTEP")  then
            local stepNumber = string.match(columnTransform.Type, "REPLACEWITHTRANSFORMED(.*)");
            local existingData = self.PreviousTransformedRowsInOperation[stepNumber];
            if existingData ~= nil then
                return existingData[tonumber(columnTransform.Value)];
            end
        elseif string.match(columnTransform.Type, "REPLACEWITHSTEP") then
            local stepNumber = string.match(columnTransform.Type, "REPLACEWITH(.*)");
            local existingData = self.PreviousRowsInOperation[stepNumber];
            if existingData ~= nil then
                return existingData[tonumber(columnTransform.Value)];
            end
        elseif columnTransform.Type == "REPLACEWITHSUBOPERATION" then
            local transformedValue = "";
            for xmlSubOperationIndex, xmlSubOperation in pairs(columnTransform.SubOperations) do
                transformedValue = self:ApplyTransformToColumn(transformedValue, xmlSubOperation);
            end
            return transformedValue;
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
            if string.match(columnTransform.Value, "KEYISINOPERATION") then
                for key, value in pairs(map) do
                    -- statements
                    if string.match(checkValue, key) then
                        return value;
                    end
                end
            else
                for key, value in pairs(map) do
                    -- statements
                    if checkValue == key then
                        return value;
                    end
                end
            end
            return column;
        end
    else
        if columnTransform == "SELECTEXISTING" then
            return column;
        elseif string.match(columnTransform, "REPLACEWITHOPERATION") then
            local operationNumber = string.match(columnTransform, "REPLACEWITH(.*)");
            return self.PreviousTransformedXMLOperations[operationNumber];
        elseif string.match(columnTransform, "KEYISINOPERATION") then
            local operationNumber = string.match(columnTransform, "KEYISIN(.*)");
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
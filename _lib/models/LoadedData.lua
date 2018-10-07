LoadedData = {
    IDCounter = 0,
    Files = {},
    CurrentActiveFile = "",
    CurrentTransformStep = "",
    CurrentTransformingFile = "",
    TransformedFiles = {},

    LastTransformedRow = {},
    PreviousStepRow = {},

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
        self:LoadFile(filter.FileName, filter.Filter);
    end
end

function LoadedData:LoadFile(filePath, filter)
    local file = assert(io.open(filePath, "r"));

    local firstLine = true;
    local splitFileName = RemoveFileExtension(filePath);
    self.Files[splitFileName] = {};
    self.CurrentActiveFile = splitFileName;
    for line in file:lines() do
        local fields = Split(line, "\t");
        local matchesFilter = self:RowMatchesFilters(fields, filter);
        if firstLine == true or matchesFilter == true then
            table.insert(self.Files[splitFileName], fields);
            firstLine = false;
        end
    end
    file:close();
end

function LoadedData:WriteFiles()
    for key, file in pairs(self.TransformedFiles) do
        local iostream = assert(io.open("out/"..key.."_new.tsv", "w+"));
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
        iostream:close();
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
    elseif filter.Type == "MATCHINGORIGINALPREVIOUSSTEP" then
        if self.PreviousStepRow[tonumber(filter.Value)] == fieldValue then
            return true;
        end
        return false;
    elseif filter.Type == "MATCHINGTRANSFORMEDPREVIOUSSTEP" then
        if self.LastTransformedRow[1][tonumber(filter.Value)] == fieldValue then
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
            self.CurrentTransformStep = "Step1";
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
    local fileTransformData = self.TransformData[self.CurrentActiveFile];
    local transformStepData = fileTransformData[transformStep];
    local firstRow = false;

    
    for rowIndex, row in pairs(file) do
        if firstRow == false then
            firstRow = true;
        else
            if self:RowMatchesFilters(row, transformStepData.Filters) then
                -- One row could be transformed into several rows so we need to concat
                local newRows = self:TransformRow(row, transformStepData);
                if transformStepData.PostTransformFilters == nil
                or self:RowMatchesFilters(newRows[1], transformStepData.PostTransformFilters) then
                    if newRows ~= nil then
                        ConcatTable(transformedFile, newRows);
                    end
                    -- Check if there are further transformations that need to be performed after this row
                    if transformStepData.NextTransformOperation ~= nil then
                        local scopePreviousStepRow = self.PreviousStepRow;
                        self.PreviousStepRow = row;
                        local lastTransformedRowInScope = self.LastTransformedRow;
                        self:PrepareForNextTransformStep(fileTransformData[transformStepData.NextTransformOperation], newRows);
                        self.LastTransformedRow = lastTransformedRowInScope;
                        self.PreviousStepRow = scopePreviousStepRow;
                        self.CurrentTransformStep = transformStep;
                    end

                end
            end
        end
    end
    self.PreviousStepRow = nil;
    self.LastTransformedRow = nil;
    return transformedFile;
end

function LoadedData:PrepareForNextTransformStep(nextTransformOperation, rows)
    self.LastTransformedRow = rows;
    if self.CurrentTransformStep == "Step1" then
        self.CurrentTransformStep = "Step2";
    elseif self.CurrentTransformStep == "Step2" then
        self.CurrentTransformStep = "Step3";
    elseif self.CurrentTransformStep == "Step3" then
        self.CurrentTransformStep = "Step4";
    end
    self.CurrentTransformingFile = nextTransformOperation.FileName;
    local transformedFile = self:TransformFile(self.Files[nextTransformOperation.FileName], self.CurrentTransformStep);
    if self.TransformedFiles[nextTransformOperation.FileName] == nil then
        self.TransformedFiles[nextTransformOperation.FileName] = {};
    end
    ConcatTable(self.TransformedFiles[nextTransformOperation.FileName], transformedFile);
end

function LoadedData:TransformRow(row, transformOperation)
    local newRows = {};
    for transformIndex, transform in pairs(transformOperation.Transforms) do
        if transform.Type == "NEWROW" then
            local transformedColumns = {};
            -- Iterate over each column in the row
            for columnIndex, column in pairs(row) do
                local columnValue = "";

                local appliedTransform = false;
                for columnTransformIndex, columnTransform in pairs(transform.Columns) do
                    if columnTransform.ColumnNumber == columnIndex then
                        columnValue = self:ApplyTransformToColumn(column, columnTransform);
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
            newRows[#newRows + 1] = transformedColumns;
        end
    end
    return newRows;
end

function LoadedData:ApplyTransformToColumn(column, columnTransform)
    if type(columnTransform) == 'table' then
        if columnTransform.Type == "REPLACE" then
            return columnTransform.Value;
        elseif columnTransform.Type == "APPEND" then
            return column..columnTransform.Value;
        elseif columnTransform.Type == "PREPEND" then
            return columnTransform.Value..column;
        elseif columnTransform.Type == "MATCHINGPREVIOUSSTEP" then
            return columnTransform.Value..column;
        elseif columnTransform.Type == "SUBSTITUTEWITHPREVIOUSSTEP" then
            local subValue = self.LastTransformedRow[1][tonumber(columnTransform.Value)];
            return column:gsub(self.PreviousStepRow[columnTransform.ColumnNumber], subValue);
        elseif columnTransform.Type == "APPENDWITHPREVIOUSSTEP" then
            local appendValue = "_"..self.LastTransformedRow[1][tonumber(columnTransform.Value)];
            return column..appendValue;
        elseif columnTransform.Type == "REPLACEWITHPREVIOUSSTEP" then
            return self.LastTransformedRow[1][tonumber(columnTransform.Value)];
        elseif columnTransform.Type == "NUMERICID" then
            local newID = columnTransform.Value..tostring(self.IDCounter);
            self.IDCounter = self.IDCounter + 1;
            return newID;
        end
    else
        if columnTransform == "SELECTEXISTING" then
            return column;
        end
    end
    -- We shouldn't get here but just in case return the existing value
    -- by default
    return column;
end
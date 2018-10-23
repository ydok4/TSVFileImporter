function FindDataItemsInTable(table, field, values)
    local items = {};
    for key1,tableItem in pairs(table) do 
      for key2,value in pairs(values) do
        if tableItem[field] then 
          if type(tableItem[field]) == 'table' then
            if AreValuesInList(tableItem[field], values) then
              items[#items + 1] = tableItem;
              break;
            end
          elseif tableItem[field] == value then
            items[#items + 1] = tableItem;
            break;
          end
        end
      end
    end
    if #items == 0 then
      return nil;
    end
    return items;
  end

  function ConcatTable(destinationTable, sourceTable)
    if type(sourceTable) == "table" then
      for key, value in pairs(sourceTable) do
          destinationTable[#destinationTable + 1] = value;
      end
    else
      destinationTable[#destinationTable + 1] = sourceTable;
    end
end

function ClearTable(sourceTable)
  for key, value in pairs(sourceTable) do
    sourceTable[key] = nil;
  end
end

function Contains(sourceTable, checkValue)
  for key, value in pairs(sourceTable) do
    if value == checkValue then
      return true;
    end
  end
  return false;
end

function Any(sourceTable, columnIndex, value)
  if table == nil then
    return false;
  end
  return sourceTable[columnIndex] == value;
end

function FindMatchingData(sourceTable, columnIndex, value)
  if table == nil then
    return nil;
  end
  if type(sourceTable) == "table" then
    for key, row in pairs(sourceTable) do
      if row[columnIndex] ~= nil and row[columnIndex] == value  then
        return row
      end
    end
    return nil;
  elseif sourceTable[columnIndex] == value then
    return sourceTable;
  end
  return nil;
end

function ContainsData(sourceTable, columnIndex, value)
  if table == nil then
    return nil;
  end
  if type(sourceTable) == "table" then
    for key, row in pairs(sourceTable) do
      if row[columnIndex] ~= nil and string.match(row[columnIndex], value)  then
        return row
      end
    end
    return nil;
  elseif sourceTable[columnIndex] == value then
    return sourceTable;
  end
  return nil;
end

function ConvertTableValuesToString(sourceTable)
  local newString = "";
  for key, value in pairs(sourceTable) do
    newString = newString..value;
  end
  return newString;
end

function ContainsXMLRoot(line, rootValue)
  return string.match(line, "<"..rootValue);
end

function ReversePairs(sourceTable)
  local reversedTable = {};
  for i = #sourceTable, 1, -1 do
    reversedTable[#reversedTable + 1] = sourceTable[i];
  end

  return reversedTable;
end
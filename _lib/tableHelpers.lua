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
    for key, value in pairs(sourceTable) do
        destinationTable[#destinationTable + 1] = value;
    end
end
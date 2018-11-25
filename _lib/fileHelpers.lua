require '_lib/models/LoadedData'

function Split(s, delimiter)
    local result = {};
    for match in (s..delimiter):gmatch("(.-)"..delimiter) do
      result[#result + 1] = match;
    end
    return result;
end

function RemoveFileExtension(fileName)
  return fileName:match("(.+)%..+");
end

function GetFileExtension(fileName)
  return fileName:match("[^.]+$");
end

function OutputTabsForDepth(iostream, depth)
  for i = 1, depth do
    iostream:write("\t");
  end
end

function OutputKey(iostream, value)
  local number = tonumber(value);
  if type(number) == "number" then
    iostream:write("\""..value.."\"");
  else
      value = value:gsub("'", "_");
      value = value:gsub("%s+", "");
      value = value:gsub("-", "_");
      value = value:gsub("é", "e");
      value = value:gsub("‘", "_");
      value = value:gsub(",", "_");
      iostream:write(value);
  end
end
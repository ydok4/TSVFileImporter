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
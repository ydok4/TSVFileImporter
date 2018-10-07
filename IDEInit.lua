require '_lib/fileHelpers'
require '_lib/tableHelpers'
require '_lib/filteringHelpers'

-- Grab filters.
local filterData = GetFilters("RebelLeadersFilters");
local transformData = GetTransforms("RebelLeadersTransforms");

local loadedData = LoadedData:new({
    IDCounter = 0,
    Files = {},
    CurrentActiveFile = "",
    TransformedFiles = {},

    TransformData = transformData,
    FilterData = filterData,
});


loadedData:AddFiles();

loadedData:TransformFiles();

loadedData:WriteFiles();
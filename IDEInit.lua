require '_lib/fileHelpers'
require '_lib/tableHelpers'
require '_lib/filteringHelpers'
require '_lib/DataMaps/CULTURESTRINGS'

-- Grab filters.
local filterData = GetFilters("RebelLeadersFilters");
local transformData = GetTransforms("RebelLeadersTransforms");

local loadedData = LoadedData:new({
    IDCounter = 0,
    Files = {},
    CurrentActiveFile = "",
    TransformedFiles = {},
    TransformedSteps = {},
    TransformData = transformData,
    PreviousTransformedRowsInOperation = {},
    PreviousTransformedXMLOperations = {},
    PreviousRowsInOperation = {},
    FilterData = filterData,
});


loadedData:AddFiles();

loadedData:TransformFiles();

loadedData:WriteFiles();
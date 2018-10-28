require '_lib/fileHelpers'
require '_lib/tableHelpers'
require '_lib/filteringHelpers'

require '_lib/DataMaps/CULTURESTRINGS'
require '_lib/DataMaps/SKILLICONSTOTRAITS'
require '_lib/DataMaps/SUBTYPESTOARTSETS'

-- Grab filters.
local filterData = GetFilters("EffectLocFilters");
local transformData = GetTransforms("EffectLocTransforms");

local loadedData = LoadedData:new({
    IDCounter = 0,
    Files = {},
    CurrentActiveFile = "",
    TransformedFiles = {},
    TransformedSteps = {},
    PreviousTransformedRowsInOperation = {},
    PreviousTransformedXMLOperations = {},
    PreviousRowsInOperation = {},

    TransformData = transformData,
    FilterData = filterData,
});


loadedData:AddFiles();

loadedData:TransformFiles();

loadedData:WriteFiles();
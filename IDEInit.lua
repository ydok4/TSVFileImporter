require '_lib/fileHelpers'
require '_lib/tableHelpers'
require '_lib/filteringHelpers'

require '_lib/DataMaps/CULTURESTRINGS'
require '_lib/DataMaps/SKILLICONSTOTRAITS'
require '_lib/DataMaps/SUBTYPESTOARTSETS'
require '_lib/DataMaps/INDEXTOGENDER'

-- URP Unit Effect Content
local filterData = GetFilters("UnitCapEffectFilters");
local transformData = GetTransforms("UnitCapEffectTransforms");

-- Name Resource Content
--local filterData = GetFilters("NameResourcesFilters");
--local transformData = GetTransforms("NameResourcesTransforms");

-- Name group Resource Content
--local filterData = GetFilters("CulturesToNameGroupsFilters");
--local transformData = GetTransforms("CulturesToNameGroupsTransforms");

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
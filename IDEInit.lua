require '_lib/fileHelpers'
require '_lib/tableHelpers'
require '_lib/filteringHelpers'

require '_lib/DataMaps/CULTURESTRINGS'
require '_lib/DataMaps/SKILLICONSTOTRAITS'
require '_lib/DataMaps/SUBTYPESTOARTSETS'
require '_lib/DataMaps/INDEXTOGENDER'

-- URP Unit Effect Content
--local filterData = GetFilters("UnitCapEffectFilters");
--local transformData = GetTransforms("UnitCapEffectTransforms");

-- URP Unit Cap Building Content
--local filterData = GetFilters("UnitCapBuildingFilters");
--local transformData = GetTransforms("UnitCapBuildingTransforms");

-- Cataph TEB URP Unit Effect Content
--local filterData = GetFilters("CataphTEBUnitCapEffectFilters");
--local transformData = GetTransforms("UnitCapEffectTransforms");

-- Cataph TEB URP Unit Cap Building Content
--local filterData = GetFilters("CataphTEBBuildingCapFilters");
--local transformData = GetTransforms("UnitCapBuildingTransforms");

-- Cataph Hobo URP Unit Effect Content
--local filterData = GetFilters("CataphHoboUnitCapEffectFilters");
--local transformData = GetTransforms("UnitCapEffectTransforms");

-- Cataph Hobo URP Unit Cap Building Content
--local filterData = GetFilters("CataphHoboBuildingCapFilters");
--local transformData = GetTransforms("UnitCapBuildingTransforms");

-- CTT URP Unit Effect Content
--local filterData = GetFilters("CTTUnitCapEffectFilters");
--local transformData = GetTransforms("UnitCapEffectTransforms");

-- Cataph Kraka Drak URP Unit Effect Content
--local filterData = GetFilters("CataphKrakaDrakUnitCapEffectFilters");
--local transformData = GetTransforms("UnitCapEffectTransforms");

-- Cataph Kraka Drak URP Unit Resource Content
--local filterData = GetFilters("CataphKrakaDrakUnitCapResourceFilters");
--local transformData = GetTransforms("UnitCapResourceTransforms");

-- Cataph Kraka Drak URP Unit Cap Building Content
--local filterData = GetFilters("CataphKrakaDrakBuildingCapFilters");
--local transformData = GetTransforms("UnitCapBuildingTransforms");

-- Cataph Sea Helms URP Unit Effect Content
--local filterData = GetFilters("CataphSeaHelmsUnitCapEffectFilters");
--local transformData = GetTransforms("UnitCapEffectTransforms");

-- Cataph Sea Helms URP Unit Resource Content
--local filterData = GetFilters("CataphSeaHelmsUnitCapResourceFilters");
--local transformData = GetTransforms("UnitCapResourceTransforms");

-- Cataph Sea Helms URP Unit Cap Building Content
--local filterData = GetFilters("CataphSeaHelmsBuildingCapFilters");
--local transformData = GetTransforms("UnitCapBuildingTransforms");

-- Mixus Mousillon URP Unit Effect Content
--local filterData = GetFilters("MixusMousillonUnitCapEffectFilters");
--local transformData = GetTransforms("UnitCapEffectTransforms");

-- Mixus Mousillon URP Unit Resource Content
--local filterData = GetFilters("MixusMousillonUnitCapResourceFilters");
--local transformData = GetTransforms("UnitCapResourceTransforms");

-- Mixus Mousillon URP Unit Cap Building Content
--local filterData = GetFilters("MixusMousillonBuildingCapFilters");
--local transformData = GetTransforms("UnitCapBuildingTransforms");

-- URP Unit Cap Resource Content
--local filterData = GetFilters("UnitCapResourceFilters");
--local transformData = GetTransforms("UnitCapResourceTransforms");

-- Mixu name Resource Content
--local filterData = GetFilters("MixuNameResourcesFilters");
--local transformData = GetTransforms("NameResourcesTransforms");

-- Name name group Resource Content
--local filterData = GetFilters("MixuCulturesToNameGroupsFilters");
--local transformData = GetTransforms("CulturesToNameGroupsTransforms");

-- Name Resource Content
--local filterData = GetFilters("NameResourcesFilters");
--local transformData = GetTransforms("NameResourcesTransforms");

-- Name group Resource Content
--local filterData = GetFilters("CulturesToNameGroupsFilters");
--local transformData = GetTransforms("CulturesToNameGroupsTransforms");

-- Cataph Name Resource Content
--local filterData = GetFilters("CataphNameResourcesFilters");
--local transformData = GetTransforms("NameResourcesTransforms");

-- Cataph Name group Resource Content
--local filterData = GetFilters("CataphCulturesToNameGroupsFilters");
--local transformData = GetTransforms("CulturesToNameGroupsTransforms");

-- Wez Speshul URP Unit Effect Content
--local filterData = GetFilters("WezSpeshulUnitCapEffectFilters");
--local transformData = GetTransforms("UnitCapEffectTransforms");

-- Wez Speshul URP Unit Resource Content
--local filterData = GetFilters("WezSpeshulUnitCapResourceFilters");
--local transformData = GetTransforms("UnitCapResourceTransforms");

-- Wez Speshul URP Unit Cap Building Content
--local filterData = GetFilters("WezSpeshulBuildingCapFilters");
--local transformData = GetTransforms("UnitCapBuildingTransforms");

-- WWL effect and trait generator
--local filterData = GetFilters("WWLTraitFilters");
--local transformData = GetTransforms("WWLTraitTransforms");

-- WWL skill tree generator
local filterData = GetFilters("WWLSkillTreeFilters");
local transformData = GetTransforms("WWLSkillTreeTransforms");
local listData = {};
local wwlAgentSubtypesGeneric = "WWLAgentSubtypesGeneric";
listData[wwlAgentSubtypesGeneric] = GetListData(wwlAgentSubtypesGeneric);
local wwlWizardLores = "WWLWizardLores";
listData[wwlWizardLores] = GetListData(wwlWizardLores);

local functionData = {};
local wwlFunctionData = "WWLFunctionData";
functionData = GetFunctionData(wwlFunctionData);

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
    ListData = listData,
    FunctionData = functionData,
});


loadedData:AddFiles();

loadedData:TransformFiles();

loadedData:PrepareOutputFiles();
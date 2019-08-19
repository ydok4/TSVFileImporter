function GetFilters(filterNames)
    -- Keep the loaded namespace in local scope since it won't be 
    -- needed after it is loaded
    local namespace = require ('_lib/filters/'..filterNames);
    return  _G[filterNames];
end

function GetTransforms(transformNames)
    -- Keep the loaded namespace in local scope since it won't be
    -- needed after it is loaded
    local namespace = require ('_lib/transforms/'..transformNames);
    return  _G[transformNames];
end

function GetListData(listDataName)
    -- Keep the loaded namespace in local scope since it won't be
    -- needed after it is loaded
    local namespace = require ('_lib/listdata/'..listDataName);
    return _G[listDataName];
end

function GetFunctionData(functionDataName)
    -- Keep the loaded namespace in local scope since it won't be
    -- needed after it is loaded
    local namespace = require ('_lib/functiondata/'..functionDataName);
    return _G[functionDataName];
end
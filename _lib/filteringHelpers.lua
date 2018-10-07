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
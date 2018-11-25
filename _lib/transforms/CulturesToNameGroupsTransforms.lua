CulturesToNameGroupsTransforms = {
    -- Each record can have transform operations applied
    -- Each table CulturesToNameGroupsTransformsbelow is a transform operation
    -- For each record the condition will be checked and then
    -- the transform applied
    factions_tables = {
        STEP1 = {
            -- The name of the file this transform operation is to be applied to
            FileName = "factions_tables",
            -- In an operation if the condition is met,
            -- Then the transforms are applied
            Filters = {

            },
            -- Transforms determine how data should be changed
            Transforms = {
                {
                    Type = "NEWROW",
                    Columns = {
                    },
                },
            },
            -- This value is used if a column has unsepecified transforms
            DefaultColumnTransformBehaviour = "SELECTEXISTING",
            NextTransformOperation = "STEP2",
        },
        STEP2 = {
            -- The name of the file this transform operation is to be applied to
            FileName = "names_groups_tables",
            -- In an operation if the condition is met,
            -- Then the transforms are applied
            Filters = {
                {
                    ColumnNumber = 1,
                    Type = "MATCHINGSTEP1",
                    -- Index of column from indicated step
                    Value = "7",
                    Operator = "AND",
                },
            },
            -- Transforms determine how data should be changed
            Transforms = {

            },
            -- This value is used if a column has unsepecified transforms
            DefaultColumnTransformBehaviour = "SELECTEXISTING",
            NextTransformOperation = "STEP3",
        },
        STEP3 = {
            FileName = "NameGroupResources",
            IgnoreFilter = true,
            Filters = {

            },
            -- This should be done once, assuming the filter criteria is met
            PerformOnce = true,
            Transforms = {
                {
                    Type = "CREATETABLE",
                    Columns = {
                        -- Sub culture key
                        {
                            Index = 1,
                            Type = "REPLACEWITHSTEP1",
                            Value = "1",
                        },
                        -- Group id
                        {
                            Index = 2,
                            Type = "REPLACEWITHSTEP2",
                            Value = "1"
                        },
                    },
                },
            },
            DefaultColumnTransformBehaviour = "SELECTEXISTING",
        },
    },
}
NameResourcesTransforms = {
    -- Each record can have transform operations applied
    -- Each table below is a transform operation
    -- For each record the condition will be checked and then
    -- the transform applied
    names_groups_tables = {
        STEP1 = {
            -- The name of the file this transform operation is to be applied to
            FileName = "names_groups_tables",
            -- In an operation if the condition is met,
            -- Then the transforms are applied
            Filters = {

            },
            -- Transforms determine how data should be changed
            Transforms = {
                {
                    Type = "NEWROW",
                    Columns = {
                        {
                            -- Subtype column
                            ColumnNumber = 1,
                            Type = "PREPEND",
                            Value = "name_group_",
                        },
                    },
                },
            },
            -- This value is used if a column has unsepecified transforms
            DefaultColumnTransformBehaviour = "SELECTEXISTING",
            NextTransformOperation = "STEP2",
        },
        STEP2 = {
            -- The name of the file this transform operation is to be applied to
            FileName = "name_orders_tables",
            -- In an operation if the condition is met,
            -- Then the transforms are applied
            Filters = {
                {
                    ColumnNumber = 1,
                    Type = "CONTAINSVALUESTEP1",
                    -- Index of column from indicated step
                    Value = "1",
                    Operator = "AND",
                },
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
            NextTransformOperation = "STEP3",
        },
        STEP3 = {
            -- The name of the file this transform operation is to be applied to
            FileName = "names_tables",
            -- In an operation if the condition is met,
            -- Then the transforms are applied
            Filters = {
                {
                    -- Name group column
                    ColumnNumber = 1,
                    Type = "CONTAINSVALUESTEP2",
                    -- Index of column from indicated step
                    Value = "1",
                    Operator = "AND",
                },
                {
                    -- Frequency column
                    ColumnNumber = 4,
                    Type = "CONTAINSVALUE",
                    Value = "1",
                    Operator = "AND",
                },
                {
                    -- Type column column
                    ColumnNumber = 2,
                    Type = "CONTAINSVALUESTEP2",
                    Value = "2",
                    Operator = "AND",
                },
            },
            -- Transforms determine how data should be changed
            Transforms = {
                {
                    Type = "NEWROW",
                    Columns = {
                        {
                            ColumnNumber = 3,
                            Type = "DATAMAPINDEXTOGENDER",
                            Value = "3",
                        },
                    },
                },
            },
            -- This value is used if a column has unsepecified transforms
            DefaultColumnTransformBehaviour = "SELECTEXISTING",
            NextTransformOperation = "STEP4",
        },
        STEP4 = {
            -- The name of the file this transform operation is to be applied to
            FileName = "names__loc",
            -- In an operation if the condition is met,
            -- Then the transforms are applied
            Filters = {
                {
                    ColumnNumber = 1,
                    Type = "CONTAINSVALUESTEP3",
                    -- Index of column from indicated step
                    Value = "5",
                    Operator = "AND",
                },
            },
            PerformOnce = true,
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
            NextTransformOperation = "STEP5",
        },
        STEP5 = {
            FileName = "NameResources",
            IgnoreFilter = true,
            Filters = {

            },
            -- This should be done once, assuming the filter criteria is met
            PerformOnce = true,
            Transforms = {
                {
                    Type = "CREATETABLE",
                    Columns = {
                        -- Name group
                        {
                            Index = 1,
                            Type = "REPLACEWITHSTEP1",
                            Value = "1"
                        },
                        -- name type
                        {
                            Index = 2,
                            Type = "REPLACEWITHSTEP2",
                            Value = "3"
                        },
                        -- Gender
                        {
                            Index = 3,
                            Type = "REPLACEWITHTRANSFORMEDSTEP3",
                            Value = "3"
                        },
                        -- name id
                        {
                            Index = 4,
                            Type = "REPLACEWITHSTEP3",
                            Value = "5"
                        },
                         -- name value
                         {
                            Index = 5,
                            Type = "REPLACEWITHSTEP4",
                            Value = "2"
                        },
                        -- Group key value
                        {
                            Index = 6,
                            Type = "REPLACEWITHTRANSFORMEDSTEP1",
                            Value = "1"
                        },
                    },
                },
            },
            DefaultColumnTransformBehaviour = "SELECTEXISTING",
        },
    },
}
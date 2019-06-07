UnitCapBuildingTransforms = {
    -- Each record can have transform operations applied
    -- Each table below is a transform operation
    -- For each record the condition will be checked and then
    -- the transform applied
    -- Empire Rebel Transform
    building_units_allowed_tables_data__ = {
        STEP1 = {
            -- The name of the file this transform operation is to be applied to
            FileName = "building_units_allowed_tables_data__",
            -- In an operation if the condition is met,
            -- Then the transforms are applied
            Filters = {

            },
            -- Transforms determine how data should be changed
            -- In this case I just want to load the data so I can transform it
            -- in other STEPS
            Transforms = {

            },
            -- This value is used if a column has unsepecified transforms
            DefaultColumnTransformBehaviour = "SELECTEXISTING",
            NextTransformOperation = "STEP2",
        },
        STEP2 = {
            -- The name of the file this transform operation is to be applied to
            FileName = "building_levels_tables_data__",
            -- In an operation if the condition is met,
            -- Then the transforms are applied
            Filters = {
                {
                    ColumnNumber = 1,
                    Type = "MATCHINGSTEP1",
                    Value = "1",
                    Operator = "AND",
                }
            },
            -- This should be done once, assuming the filter criteria is met
            PerformOnce = true,
            -- Transforms determine how data should be changed
            -- In this case I just want to load the data so I can transform it
            -- in other STEPS
            Transforms = {

            },
            -- This value is used if a column has unsepecified transforms
            DefaultColumnTransformBehaviour = "SELECTEXISTING",
            NextTransformOperation = "STEP3",
        },
        STEP3 = {
            -- The name of the file this transform operation is to be applied to
            FileName = "building_chain_availability_sets_tables_data__",
            -- In an operation if the condition is met,
            -- Then the transforms are applied
            Filters = {
                {
                    ColumnNumber = 1,
                    Type = "MATCHINGSTEP2",
                    Value = "2",
                    Operator = "AND",
                }
            },
            -- Transforms determine how data should be changed
            -- In this case I just want to load the data so I can transform it
            -- in other STEPS
            Transforms = {

            },
            -- This value is used if a column has unsepecified transforms
            DefaultColumnTransformBehaviour = "SELECTEXISTING",
            NextTransformOperation = "STEP4",
        },
        STEP4 = {
            -- The name of the file this transform operation is to be applied to
            FileName = "BuildCapPoolData",
            -- In an operation if the condition is met,
            -- Then the transforms are applied
            Filters = {

            },
            -- Transforms determine how data should be changed
            -- In this case I just want to load the data so I can transform it
            -- in other STEPS
            Transforms = {
                {
                    Type = "NEWROW",
                    Columns = {
                        {
                            ColumnNumber = 1,
                            Type = "REPLACEWITHSTEP1",
                            Value = "1",
                        },
                        {
                            ColumnNumber = 2,
                            Type = "REPLACEWITHSTEP1",
                            Value = "2",
                        },
                        {
                            ColumnNumber = 3,
                            Type = "REPLACE",
                            Value = "1",
                        },
                        {
                            ColumnNumber = 4,
                            Type = "REPLACE",
                            Value = "50",
                        },
                        {
                            ColumnNumber = 5,
                            Type = "REPLACE",
                            Value = "25",
                        },
                        {
                            ColumnNumber = 6,
                            Type = "REPLACE",
                            Value = "False",
                        },
                        {
                            ColumnNumber = 7,
                            Type = "REPLACEWITHSTEP3",
                            Value = "2",
                        },
                    },
                },
            },
            -- This value is used if a column has unsepecified transforms
            DefaultColumnTransformBehaviour = "SELECTEXISTING",
        },
    },
}
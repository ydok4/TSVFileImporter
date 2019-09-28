WWLEffectBundleTransforms = {
    -- Each record can have transform operations applied
    -- Each table below is a transform operation
    -- For each record the condition will be checked and then
    -- the transform applied
    -- Empire Rebel Transform
    character_skill_level_to_effects_junctions_tables_data__ = {
        STEP1 = {
            -- The name of the file this transform operation is to be applied to
            FileName = "character_skill_level_to_effects_junctions_tables_data__",
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
                    },
                },
            },
            -- This value is used if a column has unsepecified transforms
            DefaultColumnTransformBehaviour = "SELECTEXISTING",
            NextTransformOperation = "STEP2",
        },
        STEP2 = {
            -- The name of the file this transform operation is to be applied to
            FileName = "effects_tables_data__",
            -- In an operation if the condition is met,
            -- Then the transforms are applied
            Filters = {
                -- Effect Key
                {
                    ColumnNumber = 1,
                    Type = "MATCHINGSTEP1",
                    -- Index of column from indicated step
                    Value = "2",
                    Operator = "AND",
                },
            },
            -- Transforms determine how data should be changed
            -- In this case I just want to load the data so I can transform it 
            -- in other STEPS
            Transforms = {
                {
                    Type = "NEWROW",
                    Columns = {
                        {
                            -- Effect
                            ColumnNumber = 1,
                            Type = "REPLACEWITHenable",
                            -- Index of column from indicated step
                            Value = "disable",
                        },
                        {
                            -- UI Icon
                            ColumnNumber = 2,
                            Type = "REPLACE",
                            -- Index of column from indicated step
                            Value = "",
                        },
                    },
                },
            },
            -- This value is used if a column has unsepecified transforms
            DefaultColumnTransformBehaviour = "SELECTEXISTING",
            NextTransformOperation = "STEP3",
        },
        STEP3 = {
            -- The name of the file this transform operation is to be applied to
            FileName = "effect_bonus_value_unit_ability_junctions_tables_data__",
            -- In an operation if the condition is met,
            -- Then the transforms are applied
            Filters = {
                -- Effect Key
                {
                    ColumnNumber = 1,
                    Type = "MATCHINGSTEP2",
                    -- Index of column from indicated step
                    Value = "1",
                    Operator = "AND",
                },
                -- Bonus value id
                {
                    ColumnNumber = 2,
                    Type = "CONTAINSVALUE",
                    Value = "enable",
                    Operator = "AND",
                },
            },
            Transforms = {
                {
                    Type = "NEWROW",
                    Columns = {
                        {
                            -- Effect
                            ColumnNumber = 1,
                            Type = "REPLACEWITHTRANSFORMEDSTEP2",
                            -- Index of column from indicated step
                            Value = "1",
                        },
                        {
                            -- Bonus value id
                            ColumnNumber = 2,
                            Type = "REPLACE",
                            -- Index of column from indicated step
                            Value = "disable",
                        }
                    },
                },
            },
            DefaultColumnTransformBehaviour = "SELECTEXISTING",
            NextTransformOperation = "STEP4",
        },
        STEP4 = {
            -- The name of the file this transform operation is to be applied to
            FileName = "effect_bundles_tables_data__",
            -- In an operation if the condition is met,
            -- Then the transforms are applied
            Filters = {

            },
            -- This should be done once, assuming the filter criteria is met
            PerformOnce = true,
            -- Transforms determine how data should be changed
            -- In this case I just want to load the data so I can transform it 
            -- in other STEPS
            Transforms = {
                {
                    Type = "NEWROW",
                    Columns = {
                        {
                            -- Effect bundle key
                            ColumnNumber = 1,
                            Type = "SELECTEXISTING",
                            NumberOfOperations = 2,
                            Operations = {
                                OPERATION1 = {
                                    Type = "MATCHINGSTEP1",
                                    Value = "1",
                                },
                                OPERATION2 = {
                                    Type = "APPEND",
                                    Value = "_enable",
                                },
                            },
                        },
                        {
                            ColumnNumber = 2,
                            Type = "REPLACE",
                            Value = "",
                        },
                        {
                            ColumnNumber = 3,
                            Type = "REPLACE",
                            Value = "",
                        },
                        -- Bundle target
                        {
                            ColumnNumber = 4,
                            Type = "REPLACE",
                            Value = "character",
                        },
                        -- Priority
                        {
                            ColumnNumber = 5,
                            Type = "REPLACE",
                            Value = "0",
                        },
                        -- Ui icon
                        {
                            ColumnNumber = 6,
                            Type = "REPLACE",
                            Value = "",
                        },
                    },
                },
            },
            -- This value is used if a column has unsepecified transforms
            DefaultColumnTransformBehaviour = "SELECTNONE",
            NextTransformOperation = "STEP5",
        },
        STEP5 = {
            -- The name of the file this transform operation is to be applied to
            FileName = "effect_bundles_tables_data__",
            -- In an operation if the condition is met,
            -- Then the transforms are applied
            Filters = {

            },
            -- This should be done once, assuming the filter criteria is met
            PerformOnce = true,
            -- Transforms determine how data should be changed
            -- In this case I just want to load the data so I can transform it 
            -- in other STEPS
            Transforms = {
                {
                    Type = "NEWROW",
                    Columns = {
                        {
                            -- Effect bundle key
                            ColumnNumber = 1,
                            Type = "SELECTEXISTING",
                            NumberOfOperations = 2,
                            Operations = {
                                OPERATION1 = {
                                    Type = "MATCHINGSTEP1",
                                    Value = "1",
                                },
                                OPERATION2 = {
                                    Type = "APPEND",
                                    Value = "_disable",
                                },
                            },
                        },
                        {
                            ColumnNumber = 2,
                            Type = "REPLACE",
                            Value = "",
                        },
                        {
                            ColumnNumber = 3,
                            Type = "REPLACE",
                            Value = "",
                        },
                        -- Bundle target
                        {
                            ColumnNumber = 4,
                            Type = "REPLACE",
                            Value = "character",
                        },
                        -- Priority
                        {
                            ColumnNumber = 5,
                            Type = "REPLACE",
                            Value = "0",
                        },
                        -- Ui con
                        {
                            ColumnNumber = 6,
                            Type = "REPLACE",
                            Value = "",
                        },
                    },
                },
            },
            -- This value is used if a column has unsepecified transforms
            DefaultColumnTransformBehaviour = "SELECTNONE",
            NextTransformOperation = "STEP6",
        },
        STEP6 = {
            -- The name of the file this transform operation is to be applied to
            FileName = "effect_bundles_to_effects_junctions_tables_data__",
            -- In an operation if the condition is met,
            -- Then the transforms are applied
            Filters = {

            },
            -- This should be done once, assuming the filter criteria is met
            PerformOnce = true,
            -- Transforms determine how data should be changed
            -- In this case I just want to load the data so I can transform it 
            -- in other STEPS
            Transforms = {
                {
                    Type = "NEWROW",
                    Columns = {
                        {
                            ColumnNumber = 1,
                            Type = "REPLACEWITHTRANSFORMEDSTEP4",
                            Value = "1",
                        },
                        {
                            ColumnNumber = 2,
                            Type = "REPLACEWITHSTEP2",
                            Value = "1",
                        },
                        {
                            ColumnNumber = 3,
                            Type = "REPLACE",
                            Value = "character_to_character_own",
                        },
                        {
                            ColumnNumber = 4,
                            Type = "REPLACE",
                            Value = "1",
                        },
                        {
                            ColumnNumber = 5,
                            Type = "REPLACE",
                            Value = "start_turn_completed",
                        },
                    },
                },
            },
            -- This value is used if a column has unsepecified transforms
            DefaultColumnTransformBehaviour = "SELECTNONE",
            NextTransformOperation = "STEP7",
        },
        STEP7 = {
            -- The name of the file this transform operation is to be applied to
            FileName = "effect_bundles_to_effects_junctions_tables_data__",
            -- In an operation if the condition is met,
            -- Then the transforms are applied
            Filters = {

            },
            -- This should be done once, assuming the filter criteria is met
            PerformOnce = true,
            -- Transforms determine how data should be changed
            -- In this case I just want to load the data so I can transform it 
            -- in other STEPS
            Transforms = {
                {
                    Type = "NEWROW",
                    Columns = {
                        {
                            ColumnNumber = 1,
                            Type = "REPLACEWITHTRANSFORMEDSTEP5",
                            Value = "1",
                        },
                        {
                            ColumnNumber = 2,
                            Type = "REPLACEWITHTRANSFORMEDSTEP2",
                            Value = "1",
                        },
                        {
                            ColumnNumber = 3,
                            Type = "REPLACE",
                            Value = "character_to_character_own",
                        },
                        {
                            ColumnNumber = 4,
                            Type = "REPLACE",
                            Value = "1",
                        },
                        {
                            ColumnNumber = 5,
                            Type = "REPLACE",
                            Value = "start_turn_completed",
                        },
                    },
                },
            },
            -- This value is used if a column has unsepecified transforms
            DefaultColumnTransformBehaviour = "SELECTNONE",
        },
    },
}

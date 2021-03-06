TraitTransforms = {
    -- Each record can have transform operations applied
    -- Each table below is a transform operation
    -- For each record the condition will be checked and then
    -- the transform applied
    -- Empire Rebel Transform
    character_skills_tables_data__ = {
        STEP1 = {
            -- The name of the file this transform operation is to be applied to
            FileName = "character_skills_tables_data__",
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
            FileName = "trait_info_tables_data__",
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
                            -- Trait info key
                            ColumnNumber = 1,
                            Type = "MATCHINGSTEP1",
                            -- Index of column from indicated step
                            Value = "2",
                        }
                    },
                },
            },
            -- This value is used if a column has unsepecified transforms
            DefaultColumnTransformBehaviour = "SELECTNONE",
            NextTransformOperation = "STEP3",
        },
        STEP3 = {
            -- The name of the file this transform operation is to be applied to
            FileName = "character_trait_levels_tables_data__",
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
                            -- Key
                            ColumnNumber = 1,
                            Type = "MATCHINGSTEP1",
                            -- Index of column from indicated step
                            Value = "2",
                        },
                        {
                            -- Level
                            ColumnNumber = 2,
                            Type = "REPLACE",
                            -- Index of column from indicated step
                            Value = "1",
                        },
                        {
                            -- Trait
                            ColumnNumber = 3,
                            Type = "MATCHINGSTEP1",
                            -- Index of column from indicated step
                            Value = "2",
                        },
                        {
                            -- Threshold points
                            ColumnNumber = 4,
                            Type = "REPLACE",
                            -- Index of column from indicated step
                            Value = "0",
                        },
                    },
                },
            },
            -- This value is used if a column has unsepecified transforms
            DefaultColumnTransformBehaviour = "SELECTNONE",
            NextTransformOperation = "STEP4",
        },
        STEP4 = {
            -- The name of the file this transform operation is to be applied to
            FileName = "character_traits_tables_data__",
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
                         -- Skill key
                        {
                            ColumnNumber = 1,
                            Type = "REPLACEWITHTRANSFORMEDSTEP2",
                            -- Index of column from indicated step
                            Value = "1",
                        },
                        -- No going back level
                        {
                            ColumnNumber = 2,
                            Type = "REPLACE",
                            Value = "1",
                        },
                        -- Hidden
                        {
                            ColumnNumber = 3,
                            Type = "REPLACE",
                            Value = "false",
                        },
                        -- Precedence
                        {
                            ColumnNumber = 4,
                            Type = "REPLACE",
                            Value = "1",
                        },
                        -- Icon
                        {
                            ColumnNumber = 5,
                            Type = "SELECTEXISTING",
                            NumberOfOperations = 4,
                            Operations = {
                                OPERATION1 = {
                                    Type = "MATCHINGSTEP1",
                                    Value = "1",
                                },
                                OPERATION2 = {
                                    Type = "REPLACEWITHtrait_",
                                    Value = "",
                                },
                                OPERATION3 = {
                                    Type = "REPLACEWITH.png",
                                    Value = "",
                                },
                                OPERATION4 = {
                                    Type = "DATAMAPSKILLICONSTOTRAITS",
                                    Value = "SELECTEXISTING",
                                },
                            },
                        },
                        -- Ui priority
                        {
                            ColumnNumber = 6,
                            Type = "REPLACE",
                            Value = "1",
                        },
                        -- Pre battle speech paremeter
                        {
                            ColumnNumber = 7,
                            Type = "REPLACE",
                            Value = "",
                        },
                    }
                },
            },
            -- This value is used if a column has unsepecified transforms
            DefaultColumnTransformBehaviour = "SELECTNONE",
            NextTransformOperation = "STEP5",
        },
        STEP5 = {
            -- The name of the file this transform operation is to be applied to
            FileName = "character_skill_level_to_effects_junctions_tables_data__",
            -- In an operation if the condition is met,
            -- Then the transforms are applied
            Filters = {
                -- Skill Key
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
                    },
                },
            },
            -- This value is used if a column has unsepecified transforms
            DefaultColumnTransformBehaviour = "SELECTEXISTING",
            NextTransformOperation = "STEP6",
        },
        STEP6 = {
            -- The name of the file this transform operation is to be applied to
            FileName = "trait_level_effects_tables_data__",
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
                            -- Trait level key
                            ColumnNumber = 1,
                            Type = "REPLACEWITHTRANSFORMEDSTEP4",
                            -- Index of column from indicated step
                            Value = "1",
                        },
                        {
                            -- Effect key
                            ColumnNumber = 2,
                            Type = "REPLACEWITHTRANSFORMEDSTEP5",
                            -- Index of column from indicated step
                            Value = "2",
                        },
                        {
                            -- Effect scope
                            ColumnNumber = 3,
                            Type = "REPLACEWITHTRANSFORMEDSTEP5",
                            -- Index of column from indicated step
                            Value = "3",
                        },
                        {
                            -- Value
                            ColumnNumber = 4,
                            Type = "REPLACEWITHTRANSFORMEDSTEP5",
                            -- Index of column from indicated step
                            Value = "5",
                        },
                    },
                },
            },
            -- This value is used if a column has unsepecified transforms
            DefaultColumnTransformBehaviour = "SELECTNONE",
        },
    }
}
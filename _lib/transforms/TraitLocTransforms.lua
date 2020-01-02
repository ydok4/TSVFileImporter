TraitLocTransforms = {
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
            FileName = "character_skills__loc",
            -- In an operation if the condition is met,
            -- Then the transforms are applied
            Filters = {
                {
                    ColumnNumber = 1,
                    Type = "CONTAINSVALUESTEP1",
                    -- Index of column from indicated step
                    Value = "2",
                    Operator = "AND",
                },
                {
                    ColumnNumber = 1,
                    Type = "CONTAINSVALUE",
                    -- Index of column from indicated step
                    Value = "character_skills_localised_name_",
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
            NextTransformOperation = "STEP3",
        },
        STEP3 = {
            -- The name of the file this transform operation is to be applied to
            FileName = "character_trait_levels__loc",
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
                            Type = "SELECTEXISTING",
                            NumberOfOperations = 2,
                            Operations = {
                                OPERATION1 = {
                                    Type = "MATCHINGSTEP1",
                                    Value = "2",
                                },
                                OPERATION2 = {
                                    Type = "PREPEND",
                                    Value = "character_trait_levels_onscreen_name_",
                                },
                            },
                        },
                        {
                            -- Localised Text
                            ColumnNumber = 2,
                            Type = "REPLACEWITHTRANSFORMEDSTEP2",
                            -- Index of column from indicated step
                            Value = "2",
                        },
                        {
                            -- Tooltip
                            ColumnNumber = 3,
                            Type = "REPLACE",
                            -- Index of column from indicated step
                            Value = "true",
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
            FileName = "character_skills__loc",
            -- In an operation if the condition is met,
            -- Then the transforms are applied
            Filters = {
                {
                    ColumnNumber = 1,
                    Type = "CONTAINSVALUESTEP1",
                    -- Index of column from indicated step
                    Value = "2",
                    Operator = "AND",
                },
                {
                    ColumnNumber = 1,
                    Type = "CONTAINSVALUE",
                    -- Index of column from indicated step
                    Value = "character_skills_localised_description_",
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
            NextTransformOperation = "STEP5",
        },
        STEP5 = {
            -- The name of the file this transform operation is to be applied to
            FileName = "character_trait_levels__loc",
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
                            Type = "SELECTEXISTING",
                            NumberOfOperations = 2,
                            Operations = {
                                OPERATION1 = {
                                    Type = "MATCHINGSTEP1",
                                    Value = "2",
                                },
                                OPERATION2 = {
                                    Type = "PREPEND",
                                    Value = "character_trait_levels_colour_text_",
                                },
                            },
                        },
                        {
                            -- Localised Text
                            ColumnNumber = 2,
                            Type = "REPLACEWITHTRANSFORMEDSTEP4",
                            -- Index of column from indicated step
                            Value = "2",
                        },
                        {
                            -- Tooltip
                            ColumnNumber = 3,
                            Type = "REPLACE",
                            -- Index of column from indicated step
                            Value = "true",
                        },
                    },
                },
            },
            -- This value is used if a column has unsepecified transforms
            DefaultColumnTransformBehaviour = "SELECTEXISTING",
        },
    },
}
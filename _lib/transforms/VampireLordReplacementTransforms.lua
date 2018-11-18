VampireLordReplacementTransforms = {
    agent_subtypes_tables_a_vampire_lord_replacement = {
        STEP1 = {
            -- The name of the file this transform operation is to be applied to
            FileName = "agent_subtypes_tables_a_vampire_lord_replacement",
            -- In an operation if the condition is met,
            -- Then the transforms are applied
            Filters = {

            },
            PostTransformFilters = {
                {
                    ColumnNumber = 1,
                    Type = "TRANSFORMUNIQUE",
                    -- Index of column from indicated step
                    Value = "",
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
                NextTransformOperation = "STEP2",
            },
        STEP2 = {
            -- The name of the file this transform operation is to be applied to
            FileName = "campaign_character_art_sets_tables_a_vampire_lord_replacement",
            -- In an operation if the condition is met,
            -- Then the transforms are applied
            Filters = {
                -- Agent Sub Type Column
                {
                    ColumnNumber = 8,
                    Type = "MATCHINGSTEP1",
                    -- Index of column from indicated step
                    Value = "1",
                    Operator = "AND",
                },
            },
            PostTransformFilters = {
                {
                    ColumnNumber = 2,
                    Type = "TRANSFORMUNIQUE",
                    -- Index of column from indicated step
                    Value = "",
                    Operator = "AND",
                },
            },
            -- Transforms determine how data should be changed
            Transforms = {
                {
                    Type = "NEWROW",
                    Columns = {
                        {
                            -- Agent sub type column
                            ColumnNumber = 8,
                            Type = "REPLACEWITHTRANSFORMEDSTEP1",
                            -- Index of column from indicated step
                            Value = "1",
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
            FileName = "campaign_character_arts_tables_a_vampire_lord_replacement",
            -- In an operation if the condition is met,
            -- Then the transforms are applied
            Filters = {
                -- Agent Sub Type Column
                {
                    ColumnNumber = 1,
                    Type = "MATCHINGSTEP2",
                    -- Index of column from indicated step
                    Value = "2",
                    Operator = "AND",
                },
            },
            PostTransformFilters = {
                {
                    ColumnNumber = 1,
                    Type = "TRANSFORMUNIQUE",
                    Value = "",
                    Operator = "AND",
                },
            },
            -- Transforms determine how data should be changed
            Transforms = {
                {
                    Type = "NEWROW",
                    Columns = {
                        {
                            -- Art set Id column
                            ColumnNumber = 1,
                            Type = "REPLACEWITHTRANSFORMEDSTEP2",
                            -- Index of column from indicated step
                            Value = "2",
                        },
                        {
                            -- Agent sub type column
                            ColumnNumber = 14,
                            Type = "NUMERICID",
                            -- Index of column from indicated step
                            Value = "23290",
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
            FileName = "portrait_settings__vampire_lord_replacement",
            -- In an operation if the condition is met,
            -- Then the transforms are applied
            Filters = {

            },
            Transforms = {
                {
                    Type = "XMLDUPLICATE",
                    NumberOfOperations = 3,
                    Operations = {
                        OPERATION1 = {
                            Keyword = "ARTSETID",
                            Type = "REPLACEWITHTRANSFORMEDSTEP2",
                            -- Index of column from indicated step
                            Value = "2",
                        },
                        OPERATION2 = {
                            Keyword = "VARIANTFILENAME",
                            Type = "JOIN",
                            SourceColumn =  {
                                Type = "MATCHINGSTEP3",
                                Value = "1",
                            },
                            -- Index of column from indicated step
                            Value = {
                                File = "campaign_character_arts_tables_a_vampire_lord_replacement",
                                -- Art set id
                                TargetColumn = "1",
                                -- Uniform column
                                ReturnColumn = "6",
                                Type = "JOIN",
                                Value = {
                                    File = "agent_uniforms_tables_a_vampire_lord_replacement",
                                    -- Uniform id
                                    TargetColumn = "2",
                                    -- Filename (variant id) column
                                    ReturnColumn = "1",
                                    Type = "JOIN",
                                    Value = {
                                        File = "variants_tables_data__",
                                        SourceColumn =  {
                                            Type = "SELECTCOLUMN",
                                            Value = "1",
                                        },
                                        -- Variant ID
                                        TargetColumn = "1",
                                        -- Variane filename column
                                        ReturnColumn = "3",
                                        Value = "REPLACE",
                                    },
                                },
                            },
                        },
                        OPERATION3 = {
                            Keyword = "PORTRAITPATH",
                            Type = "REPLACEWITHSUBOPERATION",
                            Value = "2",
                            SubOperations = {
                                {
                                    Type = "DATAMAPCULTURESTRINGS",
                                    Value = "KEYISINOPERATION1",
                                },
                                {
                                    Type = "APPEND",
                                    Value = "/",
                                },
                                {
                                    Type = "APPEND",
                                    Value = "REPLACEWITHOPERATION2",
                                },
                                {
                                    Type = "APPEND",
                                    Value = "_0.png",
                                },
                                {
                                    Type = "PREPEND",
                                    Value = "UI/Portraits/Portholes/",
                                },
                            },
                        },
                    },
                },
            },
        },
    }
}
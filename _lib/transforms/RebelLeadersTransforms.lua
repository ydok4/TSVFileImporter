RebelLeadersTransforms = {
    -- Each record can have transform operations applied
    -- Each table below is a transform operation
    -- For each record the condition will be checked and then
    -- the transform applied
    -- Empire Rebel Transform
    agent_subtypes_tables_data__ = {
    STEP1 = {
        -- The name of the file this transform operation is to be applied to
        FileName = "agent_subtypes_tables_data__",
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
                    {
                        -- Agent sub type Key column
                        ColumnNumber = 1,
                        Type = "APPEND",
                        -- Index of column from indicated step
                        Value = "_rebel",
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
        FileName = "faction_agent_permitted_subtypes_tables_data__",
        -- In an operation if the condition is met,
        -- Then the transforms are applied
        Filters = {
            -- Agent Sub Type Column
            {
                ColumnNumber = 3,
                Type = "MATCHINGSTEP1",
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
                    {
                        -- Subtype column
                        ColumnNumber = 3,
                        Type = "APPEND",
                        Value = "_rebel",
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
        FileName = "campaign_character_art_sets_tables_data__",
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
                            -- Art set Id column
                            ColumnNumber = 2,
                            Type = "APPEND",
                            -- Index of column from indicated step
                            Value = "_rebel",
                        },
                        {
                            -- Agent sub type column
                            ColumnNumber = 8,
                            Type = "REPLACEWITHTRANSFORMEDSTEP1",
                            -- Index of column from indicated step
                            Value = "1",
                        },
                        {
                            ColumnNumber = 9,
                            Type = "REPLACEWITHSTEP1",
                            Value = "9",
                        }
                    },
                },
            },
            -- This value is used if a column has unsepecified transforms
            DefaultColumnTransformBehaviour = "SELECTEXISTING",
            NextTransformOperation = "STEP4",
        },
        STEP4 = {
            -- The name of the file this transform operation is to be applied to
            FileName = "campaign_character_arts_tables_data__",
            -- In an operation if the condition is met,
            -- Then the transforms are applied
            Filters = {
                -- Agent Sub Type Column
                {
                    ColumnNumber = 1,
                    Type = "MATCHINGSTEP3",
                    -- Index of column from indicated step
                    Value = "2",
                    Operator = "AND",
                },
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
                        {
                            -- Art set Id column
                            ColumnNumber = 1,
                            Type = "REPLACEWITHTRANSFORMEDSTEP3",
                            -- Index of column from indicated step
                            Value = "2",
                        },
                        {
                            -- Agent sub type column
                            ColumnNumber = 14,
                            Type = "NUMERICID",
                            -- Index of column from indicated step
                            Value = "23190",
                        },
                    },
                },
            },
            -- This value is used if a column has unsepecified transforms
            DefaultColumnTransformBehaviour = "SELECTEXISTING",
            NextTransformOperation = "STEP5",
        },
        STEP5 = {
            -- The name of the file this transform operation is to be applied to
            FileName = "portrait_settings__template",
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
                            Type = "REPLACEWITHTRANSFORMEDSTEP3",
                            -- Index of column from indicated step
                            Value = "2",
                        },
                        OPERATION2 = {
                            Keyword = "VARIANTFILENAME",
                            Type = "JOIN",
                            SourceColumn =  {
                                Type = "MATCHINGSTEP4",
                                Value = "1",
                            },
                            -- Index of column from indicated step
                            Value = {
                                File = "campaign_character_arts_tables_data__",
                                -- Art set id
                                TargetColumn = "1",
                                -- Uniform column
                                ReturnColumn = "6",
                                Type = "JOIN",
                                Value = {
                                    File = "agent_uniforms_tables_data__",
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
                            -- Index of column from indicated step
                            Value = "2",
                            SubOperations = {
                                {
                                    -- The below is functional but not required anymore
                                    -- The idea is it tries each option until it gets a result
                                    --[[Type = "GETNONBLANKRESULTFROMOPTIONS",
                                    Options = {
                                        {
                                            Type = "MATCHINGSTEP3",
                                            -- Culture
                                            Value = "3",
                                        },
                                        {
                                            Type = "JOIN",
                                            SourceColumn =  {
                                                Type = "MATCHINGSTEP2",
                                                -- Unit override type
                                                Value = "5",
                                            },
                                            Value = {
                                                File = "agent_culture_details_tables_data__",
                                                -- Unit override type
                                                TargetColumn = "3",
                                                -- Culture
                                                ReturnColumn = "2",
                                            },
                                        },
                                    },--]]
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
            NextTransformOperation = "STEP6",
        },
        STEP6 = {
            FileName = "RebelLeadersDataResources",
            IgnoreFilter = true,
            Filters = {

            },
            -- This should be done once, assuming the filter criteria is met
            PerformOnce = true,
            Transforms = {
                {
                    Type = "COPYTABLESTEP3",
                    Columns = {
                    },
                },
                {
                    Type = "NEWROW",
                    Columns = {
                    },
                }
            },
            DefaultColumnTransformBehaviour = "SELECTEXISTING",
        },

    }
}
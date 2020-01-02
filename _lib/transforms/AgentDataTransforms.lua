AgentDataTransforms = {
    -- Each record can have transform operations applied
    -- Each table below is a transform operation
    -- For each record the condition will be checked and then
    -- the transform applied
    agent_subtypes_tables_data__ = {
        STEP1 = {
            -- The name of the file this transform operation is to be applied to
            FileName = "agent_subtypes_tables_data__",
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
                            -- Key
                           ColumnNumber = 1,
                           Type = "SELECTEXISTING",
                           NumberOfOperations = 12,
                           Operations = {
                               OPERATION1 = {
                                    Type = "DATAMAPSUBTYPESTOARTSET",
                                    Value = "REPLACEIFVALUE",
                               },
                               OPERATION2 = {
                                Type = "REPLACEWITHdlc03",
                                Value = "",
                               },
                               OPERATION3 = {
                                Type = "REPLACEWITHdlc04",
                                Value = "",
                               },
                               OPERATION4 = {
                                Type = "REPLACEWITHdlc05",
                                Value = "",
                               },
                               OPERATION5 = {
                                Type = "REPLACEWITHdlc06",
                                Value = "",
                               },
                               OPERATION6 = {
                                Type = "REPLACEWITHdlc07",
                                Value = "",
                               },
                               OPERATION7 = {
                                Type = "REPLACEWITHdlc08",
                                Value = "",
                               },
                               OPERATION8 = {
                                Type = "REPLACEWITHwh2_dlc09",
                                Value = "",
                               },
                               OPERATION9 = {
                                Type = "REPLACEWITHwh2_dlc10",
                                Value = "",
                               },
                               OPERATION10 = {
                                Type = "REPLACEWITHwh2_dlc11",
                                Value = "",
                               },
                               OPERATION11 = {
                                Type = "REPLACEWITHwh2_main",
                                Value = "",
                               },
                               OPERATION12 = {
                                Type = "REPLACEWITHwh_main",
                                Value = "",
                               },
                           },
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
            FileName = "campaign_character_art_sets_tables_data__",
            -- In an operation if the condition is met,
            -- Then the transforms are applied
            Filters = {
                {
                    ColumnNumber = 2,
                    Type = "CONTAINSTRANSFORMEDVALUESTEP1",
                    -- Index of column from indicated step and a concatted string
                    Value = "1+_0",
                    Operator = "AND",
                    RowOperator = "OR",
                },
                {
                    ColumnNumber = 8,
                    Type = "ISVALUESTEP1",
                    -- Index of column from indicated step and a concatted string
                    Value = "1",
                    Operator = "AND",
                    RowOperator = "OR",
                },
            },
            Transforms = {
                {
                    Type = "NEWROW",
                    Columns = {
                        {
                            ColumnNumber = 8,
                            Type = "REPLACEWITHSTEP1",
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
            NextTransformOperation = "STEP3",
        },
        STEP3 = {
            FileName = "AgentDataResources",
            IgnoreFilter = true,
            Filters = {

            },
            -- This should be done once, assuming the filter criteria is met
            PerformOnce = false,
            Transforms = {
                {
                    Type = "COPYTABLESTEP2",
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
            NextTransformOperation = "STEP4",
        },
        STEP4 = {
            -- The name of the file this transform operation is to be applied to
            FileName = "effects_tables",
            -- In an operation if the condition is met,
            -- Then the transforms are applied
            Filters = {
            },
            PerformOnce = true,
            Transforms = {
                {
                    Type = "NEWROW",
                    Columns = {
                        {
                            -- Effect
                            ColumnNumber = 1,
                            Type = "SELECTEXISTING",
                            NumberOfOperations = 2,
                            Operations = {
                                OPERATION1 = {
                                    Type = "REPLACEWITHSTEP1",
                                    -- Index of column from indicated step
                                    Value = "1",
                                },
                                OPERATION2 = {
                                    Type = "APPEND",
                                    Value = "_enable_recruitment",
                                },
                            },
                        },
                        {
                            -- Icon
                            ColumnNumber = 2,
                            Type = "REPLACE",
                            -- Index of column from indicated step
                            Value = "",
                        },
                        {
                            -- Priority
                            ColumnNumber = 3,
                            Type = "REPLACE",
                            -- Index of column from indicated step
                            Value = "0",
                        },
                        {
                            -- Icon negative
                            ColumnNumber = 4,
                            Type = "REPLACE",
                            -- Index of column from indicated step
                            Value = "",
                        },
                        {
                            -- Category
                            ColumnNumber = 5,
                            Type = "REPLACE",
                            -- Index of column from indicated step
                            Value = "campaign",
                        },
                        {
                            -- Is positive value good
                            ColumnNumber = 6,
                            Type = "REPLACE",
                            -- Index of column from indicated step
                            Value = "true",
                        },
                    },
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
            -- This value is used if a column has unsepecified transforms
            DefaultColumnTransformBehaviour = "SELECTEXISTING",
            NextTransformOperation = "STEP5",
        },
        STEP5 = {
            -- The name of the file this transform operation is to be applied to
            FileName = "effect_bonus_value_agent_junction_tables",
            -- In an operation if the condition is met,
            -- Then the transforms are applied
            Filters = {
            },
            PerformOnce = true,
            Transforms = {
                {
                    Type = "NEWROW",
                    Columns = {
                        {
                            -- Effect key
                            ColumnNumber = 1,
                            Type = "REPLACEWITHTRANSFORMEDSTEP4",
                            Value = "1",
                        },
                        {
                            -- Bonus value
                            ColumnNumber = 2,
                            Type = "REPLACE",
                            -- Index of column from indicated step
                            Value = "availability",
                        },
                        {
                            -- Agent type
                            ColumnNumber = 3,
                            Type = "REPLACEWITHTRANSFORMEDSTEP2",
                            -- Index of column from indicated step
                            Value = "1",
                        },
                    },
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
            -- This value is used if a column has unsepecified transforms
            DefaultColumnTransformBehaviour = "SELECTEXISTING",
            NextTransformOperation = "STEP6",
        },
        STEP6 = {
            -- The name of the file this transform operation is to be applied to
            FileName = "effect_bonus_value_agent_subtype_junctions_tables",
            -- In an operation if the condition is met,
            -- Then the transforms are applied
            Filters = {
            },
            PerformOnce = true,
            Transforms = {
                {
                    Type = "NEWROW",
                    Columns = {
                        {
                            -- Bonus value id
                            ColumnNumber = 1,
                            Type = "REPLACE",
                            Value = "availability",
                        },
                        {
                            -- effect key
                            ColumnNumber = 2,
                            Type = "REPLACEWITHTRANSFORMEDSTEP4",
                            -- Index of column from indicated step
                            Value = "1",
                        },
                        {
                            -- Agent subtype
                            ColumnNumber = 3,
                            Type = "REPLACEWITHSTEP1",
                            -- Index of column from indicated step
                            Value = "1",
                        },
                    },
                },
            },
            PostTransformFilters = {
                {
                    ColumnNumber = 3,
                    Type = "TRANSFORMUNIQUE",
                    -- Index of column from indicated step
                    Value = "",
                    Operator = "AND",
                },
            },
            -- This value is used if a column has unsepecified transforms
            DefaultColumnTransformBehaviour = "SELECTEXISTING",
        },
    },
}
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
            PerformOnce = true,
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
        },
    },
}
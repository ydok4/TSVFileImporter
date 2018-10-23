ArtSetTransforms = {
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
                           NumberOfOperations = 11,
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
                                Type = "REPLACEWITHwh2_main",
                                Value = "",
                               },
                               OPERATION11 = {
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
                    -- Index of column from indicated step
                    Value = "1",
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
                            ColumnNumber = 8,
                            Type = "REPLACEWITHSTEP1",
                            Value = "1",
                        }
                    },
                },
            },
            -- This value is used if a column has unsepecified transforms
            DefaultColumnTransformBehaviour = "SELECTEXISTING",
            NextTransformOperation = "STEP3",
        },
        STEP3 = {
            FileName = "AgentArtSetResources",
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
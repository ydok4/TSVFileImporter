WWLSkillTreeTransforms = {
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
            FileName = "character_skill_node_sets_tables_data__",
            -- In an operation if the condition is met,
            -- Then the transforms are applied
            Filters = {
                -- Agent subtype key
                {
                    ColumnNumber = 8,
                    Type = "MATCHINGSTEP1",
                    -- Index of column from indicated step
                    Value = "1",
                    Operator = "AND",
                },
            },
            Transforms = {
                {
                    Type = "NEWROW",
                    Columns = {
                    },
                },
            },
            DefaultColumnTransformBehaviour = "SELECTEXISTING",
            NextTransformOperation = "STEP3",
        },
        STEP3 = {
            -- The name of the file this transform operation is to be applied to
            FileName = "character_skill_nodes_tables_data__",
            -- In an operation if the condition is met,
            -- Then the transforms are applied
            Filters = {
                -- Character skill node set
                {
                    ColumnNumber = 3,
                    Type = "MATCHINGSTEP2",
                    -- Index of column from indicated step
                    Value = "4",
                    Operator = "AND",
                },
                -- Character skill node key
                {
                    ColumnNumber = 2,
                    Type = "FUNCTIONisValidSkillNode",
                    -- Index of column from indicated step
                    Value = "_magic_",
                    Operator = "AND",
                },
                -- Visible in UI
                {
                    ColumnNumber = 11,
                    Type = "MATCHVALUE",
                    -- Index of column from indicated step
                    Value = "true",
                    Operator = "AND",
                },
            },
            -- This should be done once, assuming the filter criteria is met
            PerformOnce = false,
            -- Transforms determine how data should be changed
            -- In this case I just want to load the data so I can transform it 
            -- in other STEPS
            Transforms = {
            },
            -- This value is used if a column has unsepecified transforms
            DefaultColumnTransformBehaviour = "SELECTNONE",
            NextTransformOperation = "STEP4",
        },
        STEP4 = {
            -- The name of the file this transform operation is to be applied to
            FileName = "character_skills_tables_data__",
            -- In an operation if the condition is met,
            -- Then the transforms are applied
            Filters = {
                -- Character skill node key
                {
                    ColumnNumber = 2,
                    Type = "MATCHINGSTEP3",
                    -- Index of column from indicated step
                    Value = "2",
                    Operator = "AND",
                },
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
                    },
                },
            },
            -- This value is used if a column has unsepecified transforms
            DefaultColumnTransformBehaviour = "SELECTEXISTING",
            NextTransformOperation = "STEP5",
        },
        -- Adjust positioning of existing skill nodes
        STEP5 = {
            -- The name of the file this transform operation is to be applied to
            FileName = "character_skill_nodes_tables_data__",
            -- In an operation if the condition is met,
            -- Then the transforms are applied
            Filters = {
                -- Character skill node set
                {
                    ColumnNumber = 3,
                    Type = "MATCHINGSTEP2",
                    -- Index of column from indicated step
                    Value = "4",
                    Operator = "AND",
                },
                -- Character skill node key we had earlier
                {
                    ColumnNumber = 2,
                    Type = "MATCHINGSTEP3",
                    -- Index of column from indicated step
                    Value = "2",
                    Operator = "AND",
                },
            },
            -- This should be done once, assuming the filter criteria is met
            PerformOnce = true,
            -- Transforms determine how data should be changed
            -- In this case I just want to load the data so I can transform it
            -- in other STEPS
            Transforms = {
                -- Clone the existing character node
                {
                    Type = "NEWROW",
                    Columns = {
                        -- Key
                        {
                            ColumnNumber = 6,
                            Type = "FUNCTIONGetClonedCharacterSkillNodeKey",
                            -- Index of column from indicated step
                            Value = "",
                        },
                        -- Tier
                        {
                            ColumnNumber = 7,
                            Type = "FUNCTIONGetCharacterSkillNodeTierBehaviour",
                            -- Index of column from indicated step
                            Value = "",
                        },
                        -- Points on creation
                        {
                            ColumnNumber = 9,
                            Type = "FUNCTIONGetCharacterSkillNodePointsOnCreationBehaviour",
                            -- Index of column from indicated step
                            Value = "",
                        },
                        -- Required number of parents
                        {
                            ColumnNumber = 10,
                            Type = "REPLACE",
                            -- Index of column from indicated step
                            Value = "0",
                        },
                    },
                },
                -- Then move the originals
                {
                    Type = "NEWROW",
                    Columns = {
                        -- Character skill key
                        {
                            ColumnNumber = 2,
                            Type = "REPLACE",
                            -- Index of column from indicated step
                            Value = "wwl_disable_dummy",
                        },
                        -- Tier
                        {
                            ColumnNumber = 7,
                            Type = "REPLACE",
                            -- Index of column from indicated step
                            Value = "99",
                        },
                        -- Visible in UI
                        {
                            ColumnNumber = 11,
                            Type = "REPLACE",
                            -- Index of column from indicated step
                            Value = "false",
                        },
                    },
                },
            },
            -- This value is used if a column has unsepecified transforms
            DefaultColumnTransformBehaviour = "SELECTEXISTING",
            NextTransformOperation = "STEP6",
        },
        -- Update vanilla skills
        STEP6 = {
            -- The name of the file this transform operation is to be applied to
            FileName = "character_skill_node_links_tables_data__",
            -- In an operation if the condition is met,
            -- Then the transforms are applied
            Filters = {
                -- Character skill node key
                {
                    ColumnNumber = 1,
                    Type = "FUNCTIONIsValidStep5Key",
                    -- Index of column from indicated step
                    Value = "6",
                    Operator = "AND",
                },
            },
            -- This should be done once, assuming the filter criteria is met
            PerformOnce = "FUNCTIONShouldUpdateVanillaSkillOnce",
            -- Transforms determine how data should be changed
            -- In this case I just want to load the data so I can transform it
            -- in other STEPS
            Transforms = {
                -- Update the current parent
                {
                    Type = "NEWROW",
                    Columns = {
                         -- Child key
                         {
                            ColumnNumber = 1,
                            Type = "REPLACEWITHTRANSFORMEDSTEP5",
                            Value = "6",
                        },
                        -- Parent key
                        {
                            ColumnNumber = 3,
                            Type = "FUNCTIONGetSpellParentLinkKey",
                            Value = "",
                        },
                        -- Link type
                        {
                            ColumnNumber = 8,
                            Type = "FUNCTIONGetSkillLinkType",
                            Value = "",
                        },
                    }
                },
            },
            -- This value is used if a column has unsepecified transforms
            DefaultColumnTransformBehaviour = "SELECTEXISTING",
            NextTransformOperation = "STEP7",
        },
        -- Create new skill groupings
        STEP7 = {
            -- The name of the file this transform operation is to be applied to
            FileName = "character_skill_node_links_tables_data__",
            -- In an operation if the condition is met,
            -- Then the transforms are applied
            Filters = {
                {
                    ColumnNumber = 3,
                    Type = "FUNCTIONIsUpgradedWizardLevelParent",
                    Value = "",
                    Operator = "AND",
                },
            },
            -- This should be done once, assuming the filter criteria is met
            PerformOnce = true,
            -- Transforms determine how data should be changed
            -- In this case I just want to load the data so I can transform it
            -- in other STEPS
            Transforms = {
                -- Update the current parent
                {
                    Type = "NEWROW",
                    Columns = {
                        -- Child key
                        {
                            ColumnNumber = 1,
                            Type = "FUNCTIONGetWizardLevelChildKey",
                            Value = "",
                        },
                        -- Parent key
                        {
                            ColumnNumber = 3,
                            Type = "REPLACEWITHTRANSFORMEDSTEP6",
                            Value = "1",
                        },
                        -- Link type
                        {
                            ColumnNumber = 8,
                            Type = "REPLACE",
                            Value = "SUBSET_REQUIRED",
                        },
                    }
                },
            },
            -- This value is used if a column has unsepecified transforms
            DefaultColumnTransformBehaviour = "SELECTEXISTING",
            NextTransformOperation = "STEP8",
        },
        -- Create the new skills
        STEP8 = {
            -- The name of the file this transform operation is to be applied to
            FileName = "character_skill_nodes_tables_data__",
            -- In an operation if the condition is met,
            -- Then the transforms are applied
            Filters = {
                -- Character skill node set
                {
                    ColumnNumber = 3,
                    Type = "MATCHINGSTEP2",
                    -- Index of column from indicated step
                    Value = "4",
                    Operator = "AND",
                },
                -- Character skill node key we had earlier
                {
                    ColumnNumber = 2,
                    Type = "MATCHINGSTEP3",
                    -- Index of column from indicated step
                    Value = "2",
                    Operator = "AND",
                },
            },
            -- We only want 1 copy of the skill node
            PostTransformFilters = {
                {
                    ColumnNumber = 6,
                    Type = "TRANSFORMUNIQUE",
                    -- Index of column from indicated step
                    Value = "",
                    Operator = "AND",
                },
            },
            -- This should be done once, assuming the filter criteria is met
            PerformOnce = true,
            -- Transforms determine how data should be changed
            -- In this case I just want to load the data so I can transform it 
            -- in other STEPS
            Transforms = {
                -- Create the new initial node
                {
                    Type = "NEWROW",
                    Columns = {
                        -- Character skill key
                        {
                            ColumnNumber = 2,
                            Type = "FUNCTIONGetDefaultWizardLevelKey",
                            -- Index of column from indicated step
                            Value = "",
                        },
                        -- Character skill node set key
                        {
                            ColumnNumber = 3,
                            Type = "MATCHINGSTEP2",
                            -- Index of column from indicated step
                            Value = "4",
                        },
                        -- indent
                        {
                            ColumnNumber = 5,
                            Type = "MATCHINGSTEP5",
                            -- Index of column from indicated step
                            Value = "5",
                        },
                        -- key
                        {
                            ColumnNumber = 6,
                            Type = "SELECTEXISTING",
                            NumberOfOperations = 2,
                            Operations = {
                                OPERATION1 = {
                                    Type = "MATCHINGSTEP1",
                                    Value = "1",
                                },
                                OPERATION2 = {
                                    Type = "PREPEND",
                                    Value = "wwl_default_wizard_level_",
                                },
                            },
                        },
                        -- tier
                        {
                            ColumnNumber = 7,
                            Type = "REPLACE",
                            -- Index of column from indicated step
                            Value = "0",
                        },
                        -- Number of points on creation
                        {
                            ColumnNumber = 9,
                            Type = "REPLACE",
                            -- Index of column from indicated step
                            Value = "1",
                        },
                        -- Required number of parents
                        {
                            ColumnNumber = 10,
                            Type = "REPLACE",
                            -- Index of column from indicated step
                            Value = "0",
                        },
                        -- Visible in UI
                        {
                            ColumnNumber = 11,
                            Type = "REPLACE",
                            -- Index of column from indicated step
                            Value = "true",
                        },
                    },
                },
                -- Create the upgrade node
                {
                    Type = "NEWROW",
                    Columns = {
                        -- Character skill key
                        {
                            ColumnNumber = 2,
                            Type = "FUNCTIONGetUpgradedWizardLevelCharacterSkillKey",
                            -- Index of column from indicated step
                            Value = "",
                        },
                        -- Character skill node set key
                        {
                            ColumnNumber = 3,
                            Type = "MATCHINGSTEP2",
                            -- Index of column from indicated step
                            Value = "4",
                        },
                        -- indent
                        {
                            ColumnNumber = 5,
                            Type = "MATCHINGSTEP5",
                            -- Index of column from indicated step
                            Value = "5",
                        },
                        -- key
                        {
                            ColumnNumber = 6,
                            Type = "FUNCTIONGetUpgradedWizardLevelKey",
                            Value = "4",
                        },
                        -- tier
                        {
                            ColumnNumber = 7,
                            Type = "FUNCTIONGetUpgradedWizardLevelTier",
                            -- Index of column from indicated step
                            Value = "6",
                        },
                        -- Number of points on creation
                        {
                            ColumnNumber = 9,
                            Type = "REPLACE",
                            -- Index of column from indicated step
                            Value = "0",
                        },
                        -- Required number of parents
                        {
                            ColumnNumber = 10,
                            Type = "REPLACE",
                            -- Index of column from indicated step
                            Value = "9",
                        },
                        -- Visible in UI
                        {
                            ColumnNumber = 11,
                            Type = "REPLACE",
                            -- Index of column from indicated step
                            Value = "true",
                        },
                    },
                },
            },
            -- This value is used if a column has unsepecified transforms
            DefaultColumnTransformBehaviour = "SELECTNONE",
        },
    }
}
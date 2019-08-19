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
                    Type = "CONTAINSVALUE",
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
        STEP5 = {
            -- The name of the file this transform operation is to be applied to
            FileName = "character_skill_level_to_effects_junctions_tables_data__",
            -- In an operation if the condition is met,
            -- Then the transforms are applied
            Filters = {
                -- Effect key
                {
                    ColumnNumber = 2,
                    Type = "DOESNOTCONTAINVALUE",
                    -- Index of column from indicated step
                    Value = "wh_main_effect_agent_action_success_chance_enemy_skill",
                    Operator = "AND",
                },
                -- Character skill key
                {
                    ColumnNumber = 1,
                    Type = "MATCHINGSTEP4",
                    -- Index of column from indicated step
                    Value = "2",
                    Operator = "AND",
                },
                -- Effect key
                {
                    ColumnNumber = 2,
                    Type = "DOESNOTCONTAINVALUE",
                    -- Index of column from indicated step
                    Value = "wh_main_effect_agent_action_success_chance_skill",
                    Operator = "AND",
                },
                -- Effect key
                {
                    ColumnNumber = 2,
                    Type = "DOESNOTCONTAINVALUE",
                    -- Index of column from indicated step
                    Value = "reduce_wom",
                    Operator = "AND",
                },
                -- Effect key
                --[[{
                    ColumnNumber = 2,
                    Type = "DOESNOTCONTAINVALUE",
                    -- Index of column from indicated step
                    Value = "_cooldown",
                    Operator = "AND",
                },--]]
                -- Effect key
                {
                    ColumnNumber = 2,
                    Type = "DOESNOTCONTAINVALUE",
                    -- Index of column from indicated step
                    Value = "_miscast_reduction",
                    Operator = "AND",
                },
                -- Effect key
                {
                    ColumnNumber = 2,
                    Type = "DOESNOTCONTAINVALUE",
                    -- Index of column from indicated step
                    Value = "_dummy",
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
            DefaultColumnTransformBehaviour = "SELECTNONE",
            NextTransformOperation = "STEP7",
        },
        STEP6 = {
            -- The name of the file this transform operation is to be applied to
            FileName = "effects_tables_data__",
            -- In an operation if the condition is met,
            -- Then the transforms are applied
            Filters = {
                -- Effect key
                {
                    ColumnNumber = 1,
                    Type = "FUNCTIONIsMatchingOrWhitelistedEffect",
                    Value = "",
                    Operator = "AND",
                },
            },
            --[[FilterExceptions = {
                -- Character skill key
                {
                    ColumnNumber = 1,
                    Type = "SKIPIFPREVIOUSSTEP5",
                    Value = {1, "wh_main_skill_all_magic_all_07_earthing", },
                    Operator = "OR",
                },
                -- Character skill key
                {
                    ColumnNumber = 1,
                    Type = "SKIPIFPREVIOUSSTEP5",
                    Value = {1, "wh_main_skill_all_magic_all_08_power_drain", },
                    Operator = "OR",
                },
                -- Character skill key
                {
                    ColumnNumber = 1,
                    Type = "SKIPIFPREVIOUSSTEP5",
                    Value = {1, "wh_main_skill_all_magic_all_11_arcane_conduit", },
                    Operator = "OR",
                },
            },--]]
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
            DefaultColumnTransformBehaviour = "SELECTNONE",
            NextTransformOperation = "STEP7",
        },
        STEP7 = {
            -- The name of the file this transform operation is to be applied to
            FileName = "effect_bonus_value_unit_ability_junctions_tables_data__",
            -- In an operation if the condition is met,
            -- Then the transforms are applied
            Filters = {
                -- Effect key
                {
                    ColumnNumber = 1,
                    Type = "MATCHINGSTEP6",
                    Value = "1",
                    Operator = "AND",
                },
            },
            FilterExceptions = {
                -- Character skill key
                {
                    ColumnNumber = 1,
                    Type = "SKIPIFPREVIOUSSTEP5",
                    Value = {1, "wh_main_skill_all_magic_all_07_earthing", },
                    Operator = "OR",
                },
                -- Character skill key
                {
                    ColumnNumber = 1,
                    Type = "SKIPIFPREVIOUSSTEP5",
                    Value = {1, "wh_main_skill_all_magic_all_08_power_drain", },
                    Operator = "OR",
                },
                -- Character skill key
                {
                    ColumnNumber = 1,
                    Type = "SKIPIFPREVIOUSSTEP5",
                    Value = {1, "wh_main_skill_all_magic_all_11_arcane_conduit", },
                    Operator = "OR",
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
            DefaultColumnTransformBehaviour = "SELECTNONE",
            NextTransformOperation = "STEP8",
        },
        -- Adjust positioning of existing skill nodes
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
            -- This should be done once, assuming the filter criteria is met
            PerformOnce = true,
            -- Transforms determine how data should be changed
            -- In this case I just want to load the data so I can transform it
            -- in other STEPS
            Transforms = {
                {
                    Type = "NEWROW",
                    Columns = {
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
                            Type = "FUNCTIONGetRequiredNumberofParentsBehaviour",
                            -- Index of column from indicated step
                            Value = "",
                        },
                    },
                },
            },
            -- This value is used if a column has unsepecified transforms
            DefaultColumnTransformBehaviour = "SELECTEXISTING",
            NextTransformOperation = "STEP9",
        },
        -- Handle missing vanilla skills
        STEP9 = {
            -- The name of the file this transform operation is to be applied to
            FileName = "character_skill_node_links_tables_data__",
            -- In an operation if the condition is met,
            -- Then the transforms are applied
            Filters = {
                -- We don't want to do this for Arcane conduit
                {
                    ColumnNumber = 1,
                    Type = "FUNCTIONIsNotArcaneConduit",
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
                            Type = "MATCHINGSTEP3",
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
                            Type = "REPLACE",
                            Value = "REQUIRED",
                        },
                    }
                },
            },
            -- This value is used if a column has unsepecified transforms
            DefaultColumnTransformBehaviour = "SELECTEXISTING",
            NextTransformOperation = "STEP10",
        },
        -- Create new skill groupings
        STEP10 = {
            -- The name of the file this transform operation is to be applied to
            FileName = "character_skill_node_links_tables_data__",
            -- In an operation if the condition is met,
            -- Then the transforms are applied
            Filters = {
                -- We don't want to do this for level1 default spells
                -- or Arcane conduit
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
                            Type = "REPLACEWITHTRANSFORMEDSTEP9",
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
            NextTransformOperation = "STEP11",
        },
        -- Create the new skills
        STEP11 = {
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
                            Type = "MATCHINGSTEP8",
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
                            Type = "FUNCTIONGetUpgradedWizardLevelKey",
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
                            Type = "MATCHINGSTEP8",
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
                                    Value = "wwl_upgraded_wizard_level_",
                                },
                            },
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
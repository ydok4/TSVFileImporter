UnitCapEffectTransforms = {
    -- Each record can have transform operations applied
    -- Each table below is a transform operation
    -- For each record the condition will be checked and then
    -- the transform applied
    -- Empire Rebel Transform
    main_units_tables_data__ = {
        STEP1 = {
            -- The name of the file this transform operation is to be applied to
            FileName = "main_units_tables_data__",
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
                        {
                            ColumnKey = "campaign_cap",
                            ColumnNumber = 2,
                            Type = "REPLACE",
                            Value = "0",
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
            FileName = "unit_sets_tables_data__",
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
                            ColumnKey = "key",
                            ColumnNumber = 1,
                            Type = "SELECTEXISTING",
                            NumberOfOperations = 3,
                            Operations = {
                                OPERATION1 = {
                                    Type = "MATCHINGSTEP1",
                                    Value = 18,
                                },
                                OPERATION2 = {
                                    Type = "PREPEND",
                                    Value = "urp_",
                                },
                                OPERATION3 = {
                                    Type = "APPEND",
                                    Value = "_unit_set",
                                },
                            },
                        },
                        {
                            ColumnKey = "use_unit_exp_level_range",
                            ColumnNumber = 2,
                            Type = "REPLACE",
                            Value = "false",
                        },
                        {
                            ColumnKey = "min_unit_exp_level_inclusive",
                            ColumnNumber = 3,
                            Type = "REPLACE",
                            Value = "-1",
                        },
                        {
                            ColumnKey = "max_unit_exp_level_inclusive",
                            ColumnNumber = 4,
                            Type = "REPLACE",
                            Value = "-1",
                        },
                    },
                },
            },
            -- This value is used if a column has unsepecified transforms
            DefaultColumnTransformBehaviour = "SELECTBLANK",
            NextTransformOperation = "STEP3",
        },
        STEP3 = {
            FileName = "unit_set_to_unit_junctions_tables_data__",
            Filters = {

            },
            -- This should be done once, assuming the filter criteria is met
            PerformOnce = true,
            Transforms = {
                {
                    Type = "NEWROW",
                    Columns = {
                        {
                            -- Unit Key column
                            ColumnKey = "unit_record",
                            ColumnNumber = 5,
                            Type = "MATCHINGSTEP1",
                            Value = 18,
                        },
                        {
                            -- Unit Set Key column
                            ColumnKey = "unit_set",
                            ColumnNumber = 6,
                            Type = "REPLACEWITHTRANSFORMEDSTEP2",
                            Value = 1,
                        },
                        {
                            -- Unit Set Key column
                            ColumnKey = "exclude",
                            ColumnNumber = 1,
                            Type = "REPLACE",
                            Value = "false",
                        },
                    },
                }
            },
            DefaultColumnTransformBehaviour = "SELECTBLANK",
            NextTransformOperation = "STEP4",
        },
        STEP4 = {
            -- The name of the file this transform operation is to be applied to
            FileName = "effects_tables_data__",
            -- In an operation if the condition is met,
            -- Then the transforms are applied
            Filters = {

            },
            -- Transforms determine how data should be changed
            -- In this case I just want to load the data so I can transform it 
            -- in other STEPS
            Transforms = {
                -- Unit Caps
                {
                    Type = "NEWROW",
                    Columns = {
                        {
                            ColumnKey = "effect",
                            ColumnNumber = 1,
                            Type = "SELECTEXISTING",
                            NumberOfOperations = 2,
                            Operations = {
                                OPERATION1 = {
                                    Type = "MATCHINGSTEP1",
                                    Value = 18,
                                },
                                OPERATION2 = {
                                    Type = "APPEND",
                                    Value = "_unit_cap",
                                },
                            },
                        },
                        {
                            ColumnKey = "icon",
                            ColumnNumber = 2,
                            Type = "REPLACE",
                            Value = "",
                        },
                        {
                            ColumnKey = "priority",
                            ColumnNumber = 3,
                            Type = "REPLACE",
                            Value = "0",
                        },
                        {
                            ColumnKey = "icon_negative",
                            ColumnNumber = 4,
                            Type = "REPLACE",
                            Value = "",
                        },
                        {
                            ColumnKey = "category",
                            ColumnNumber = 5,
                            Type = "REPLACE",
                            Value = "campaign",
                        },
                        {
                            ColumnKey = "is_positive_value_good",
                            ColumnNumber = 6,
                            Type = "REPLACE",
                            Value = "true",
                        },
                    },
                },
            },
            -- This value is used if a column has unsepecified transforms
            DefaultColumnTransformBehaviour = "SELECTBLANK",
            NextTransformOperation = "STEP5",
        },
        STEP5 = {
            FileName = "effect_bundles_tables_data__",
            Filters = {

            },
            Transforms = {
                -- Unit Caps
                {
                    Type = "REPEAT30",
                    Columns = {
                        {
                            ColumnKey = "key",
                            ColumnNumber = 1,
                            Type = "SELECTEXISTING",
                            NumberOfOperations = 3,
                            Operations = {
                                OPERATION1 = {
                                    Type = "MATCHINGSTEP1",
                                    Value = 18,
                                },
                                OPERATION2 = {
                                    Type = "PREPEND",
                                    Value = "urp_effect_bundle_",
                                },
                                OPERATION3 = {
                                    Type = "APPEND",
                                    Value = "_unit_cap_".."REPEATINDEX",
                                },
                            },
                        },
                        {
                            ColumnKey = "ui_icon",
                            ColumnNumber = 4,
                            Type = "REPLACE",
                            Value = "",
                        },
                        {
                            ColumnKey = "priority",
                            ColumnNumber = 5,
                            Type = "REPLACE",
                            Value = "0",
                        },
                        {
                            ColumnKey = "bundle_target",
                            ColumnNumber = 6,
                            Type = "REPLACE",
                            Value = "faction",
                        },
                    },
                },
            },
            DefaultColumnTransformBehaviour = "SELECTBLANK",
            NextTransformOperation = "STEP6",
        },
        STEP6 = {
            FileName = "effect_bundles_to_effects_junctions_tables_data__",
            Filters = {

            },
            Transforms = {
                -- Unit Caps
                {
                    Type = "REPEAT30",
                    Columns = {
                        {
                            ColumnKey = "effect_bundle_key",
                            ColumnNumber = 1,
                            Type = "REPLACEWITHTRANSFORMEDSTEP5",
                            Value = 1,
                        },
                        {
                            ColumnKey = "effect_key",
                            ColumnNumber = 2,
                            Type = "REPLACEWITHTRANSFORMEDSTEP4",
                            Value = 1,
                        },
                        {
                            ColumnKey = "effect_scope",
                            ColumnNumber = 3,
                            Type = "REPLACE",
                            Value = "faction_to_faction_own_unseen",
                        },
                        {
                            ColumnKey = "value",
                            ColumnNumber = 4,
                            Type = "REPLACE",
                            Value = "REPEATINDEX",
                        },
                        {
                            ColumnKey = "advancement_stage",
                            ColumnNumber = 5,
                            Type = "REPLACE",
                            Value = "start_turn_completed",
                        },
                    },
                },
            },
            DefaultColumnTransformBehaviour = "SELECTBLANK",
            NextTransformOperation = "STEP7",
        },
        STEP7 = {
            -- The name of the file this transform operation is to be applied to
            FileName = "effects_tables_data__",
            -- In an operation if the condition is met,
            -- Then the transforms are applied
            Filters = {

            },
            -- Transforms determine how data should be changed
            -- In this case I just want to load the data so I can transform it
            -- in other STEPS
            Transforms = {
                -- Replenishment modifiers
                {
                    Type = "NEWROW",
                    Columns = {
                        {
                            ColumnKey = "effect",
                            ColumnNumber = 1,
                            Type = "SELECTEXISTING",
                            NumberOfOperations = 2,
                            Operations = {
                                OPERATION1 = {
                                    Type = "MATCHINGSTEP1",
                                    Value = 18,
                                },
                                OPERATION2 = {
                                    Type = "APPEND",
                                    Value = "_replenishment_modifier",
                                },
                            },
                        },
                        {
                            ColumnKey = "icon",
                            ColumnNumber = 2,
                            Type = "REPLACE",
                            Value = "",
                        },
                        {
                            ColumnKey = "priority",
                            ColumnNumber = 3,
                            Type = "REPLACE",
                            Value = "0",
                        },
                        {
                            ColumnKey = "icon_negative",
                            ColumnNumber = 4,
                            Type = "REPLACE",
                            Value = "",
                        },
                        {
                            ColumnKey = "category",
                            ColumnNumber = 5,
                            Type = "REPLACE",
                            Value = "campaign",
                        },
                        {
                            ColumnKey = "is_positive_value_good",
                            ColumnNumber = 6,
                            Type = "REPLACE",
                            Value = "true",
                        },
                    },
                },
            },
            -- This value is used if a column has unsepecified transforms
            DefaultColumnTransformBehaviour = "SELECTBLANK",
            NextTransformOperation = "STEP8",
        },
        STEP8 = {
            FileName = "effect_bundles_tables_data__",
            Filters = {

            },
            Transforms = {
                -- Replenishment Modifiers
                {
                    Type = "REPEAT10",
                    Columns = {
                        {
                            ColumnKey = "key",
                            ColumnNumber = 1,
                            Type = "SELECTEXISTING",
                            NumberOfOperations = 3,
                            Operations = {
                                OPERATION1 = {
                                    Type = "MATCHINGSTEP1",
                                    Value = 18,
                                },
                                OPERATION2 = {
                                    Type = "PREPEND",
                                    Value = "urp_effect_bundle_",
                                },
                                OPERATION3 = {
                                    Type = "APPEND",
                                    Value = "_replenishment_modifier_".."REPEATINDEX",
                                },
                            },
                        },
                        {
                            ColumnKey = "ui_icon",
                            ColumnNumber = 4,
                            Type = "REPLACE",
                            Value = "",
                        },
                        {
                            ColumnKey = "priority",
                            ColumnNumber = 5,
                            Type = "REPLACE",
                            Value = "0",
                        },
                        {
                            ColumnKey = "bundle_target",
                            ColumnNumber = 6,
                            Type = "REPLACE",
                            Value = "faction",
                        },
                    },
                },
            },
            DefaultColumnTransformBehaviour = "SELECTBLANK",
            NextTransformOperation = "STEP9",
        },
        STEP9 = {
            FileName = "effect_bundles_to_effects_junctions_tables_data__",
            Filters = {

            },
            Transforms = {
                -- Replenishment Modifiers
                {
                    Type = "REPEAT10",
                    Columns = {
                        {
                            ColumnKey = "effect_bundle_key",
                            ColumnNumber = 1,
                            Type = "REPLACEWITHTRANSFORMEDSTEP8",
                            Value = 1,
                        },
                        {
                            ColumnKey = "effect_key",
                            ColumnNumber = 2,
                            Type = "REPLACEWITHTRANSFORMEDSTEP7",
                            Value = 1,
                        },
                        {
                            ColumnKey = "effect_scope",
                            ColumnNumber = 3,
                            Type = "REPLACE",
                            Value = "faction_to_faction_own_unseen",
                        },
                        {
                            ColumnKey = "value",
                            ColumnNumber = 4,
                            Type = "SELECTEXISTING",
                            NumberOfOperations = 2,
                            Operations = {
                                OPERATION1 = {
                                    Type = "REPLACE",
                                    Value = "REPEATINDEX",
                                },
                                OPERATION2 = {
                                    Type = "MULTIPLY",
                                    Value = "-10",
                                },
                            },
                        },
                        {
                            ColumnKey = "advancement_stage",
                            ColumnNumber = 5,
                            Type = "REPLACE",
                            Value = "start_turn_completed",
                        },
                    },
                },
            },
            DefaultColumnTransformBehaviour = "SELECTBLANK",
            NextTransformOperation = "STEP10",
        },
        STEP10 = {
            FileName = "effect_bonus_value_ids_unit_sets_tables_data__",
            Filters = {

            },
            Transforms = {
                -- Unit caps
                {
                    Type = "NEWROW",
                    Columns = {
                        {
                            ColumnKey = "bonus_value_id",
                            ColumnNumber = 1,
                            Type = "REPLACE",
                            Value = "unit_cap",
                        },
                        {
                            ColumnKey = "effect",
                            ColumnNumber = 2,
                            Type = "REPLACEWITHTRANSFORMEDSTEP4",
                            Value = 1,
                        },
                        {
                            ColumnKey = "unit_set",
                            ColumnNumber = 3,
                            Type = "REPLACEWITHTRANSFORMEDSTEP2",
                            Value = 1,
                        },
                    },
                },
            },
            DefaultColumnTransformBehaviour = "SELECTBLANK",
            NextTransformOperation = "STEP11",
        },
        STEP11 = {
            FileName = "effect_bonus_value_ids_unit_sets_tables_data__",
            Filters = {

            },
            Transforms = {
                -- Replenishment Modifiers
                {
                    Type = "NEWROW",
                    Columns = {
                        {
                            ColumnKey = "bonus_value_id",
                            ColumnNumber = 1,
                            Type = "REPLACE",
                            Value = "replenishment_percentage_bonus",
                        },
                        {
                            ColumnKey = "effect",
                            ColumnNumber = 2,
                            Type = "REPLACEWITHTRANSFORMEDSTEP7",
                            Value = 1,
                        },
                        {
                            ColumnKey = "unit_set",
                            ColumnNumber = 3,
                            Type = "REPLACEWITHTRANSFORMEDSTEP2",
                            Value = 1,
                        },
                    },
                },
            },
            DefaultColumnTransformBehaviour = "SELECTBLANK",
        },
    },
}
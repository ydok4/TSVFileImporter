WWLTraitFilters = {
    -- Original magic effects
    effects_tables_data__ = {
        FileName = {"effects_tables_data__.tsv", "lore_of_deep_effects_tables_data__.tsv",},
        Directory = "VanillaTSVs",
        OutputFile = true,
        -- Filters work on a per column basis
        -- Each index in the filter object correlates to
        -- a column in a tsv loaded table
        -- Keywords are used to denote what type of filtering should be applied
        Filter = {
            {
                -- Effect Key
                ColumnNumber = 1,
                Type = "DOESNOTCONTAINVALUE",
                Value = "_bound",
                Operator = "AND",
            },
            {
                -- Effect Key
                ColumnNumber = 1,
                Type = "DOESNOTCONTAINVALUE",
                Value = "_upgrade",
                Operator = "AND",
            },
            {
                -- Effect Key
                ColumnNumber = 1,
                Type = "DOESNOTCONTAINVALUE",
                Value = "_kroak",
                Operator = "AND",
            },
            {
                -- Effect Key
                ColumnNumber = 1,
                Type = "DOESNOTCONTAINVALUE",
                Value = "_cooldown_",
                Operator = "AND",
            },
            {
                -- Effect Key
                ColumnNumber = 1,
                Type = "DOESNOTCONTAINVALUE",
                Value = "_reduce_wom_",
                Operator = "AND",
            },
            {
                -- Effect Key
                ColumnNumber = 1,
                Type = "DOESNOTCONTAINVALUE",
                Value = "_miscast_",
                Operator = "AND",
            },
            {
                -- Effect Key
                ColumnNumber = 1,
                Type = "DOESNOTCONTAINVALUE",
                Value = "wh2_dlc11_cst_enable_lore_of_deep_spells",
                Operator = "AND",
            },
            {
                -- Effect Key
                ColumnNumber = 1,
                Type = "CONTAINSVALUE",
                Value = "effect_magic_",
                Operator = "OR",
            },
            {
                -- Effect Key
                ColumnNumber = 1,
                Type = "CONTAINSVALUE",
                Value = "wh2_dlc09_spell_nehekhara_",
                Operator = "OR",
            },
            {
                -- Effect Key
                ColumnNumber = 1,
                Type = "CONTAINSVALUE",
                Value = "wh2_dlc11_ability_enable_",
                Operator = "OR",
            },
            {
                -- Effect Key
                ColumnNumber = 1,
                Type = "CONTAINSVALUE",
                Value = "wh_dlc05_effect_magic_",
                Operator = "OR",
            },
        },
    },
    -- New effect bonus values
    effect_bonus_value_unit_ability_junctions_tables_data__ = {
        FileName = "effect_bonus_value_unit_ability_junctions_tables_data__.tsv",
        Directory = "VanillaTSVs",
        OutputFile = true,
        Filter = {
            {
                -- Bonus value
                ColumnNumber = 2,
                Type = "MATCHVALUE",
                Value = "enable",
                Operator = "AND",
            },
        },
    },
    -- New Trait files
    trait_info_tables_data__ = {
        FileName = "trait_info_tables_data__.tsv",
        Directory = "VanillaTSVs",
        OutputFile = true,
        OnlyLoadHeader = true,
        Filter = {
        },
    },
    character_trait_levels_tables_data__ = {
        FileName = "character_trait_levels_tables_data__.tsv",
        Directory = "VanillaTSVs",
        OutputFile = true,
        OnlyLoadHeader = true,
        Filter = {
        },
    },
    character_traits_tables_data__ = {
        FileName = "character_traits_tables_data__.tsv",
        Directory = "VanillaTSVs",
        OutputFile = true,
        OnlyLoadHeader = true,
        Filter = {
        },
    },
    trait_level_effects_tables_data__ = {
        FileName = "trait_level_effects_tables_data__.tsv",
        Directory = "VanillaTSVs",
        OutputFile = true,
        OnlyLoadHeader = true,
        Filter = {
        },
    },
    -- Effect bundle files
    effect_bundles_tables_data__ = {
        FileName = "effect_bundles_tables_data__.tsv",
        Directory = "VanillaTSVs",
        OutputFile = true,
        OnlyLoadHeader = true,
        Filter = {
        },
    },
    effect_bundles_to_effects_junctions_tables_data__ = {
        FileName = "effect_bundles_to_effects_junctions_tables_data__.tsv",
        Directory = "VanillaTSVs",
        OutputFile = true,
        OnlyLoadHeader = true,
        Filter = {
        },
    },
}
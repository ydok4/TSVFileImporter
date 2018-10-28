MixuTraitFilters = {
    -- Original skill files
    character_skills_tables_data__ = {
        FileName = "character_skills_tables_ab_mixus_hero_pack_innates__.tsv",
        Directory = "MixuTSV",
        -- Filters work on a per column basis
        -- Each index in the filter object correlates to
        -- a column in a tsv loaded table
        -- Keywords are used to denote what type of filtering should be applied
        Filter = {
            {
                -- Skill Key
                ColumnNumber = 2,
                Type = "CONTAINSVALUE",
                Value = "innate",
                Operator = "AND",
            },
        },
    },
    character_skill_level_to_effects_junctions_tables_data__ = {
        FileName = "character_skill_level_to_effects_junctions_tables_ab_mixus_agent_actions_innates__.tsv",
        Directory = "MixuTSV",
        Filter = {
            {
                -- Skill Key
                ColumnNumber = 1,
                Type = "CONTAINSVALUE",
                Value = "innate",
                Operator = "AND",
            },
        },
    },
    -- New Trait files
    trait_info_tables_data__ = {
        FileName = "aa_mixus_trait_info_tables_data__.tsv",
        Directory = "MixuTSV",
        OutputFile = true,
        Filter = {
        },
    },
    character_trait_levels_tables_data__ = {
        FileName = "aa_mixus_character_trait_levels_tables_data__.tsv",
        Directory = "MixuTSV",
        OutputFile = true,
        Filter = {
        },
    },
    character_traits_tables_data__ = {
        FileName = "aa_mixus_character_traits_tables_data__.tsv",
        Directory = "MixuTSV",
        OutputFile = true,
        Filter = {
        },
    },
    trait_level_effects_tables_data__ = {
        FileName = "aa_mixus_trait_level_effects_tables_data__.tsv",
        Directory = "MixuTSV",
        OutputFile = true,
        Filter = {
        },
        --OnlyLoadHeader = true,
    },
}
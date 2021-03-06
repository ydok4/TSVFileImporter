MixuTraitLocFilters = {
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
    character_skills__loc = {
        FileName = "ab_mixus_hero_pack_character_skills.loc.tsv",
        Directory = "MixuTSV",
        OutputFile = false,
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
    character_trait_levels__loc = {
        FileName = "character_trait_levels__.loc.tsv",
        Directory = "MixuTSV",
        OutputFile = true,
        Filter = {
        },
    },
}
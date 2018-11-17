TraitLocFilters = {
    -- Original skill files
    character_skills_tables_data__ = {
        FileName = "character_skills_tables_data__.tsv",
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
        Directory = "VanillaLoc",
        FileName = "character_skills__.loc.tsv",
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
        Directory = "VanillaLoc",
        FileName = "character_trait_levels__.loc.tsv",
        OutputFile = true,
        Filter = {
        },
    },
}
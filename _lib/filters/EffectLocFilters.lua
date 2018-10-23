EffectLocFilters = {
        -- Original skill files
        character_skill_level_to_effects_junctions_tables_data__ = {
        FileName = "character_skill_level_to_effects_junctions_tables_data__.tsv",
        -- Filters work on a per column basis
        -- Each index in the filter object correlates to
        -- a column in a tsv loaded table
        -- Keywords are used to denote what type of filtering should be applied
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
    -- Relevant effects
    effects_tables_data__ = {
        FileName = "effects_tables_data__.tsv",
        -- Filters work on a per column basis
        -- Each index in the filter object correlates to
        -- a column in a tsv loaded table
        -- Keywords are used to denote what type of filtering should be applied
        OutputFile = false,
        Filter = {

        },
    },
    -- Output Lua files
    EffectResources = {
        FileName = "EffectResources.lua",
        OutputFile = true,
        ExportAsLua = true,
        LuaData = {
            KeyColumn = 1,
            RequiredColumns = {"2", "4", "6"},
        },
        Filter = {

        },
    },
    TraitsToEffects = {
        FileName = "TraitsToEffects.lua",
        OutputFile = true,
        ExportAsLua = true,
        LuaData = {
            KeyColumn = 1,
            -- Excludes key column because that is always required
            RequiredColumns = {"2", "5"},
            ColumnNames = {
                [2] = "Effects",
                [5] = "Values",
            },
        },
        Filter = {

        },
    },
}
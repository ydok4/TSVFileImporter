MixuEffectLocFilters = {
        -- Original skill files
        character_skills_tables_data__ = {
            FileName = "character_skills_tables_ab_mixus_hero_pack_innates__.tsv",
            Directory = "MixuTSV",
            OutputFile = false,
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
        FileName = "MixuEffectResources.lua",
        Directory = "MixuTSV",
        OutputFile = true,
        ExportAsLua = true,
        LuaData = {
            RootName = "MixuEffectResources",
            KeyColumn = 1,
            RequiredColumns = {"2", "4", "6"},
        },
        Filter = {

        },
    },
    TraitsToEffects = {
        FileName = "MixuTraitsToEffects.lua",
        Directory = "MixuTSV",
        OutputFile = true,
        ExportAsLua = true,
        LuaData = {
            RootName = "MixuTraitsToEffects",
            KeyColumn = 1,
            -- Excludes key column because that is always required
            RequiredColumns = {"4", "2", "5"},
            ColumnNames = {
                [2] = "Effects",
                [4] = "Icon",
                [5] = "Values",
            },
            -- Columns which should not be displayed as tables
            SingleValue = {
                [4] = true,
            },
        },
        Filter = {

        },
    },
}
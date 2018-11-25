EffectLocFilters = {
        -- Original skill files
        character_skills_tables_data__ = {
            FileName = "character_skills_tables_data__.tsv",
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
            RequiredColumns = {"2",},
            ColumnNames = {
                {
                    TableColumn = 2,
                    KeyName = "IconPositive",
                    SingleValue = true,
                },
                {
                    TableColumn = 4,
                    KeyName = "IconNegative",
                    SingleValue = true,
                },
                {
                    TableColumn = 6,
                    KeyName = "IsPositiveGood",
                    SingleValue = true,
                },
            },
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
            RequiredColumns = {"2",},
            ColumnNames = {
                {
                    TableColumn = 2,
                    KeyName = "Effects",
                    AsTableItem = true,
                },
                {
                    TableColumn = 4,
                    KeyName = "Icon",
                    SingleValue = true,
                },
                {
                    TableColumn = 5,
                    KeyName = "Values",
                    AsTableItem = true,
                    AllowDuplicates = true,
                },
            },
        },
        Filter = {

        },
    },
}
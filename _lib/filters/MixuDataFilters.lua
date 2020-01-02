MixuDataFilters = {
    agent_subtypes_tables_data__= {
        FileName = "agent_subtypes_tables_ab_mixus_hero_pack.tsv",
        Directory = "MixuTSVs",
        OutputFile = false,
        Filter = {
            --[[{
                -- Agent sub typs
                ColumnNumber = 1,
                Type = "CONTAINSVALUE",
                Value = "emp_lord",
                Operator = "OR",
            },--]]
        },
    },
    -- Original skill files
    campaign_character_art_sets_tables_data__ = {
        FileName = "campaign_character_art_sets_tables_ab_mixu_ttl.tsv",
        Directory = "MixuTSVs",
        -- Filters work on a per column basis
        -- Each index in the filter object correlates to
        -- a column in a tsv loaded table
        -- Keywords are used to denote what type of filtering should be applied
        OutputFile = false,
        Filter = {
            {
                ColumnNumber = 6,
                Type = "CONTAINSVALUE",
                Value = "false",
                Operator = "AND",
            },
        },
    },
    effects_tables = {
        Directory = "VanillaTSVs",
        FileName = "effects_tables_data__.tsv",
        OutputFile = true,
        Filter = {
        },
    },


    effect_bonus_value_agent_junction_tables = {
        Directory = "VanillaTSVs",
        FileName = "effect_bonus_value_agent_junction_tables_data__.tsv",
        OutputFile = true,
        Filter = {
        },
    },

    effect_bonus_value_agent_subtype_junctions_tables = {
        Directory = "VanillaTSVs",
        FileName = "effect_bonus_value_agent_subtype_junctions_tables_data__.tsv",
        OutputFile = true,
        Filter = {
        },
    },
    -- Output Lua files
    AgentDataResources = {
        FileName = "MixuDataResources.lua",
        OutputFile = true,
        ExportAsLua = true,
        LuaData = {
            RootName = "MixuDataResources",
            KeyColumn = 8,
            ColumnNames = {
                {
                    TableColumn = 1,
                    KeyName = "AgentType",
                    AsTableItem = false,
                    SingleValue = true,
                },
                {
                    TableColumn = 2,
                    KeyName = "ArtSetIds",
                    AsTableItem = true,
                },
                {
                    TableColumn = 9,
                    KeyName = "IsFemale",
                    AsTableItem = true,
                    SingleValue = true,
                },
            },
        },
        Filter = {

        },
    },
}
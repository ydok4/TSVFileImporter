AgentDataFilters = {
    agent_subtypes_tables_data__ = {
        Directory = "VanillaTSVs",
        FileName = "agent_subtypes_tables_data__.tsv",
        OutputFile = false,
        Filter = {
            --[[{
                -- Agent sub typs
                ColumnNumber = 1,
                Type = "CONTAINSVALUE",
                Value = "wh2_main_hef_prince",
                Operator = "OR",
            },--]]
        },
    },
    campaign_character_art_sets_tables_data__ = {
        Directory = "VanillaTSVs",
        FileName = "campaign_character_art_sets_tables_data__.tsv",
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
    factions_tables_data__ = {
        Directory = "VanillaTSVs",
        FileName = "factions_tables_data__.tsv",
        OutputFile = false,
        Filter = {
        },
    },
    faction_agent_permitted_subtypes_tables = {
        FileName = "faction_agent_permitted_subtypes_tables_data__.tsv",
        OutputFile = true,
        Filter = {
        },
    },

    names_groups_tables = {
        Directory = "VanillaTSVs",
        FileName = "names_groups_tables_data__.tsv",
        OutputFile = false,
        Filter = {
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
        FileName = "AgentDataResources.lua",
        OutputFile = true,
        ExportAsLua = true,
        LuaData = {
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
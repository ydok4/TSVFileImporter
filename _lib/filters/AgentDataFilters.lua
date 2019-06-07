AgentDataFilters = {
    agent_subtypes_tables_data__= {
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
        --[[ {
                -- Art set id
                ColumnNumber = 2,
                Type = "CONTAINSVALUE",
                Value = "emp_general",
                Operator = "OR",
            },--]]
        },
    },
    factions_tables_data__ = {
        Directory = "VanillaTSVs",
        FileName = "factions_tables_data__.tsv",
        OutputFile = false,
        Filter = {
        },
    },
    faction_agent_permitted_subtypes_tables_data__ = {
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

    -- Output Lua files
    AgentDataResources = {
        FileName = "AgentDataResources.lua",
        OutputFile = true,
        ExportAsLua = true,
        LuaData = {
            KeyColumn = 8,
            ColumnNames = {
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
                {
                    TableColumn = 4,
                    KeyName = "NameGroup",
                    AsTableItem = true,
                    SingleValue = true,
                },
            },
        },
        Filter = {

        },
    },
}
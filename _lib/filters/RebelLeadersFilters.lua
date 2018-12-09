RebelLeadersFilters = {
    faction_agent_permitted_subtypes_tables_data__ = {
        Directory = "VanillaTSVs",
        FileName = "faction_agent_permitted_subtypes_tables_data__.tsv",
        OutputFile = true,
        -- Filters work on a per column basis
        -- Each index in the filter object correlates to
        -- a column in a tsv loaded table
        -- Keywords are used to denote what type of filtering should be applied
        Filter = {
            {
                -- Agent Column
                ColumnNumber = 1,
                Type = "MATCHVALUE",
                Value = "general",
                Operator = "AND",
            },
            --[[{
                -- Faction Column
                ColumnNumber = 2,
                Type = "MATCHVALUE",
                Value = "wh2_main_def_dark_elves_qb1",
                Operator = "OR",
            },--]]
            {
                -- Faction Column
                ColumnNumber = 2,
                Type = "CONTAINSVALUE",
                Value = "rebel",
                Operator = "OR",
            },
            {
                -- Faction Column
                ColumnNumber = 2,
                Type = "CONTAINSVALUE",
                Value = "waaagh",
                Operator = "OR",
            },
            {
                -- Faction Column
                ColumnNumber = 2,
                Type = "CONTAINSVALUE",
                Value = "brayherd",
                Operator = "OR",
            },
            {
                -- Faction Column
                ColumnNumber = 2,
                Type = "CONTAINSVALUE",
                Value = "intervention",
                Operator = "OR",
            },
            {
                -- Faction Column
                ColumnNumber = 2,
                Type = "CONTAINSVALUE",
                Value = "incursion",
                Operator = "OR",
            },
            {
                -- Faction Column
                ColumnNumber = 2,
                Type = "CONTAINSVALUE",
                Value = "wh_dlc03_bst_beastmen_chaos",
                Operator = "OR",
            },
            {
                -- Faction Column
                ColumnNumber = 2,
                Type = "CONTAINSVALUE",
                Value = "wh2_dlc11_cst_vampire_coast_encounters",
                Operator = "OR",
            },
            {
                -- Faction Column
                ColumnNumber = 2,
                Type = "CONTAINSVALUE",
                Value = "qb",
                Operator = "OR",
            },
            {
                -- Faction Column
                ColumnNumber = 2,
                Type = "CONTAINSVALUE",
                Value = "wh2_dlc11_cst_harpoon_the_sunken_land_corsairs",
                Operator = "OR",
            },
            {
                -- Faction Column
                ColumnNumber = 2,
                Type = "CONTAINSVALUE",
                Value = "wh2_dlc11_brt_bretonnia_dil",
                Operator = "OR",
            },
            {
                -- Faction Column
                ColumnNumber = 2,
                Type = "CONTAINSVALUE",
                Value = "wh2_dlc11_emp_empire_dil",
                Operator = "OR",
            },
            {
                -- Faction Column
                ColumnNumber = 2,
                Type = "CONTAINSVALUE",
                Value = "wh2_dlc11_def_dark_elves_dil",
                Operator = "OR",
            },
            {
                -- Faction Column
                ColumnNumber = 2,
                Type = "CONTAINSVALUE",
                Value = "wh2_dlc11_nor_norsca_dil",
                Operator = "OR",
            },
            {
                -- Faction Column
                ColumnNumber = 2,
                Type = "CONTAINSVALUE",
                Value = "shanty",
                Operator = "OR",
            },
        },
    },
    agent_subtypes_tables_data__= {
        Directory = "VanillaTSVs",
        FileName = "agent_subtypes_tables_data__.tsv",
        OutputFile = true,
        Filter = {
            {
                -- Auto generate column
                ColumnNumber = 2,
                Type = "MATCHVALUE",
                Value = "true",
                Operator = "AND",
            },
            {
                -- Agent key column
                ColumnNumber = 1,
                Type = "DOESNOTMATCHVALUE",
                Value = "default",
                Operator = "AND",
            },
            --[[{
                -- Agent key column
                ColumnNumber = 1,
                Type = "CONTAINSVALUE",
                Value = "def",
                Operator = "AND",
            },--]]
        },
    },
    campaign_character_art_sets_tables_data__= {
        Directory = "VanillaTSVs",
        FileName = "campaign_character_art_sets_tables_data__.tsv",
        OutputFile = true,
        Filter = {
        },
    },
    campaign_character_arts_tables_data__= {
        Directory = "VanillaTSVs",
        FileName = "campaign_character_arts_tables_data__.tsv",
        OutputFile = true,
        Filter = {
        },
    },
    variants_tables_data__= {
        Directory = "VanillaTSVs",
        FileName = "variants_tables_data__.tsv",
        OutputFile = true,
        Filter = {
        },
    },
    agent_uniforms_tables_data__= {
        Directory = "VanillaTSVs",
        FileName = "agent_uniforms_tables_data__.tsv",
        OutputFile = true,
        Filter = {
        },
    },
    agent_culture_details_tables_data__ = {
        Directory = "VanillaTSVs",
        FileName = "agent_culture_details_tables_data__.tsv",
        OutputFile = true,
        Filter = {
        },
    },
    portrait_settings__template = {
        FileName = "portrait_settings__template.xml",
        Directory = "PortraitGenerator",
        OutputFile = true,
        Filter = {
            RootElement = "Entry",
        },
    },

    -- Output Lua files
    RebelLeadersDataResources = {
        FileName = "RebelLeadersDataResources.lua",
        OutputFile = true,
        ExportAsLua = true,
        LuaData = {
            RootName = "RebelLeadersDataResource",
            KeyColumn = 8,
            -- Excludes key column because that is always required
            RequiredColumns = {"2"},
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
RebelLeadersFilters = {
    faction_agent_permitted_subtypes_tables_data__ = {
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
        },
    },
    agent_subtypes_tables_data__= {
        FileName = "agent_subtypes_tables_data__.tsv",
        OutputFile = true,
        Filter = {
            --[[{
                -- Auto generate column
                ColumnNumber = 2,
                Type = "MATCHVALUE",
                Value = "true",
                Operator = "AND",
            },--]]
        },
    },
    campaign_character_art_sets_tables_data__= {
        FileName = "campaign_character_art_sets_tables_data__.tsv",
        OutputFile = true,
        Filter = {
        },
    },
    campaign_character_arts_tables_data__= {
        FileName = "campaign_character_arts_tables_data__.tsv",
        OutputFile = true,
        Filter = {
        },
    },
    variants_tables_data__= {
        FileName = "variants_tables_data__.tsv",
        OutputFile = true,
        Filter = {
        },
    },
    agent_uniforms_tables_data__= {
        FileName = "agent_uniforms_tables_data__.tsv",
        OutputFile = true,
        Filter = {
        },
    },
    agent_culture_details_tables_data__ = {
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
    }
}
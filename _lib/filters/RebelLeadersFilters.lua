RebelLeadersFilters = {
    faction_agent_permitted_subtypes_tables_data__ ={
        FileName = "faction_agent_permitted_subtypes_tables_data__.tsv",
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
        },
    },
    agent_subtypes_tables_data__= {
        FileName = "agent_subtypes_tables_data__.tsv",
        Filter = {
        },
    },
    campaign_character_art_sets_tables_data__= {
        FileName = "campaign_character_art_sets_tables_data__.tsv",
        Filter = {
        },
    },
    campaign_character_arts_tables_data__= {
        FileName = "campaign_character_arts_tables_data__.tsv",
        Filter = {
        },
    },
    variants_tables_data__= {
        FileName = "variants_tables_data__.tsv",
        Filter = {
        },
    },
    agent_uniforms_tables_data__= {
        FileName = "agent_uniforms_tables_data__.tsv",
        Filter = {
        },
    },
    agent_culture_details_tables_data__ = {
        FileName = "agent_culture_details_tables_data__.tsv",
        Filter = {
        },
    },
    portrait_settings__template = {
        FileName = "portrait_settings__template.xml",
        Filter = {
            RootElement = "Entry",
        },
    }
}
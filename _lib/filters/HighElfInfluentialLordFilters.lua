HighElfInfluentialLordFilters = {
    agent_subtypes_tables_a_intrigue_skills_high_elves= {
        Directory = "CustomTSVs/CRP",
        FileName = "agent_subtypes_tables_a_intrigue_skills_high_elves.tsv",
        OutputFile = true,
        Filter = {
            {
                -- Auto generate column
                ColumnNumber = 1,
                Type = "CONTAINSVALUE",
                Value = "wh2_main_hef_prince_mid",
                Operator = "OR",
            },
            {
                -- Auto generate column
                ColumnNumber = 1,
                Type = "CONTAINSVALUE",
                Value = "wh2_main_hef_princess_mid",
                Operator = "OR",
            },
            {
                -- Auto generate column
                ColumnNumber = 1,
                Type = "CONTAINSVALUE",
                Value = "wh2_main_hef_prince_high",
                Operator = "OR",
            },
            {
                -- Auto generate column
                ColumnNumber = 1,
                Type = "CONTAINSVALUE",
                Value = "wh2_main_hef_princess_high",
                Operator = "OR",
            },
        },
    },
    campaign_character_art_sets_tables_a_intrigue_skills_high_elves= {
        Directory = "CustomTSVs/CRP",
        FileName = "campaign_character_art_sets_tables_a_intrigue_skills_high_elves.tsv",
        OutputFile = true,
        Filter = {
        },
    },
    campaign_character_arts_tables_a_intrigue_skills_high_elves= {
        Directory = "CustomTSVs/CRP",
        FileName = "campaign_character_arts_tables_a_intrigue_skills_high_elves.tsv",
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
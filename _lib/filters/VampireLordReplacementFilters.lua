VampireLordReplacementFilters = {
    agent_subtypes_tables_a_vampire_lord_replacement = {
        Directory = "CustomTSVs/CRP",
        FileName = "agent_subtypes_tables_a_vampire_lord_replacement.tsv",
        OutputFile = true,
        Filter = {
            {
                -- Auto generate column
                ColumnNumber = 1,
                Type = "CONTAINSVALUE",
                Value = "vmp_lord_replacement",
                Operator = "OR",
            },
        },
    },
    campaign_character_art_sets_tables_a_vampire_lord_replacement = {
        Directory = "CustomTSVs/CRP",
        FileName = "campaign_character_art_sets_tables_a_vampire_lord_replacement.tsv",
        OutputFile = true,
        Filter = {
        },
    },
    campaign_character_arts_tables_a_vampire_lord_replacement = {
        Directory = "CustomTSVs/CRP",
        FileName = "campaign_character_arts_tables_a_vampire_lord_replacement.tsv",
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
    agent_uniforms_tables_a_vampire_lord_replacement = {
        Directory = "CustomTSVs/CRP",
        FileName = "agent_uniforms_tables_a_vampire_lord_replacement.tsv",
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
    portrait_settings__vampire_lord_replacement = {
        FileName = "portrait_settings__vampire_lord_replacement.xml",
        Directory = "PortraitGenerator",
        OutputFile = true,
        Filter = {
            RootElement = "Entry",
        },
    }
}
WWLSkillTreeFilters = {
    -- Original magic effects
    agent_subtypes_tables_data__ = {
        FileName = {"agent_subtypes_tables_data__.tsv",},
        Directory = "VanillaTSVs",
        OutputFile = false,
        -- Filters work on a per column basis
        -- Each index in the filter object correlates to
        -- a column in a tsv loaded table
        -- Keywords are used to denote what type of filtering should be applied
        Filter = {
            {
                -- Agent sub type Key
                ColumnNumber = 1,
                Type = "CONTAINSVALUEFROMLIST",
                Value = "WWLAgentSubtypesGeneric",
                Operator = "AND",
            },
        },
    },
    -- Character skill trees
    character_skill_node_sets_tables_data__ = {
        FileName = "character_skill_node_sets_tables_data__.tsv",
        Directory = "VanillaTSVs",
        OutputFile = false,
        Filter = {
            {
                -- Agent sub type Key
                ColumnNumber = 8,
                Type = "CONTAINSVALUEFROMLIST",
                Value = "WWLAgentSubtypesGeneric",
                Operator = "AND",
            },
        },
    },
    -- Character skill nodes
    character_skill_nodes_tables_data__ = {
        FileName = "character_skill_nodes_tables_data__.tsv",
        Directory = "VanillaTSVs",
        OutputFile = true,
        OnlyLoadHeader = false,
        Filter = {
        },
    },
    -- Character skills (the link to the generic skills)
    character_skills_tables_data__ = {
        FileName = "character_skills_tables_data__.tsv",
        Directory = "VanillaTSVs",
        OutputFile = false,
        OnlyLoadHeader = false,
        Filter = {
        },
    },
    -- Generic character skill to effects
    character_skill_level_to_effects_junctions_tables_data__ = {
        FileName = "character_skill_level_to_effects_junctions_tables_data__.tsv",
        Directory = "VanillaTSVs",
        OutputFile = false,
        OnlyLoadHeader = false,
        Filter = {
        },
    },
    -- New effect files
    effects_tables_data__ = {
        FileName = "effects_tables_data__.tsv",
        Directory = "VanillaTSVs",
        OutputFile = false,
        OnlyLoadHeader = false,
        Filter = {
        },
    },
    -- New effect bonus values
    effect_bonus_value_unit_ability_junctions_tables_data__ = {
        FileName = "effect_bonus_value_unit_ability_junctions_tables_data__.tsv",
        Directory = "VanillaTSVs",
        OutputFile = false,
        Filter = {
            {
                -- Bonus value
                ColumnNumber = 2,
                Type = "MATCHVALUE",
                Value = "enable",
                Operator = "AND",
            },
        },
    },
    -- Unit abilities (Spells)
    unit_abilities_tables_data__ = {
        FileName = "unit_abilities_tables_data__.tsv",
        Directory = "VanillaTSVs",
        OutputFile = false,
        OnlyLoadHeader = false,
        Filter = {
            {
                -- Source type
                ColumnNumber = 11,
                Type = "MATCHVALUE",
                Value = "spell",
                Operator = "AND",
            },
        },
    },
    -- Character skill links (Positioning)
    character_skill_node_links_tables_data__ = {
        FileName = "character_skill_node_links_tables_data__.tsv",
        Directory = "VanillaTSVs",
        OutputFile = true,
        OnlyLoadHeader = false,
        Filter = {
        },
    },
}
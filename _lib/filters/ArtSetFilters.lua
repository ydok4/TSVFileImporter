ArtSetFilters = {
        agent_subtypes_tables_data__= {
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
        -- Original skill files
        campaign_character_art_sets_tables_data__ = {
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
    -- Output Lua files
    AgentArtSetResources = {
        FileName = "AgentArtSetResources.lua",
        OutputFile = true,
        ExportAsLua = true,
        LuaData = {
            KeyColumn = 8,
            -- Excludes key column because that is always required
            RequiredColumns = {"2"},
            ColumnNames = {
                [2] = "ArtSetIds",
            },
        },
        Filter = {

        },
    },
}
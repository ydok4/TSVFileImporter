MixuArtSetFilters = {
        agent_subtypes_tables_data__= {
            FileName = "agent_subtypes_tables_ab_mixus_hero__.tsv",
            Directory = "MixuTSV",
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
            FileName = "campaign_character_art_sets_tables_ab_mixu_lord_pack__.tsv",
            Directory = "MixuTSV",
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
        FileName = "MixuAgentArtSetResources.lua",
        Directory = "MixuTSV",
        OutputFile = true,
        ExportAsLua = true,
        LuaData = {
            RootName = "MixuAgentArtSetResources",
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
CataphDataFilters = {
        agent_subtypes_tables_data__= {
            FileName = {"agent_subtypes_tables_AK_teb.tsv", "agent_subtypes_tables_AK_kraka.tsv", "agent_subtypes_tables_AK_seahelm.tsv", },
            Directory = "CataphTSVs",
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
            FileName = {"campaign_character_art_sets_tables_!AK_teb_lords.tsv", "campaign_character_art_sets_tables_AK_kraka.tsv", "campaign_character_art_sets_tables_AK_seahelm.tsv", },
            Directory = "CataphTSVs",
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
    AgentDataResources = {
        FileName = "CataphDataResources.lua",
        OutputFile = true,
        ExportAsLua = true,
        LuaData = {
            RootName = "CataphDataResources",
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
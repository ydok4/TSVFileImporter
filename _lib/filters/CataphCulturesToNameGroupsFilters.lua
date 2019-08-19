CataphCulturesToNameGroupsFilters = {
    names_groups_tables = {
        Directory = "CataphTSVs",
        FileName = "names_groups_tables_AK_teb.tsv",
        OutputFile = false,
        Filter = {
            --[[{
                -- Name group key
                ColumnNumber = 1,
                Type = "MATCHVALUE",
                Value = "89",
                Operator = "AND",
            },--]]
        },
    },

    factions_tables = {
        Directory = "CataphTSVs",
        FileName = "factions_tables_AK_teb.tsv",
        OutputFile = false,
        Filter = {
           --[[{
                -- Auto generate column
                ColumnNumber = 3,
                Type = "UNIQUE",
                Value = "3",
                Operator = "OR",
            },--]]
        },
    },

    -- Output Lua files
    NameGroupResources = {
        FileName = "CataphNameGroupResources.lua",
        OutputFile = true,
        ExportAsLua = true,
        LuaData = {
            KeyColumn = 1,
            ColumnNames = {
                {
                    TableColumn = 2,
                    KeyName = "NameGroup",
                    SingleValue = true,
                },
            },
        },
        Filter = {

        },
    },
}
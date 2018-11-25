CulturesToNameGroupsFilters = {
    names_groups_tables = {
        Directory = "VanillaTSVs",
        FileName = "names_groups_tables_data__.tsv",
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
        Directory = "VanillaTSVs",
        FileName = "factions_tables_data__.tsv",
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
        FileName = "NameGroupResources.lua",
        OutputFile = true,
        ExportAsLua = true,
        LuaData = {
            KeyColumn = 1,
            -- Excludes key column because that is always required
            --RequiredColumns = {"6",},
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
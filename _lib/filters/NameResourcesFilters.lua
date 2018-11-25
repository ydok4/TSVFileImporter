NameResourcesFilters = {
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
    name_orders_tables = {
        Directory = "VanillaTSVs",
        FileName = "name_orders_tables_data__.tsv",
        OutputFile = false,
        Filter = {
        },
    },
    names_tables = {
        Directory = "VanillaTSVs",
        FileName = "names_tables_data__.tsv",
        OutputFile = false,
        Filter = {
        },
    },
    --[[factions_tables = {
        Directory = "VanillaTSVs",
        FileName = "factions_tables_data__.tsv",
        OutputFile = false,
        Filter = {
            {
                -- Auto generate column
                ColumnNumber = 3,
                Type = "UNIQUE",
                Value = "3",
                Operator = "OR",
            },
        },
    },--]]

    names__loc = {
        Directory = "VanillaLoc",
        FileName = "names__.loc.tsv",
        OutputFile = false,
        Filter = {
        },
    },

    -- Output Lua files
    --[[NameGroupResources = {
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
    },--]]

    -- Output Lua files
    NameResources = {
        FileName = "NameResources.lua",
        OutputFile = true,
        ExportAsLua = true,
        LuaData = {
            KeyColumn = 6,
            -- Excludes key column because that is always required
            --RequiredColumns = {"6",},
            ColumnNames = {
                {
                    TableColumn = 1,
                    KeyName = "NameGroup",
                    SingleValue = true,
                },
                {
                    TableColumn = 3,
                    KeyName = "Gender",
                    AsTableItem = true,
                    NestedColumns = {
                        {
                            TableColumn = 2,
                            KeyName = "Type",
                            NestedColumns = {
                                {
                                    TableColumn = 4,
                                    KeyName = "COLUMN5",
                                    SingleValue = true,
                                },
                            },
                        },
                    },
                },
            },
        },
        Filter = {

        },
    },
}
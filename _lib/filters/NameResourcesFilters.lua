NameResourcesFilters = {
    names_groups_tables = {
        Directory = "VanillaTSVs",
        FileName = "names_groups_tables_data__.tsv",
        OutputFile = false,
        Filter = {
            --[[{
                -- Name group key
                ColumnNumber = 1,
                Type = "CONTAINSVALUE",
                Value = "98",
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

    names__loc = {
        Directory = "VanillaLoc",
        FileName = "names__.loc.tsv",
        OutputFile = false,
        Filter = {
        },
    },

    -- Output Lua files
    NameResources = {
        FileName = "NameResources.lua",
        OutputFile = true,
        ExportAsLua = true,
        LuaData = {
            KeyColumn = 6,
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
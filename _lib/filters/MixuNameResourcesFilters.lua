MixuNameResourcesFilters = {
    names_groups_tables = {
        Directory = "VanillaTSVs",
        FileName = "names_groups_tables_data__.tsv",
        OutputFile = false,
        Filter = {
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
        Directory = "MixuTSVs",
        FileName = "ab_marienburg_names.loc.tsv",
        OutputFile = false,
        Filter = {
        },
    },

    -- Output Lua files
    NameResources = {
        FileName = "MixuNameResources.lua",
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
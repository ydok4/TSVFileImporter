CataphNameResourcesFilters = {
    names_groups_tables = {
        Directory = "CataphTSVs",
        FileName = "names_groups_tables_AK_teb.tsv",
        OutputFile = false,
        Filter = {
        },
    },
    name_orders_tables = {
        Directory = "CataphTSVs",
        FileName = "name_orders_tables_AK_teb.tsv",
        OutputFile = false,
        Filter = {
        },
    },
    names_tables = {
        Directory = "CataphTSVs",
        FileName = "names_tables_AK_teb.tsv",
        OutputFile = false,
        Filter = {
        },
    },

    names__loc = {
        Directory = "CataphTSVs",
        FileName = {"AK_teb_names.loc.tsv","AK_teb_names_vanilla.loc.tsv", "AK_teb_names221.loc.tsv",},
        OutputFile = false,
        Filter = {
        },
    },

    -- Output Lua files
    NameResources = {
        FileName = "CataphNameResources.lua",
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
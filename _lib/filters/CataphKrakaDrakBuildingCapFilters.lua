CataphKrakaDrakBuildingCapFilters = {
    building_units_allowed_tables_data__ = {
        FileName = {"building_units_allowed_tables_AK_kraka.tsv", "building_units_allowed_tables_data__.tsv",},
        Directory = "CataphTSVs",
        OutputFile = false,
        -- Filters work on a per column basis
        -- Each index in the filter object correlates to
        -- a column in a tsv loaded table
        -- Keywords are used to denote what type of filtering should be applied
        Filter = {
            {
                -- Building Key
                ColumnNumber = 1,
                Type = "DOESNOTCONTAINVALUE",
                Value = "wh2_main_special_settlement_colony",
                Operator = "AND",
            },
            {
                -- Building Key
                ColumnNumber = 1,
                Type = "DOESNOTCONTAINVALUE",
                Value = "wh2_dlc12_special_bordeleaux_manann_shrine",
                Operator = "AND",
            },
        },
    },
    building_levels_tables_data__ = {
        FileName = {"building_levels_tables_AK_kraka.tsv", "building_levels_tables_data__.tsv", },
        Directory = "CataphTSVs",
        OutputFile = false,
        -- Filters work on a per column basis
        -- Each index in the filter object correlates to
        -- a column in a tsv loaded table
        -- Keywords are used to denote what type of filtering should be applied
        Filter = {
        },
    },

    building_chain_availability_sets_tables_data__ = {
        FileName = {"building_chain_availability_sets_tables_AK_kraka.tsv", "building_chain_availability_sets_tables_data__.tsv", },
        Directory = "CataphTSVs",
        OutputFile = false,
        -- Filters work on a per column basis
        -- Each index in the filter object correlates to
        -- a column in a tsv loaded table
        -- Keywords are used to denote what type of filtering should be applied
        Filter = {

        },
    },

    main_units_tables_data__ = {
        FileName = {"main_units_tables_AK_kraka.tsv", "main_units_tables_data__.tsv", },
        Directory = "CataphTSVs",
        OutputFile = false,
        -- Filters work on a per column basis
        -- Each index in the filter object correlates to
        -- a column in a tsv loaded table
        -- Keywords are used to denote what type of filtering should be applied
        Filter = {

        },
    },

    -- Output Lua files

    -- Base 'lua file' which has everything
    -- We need these split by subculture so we don't actually output
    -- this file
    BuildCapPoolData = {
        OutputFile = false,
        ExportAsLua = true,
        LuaData = {
            KeyColumn = 1,
            ColumnNames = {
                {
                    TableColumn = 2,
                    KeyName = "Units",
                    AsTableItem = true,
                    NestedColumns = {
                        {
                            TableColumn = 3,
                            KeyName = "UnitReserveCapChange",
                            SingleValue = true,
                        },
                        {
                            TableColumn = 4,
                            KeyName = "ImmediateUnitReservesChange",
                            SingleValue = true,
                        },
                        {
                            TableColumn = 5,
                            KeyName = "UnitGrowthChange",
                            SingleValue = true,
                        },
                    },
                },
            },
        },
        ChildFiles = {
            CataphKrakaDrakBuildingPoolData = {
                FileName = "CataphKrakaDrakBuildingPoolData.lua",
                Filter = {
                    {
                        -- Building Chain Key
                        -- Ideally we would use the key but for specials this should be the same
                        ColumnNumber = 7,
                        Type = "CONTAINSVALUE",
                        Value = "wh_main_bas_dwf",
                        Operator = "AND",
                    },
                },
            },
        },
    },
}
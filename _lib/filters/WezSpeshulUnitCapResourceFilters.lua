WezSpeshulUnitCapResourceFilters = {
    factions_tables_data__ = {
        FileName = "factions_tables_data__.tsv",
        OutputFile = false,
        -- Filters work on a per column basis
        -- Each index in the filter object correlates to
        -- a column in a tsv loaded table
        -- Keywords are used to denote what type of filtering should be applied
        -- In this case we only want the factions with the sub cultures I support
        Filter = {
            {
                -- Faction Key
                ColumnNumber = 1,
                Type = "DOESNOTCONTAINVALUE",
                Value = "att_fact",
                Operator = "AND",
            },
        },
    },

    units_to_groupings_military_permissions_tables_data__ = {
        FileName = "units_to_groupings_military_permissions_tables_ws_units.tsv",
        Directory = "WezSpeshulTSVs",
        OutputFile = false,
        -- Filters work on a per column basis
        -- Each index in the filter object correlates to
        -- a column in a tsv loaded table
        -- Keywords are used to denote what type of filtering should be applied
        Filter = {
            {
                -- Unit Key
                ColumnNumber = 6,
                Type = "DOESNOTCONTAINVALUE",
                Value = "_cha_",
                Operator = "AND",
            },
            {
                -- Unit Key
                ColumnNumber = 6,
                Type = "DOESNOTCONTAINVALUE",
                Value = "_ror",
                Operator = "AND",
            },
            {
                -- Unit Key
                ColumnNumber = 1,
                Type = "DOESNOTCONTAINVALUE",
                Value = "_blessed",
                Operator = "AND",
            },
            {
                -- Unit Key
                ColumnNumber = 1,
                Type = "DOESNOTCONTAINVALUE",
                Value = "_summoned",
                Operator = "AND",
            },
            {
                -- Unit Key
                ColumnNumber = 1,
                Type = "DOESNOTCONTAINVALUE",
                Value = "_shp_",
                Operator = "AND",
            },
            {
                -- Unit Key
                ColumnNumber = 1,
                Type = "DOESNOTCONTAINVALUE",
                Value = "_qb",
                Operator = "AND",
            },
            {
                -- Unit Key
                ColumnNumber = 1,
                Type = "DOESNOTCONTAINVALUE",
                Value = "_boss",
                Operator = "AND",
            },
        },
    },

    -- Output Lua files

    -- Base 'lua file' which has everything
    -- We need these split by subculture so we don't actually output
    -- this file
    UnitPoolData = {
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
                            KeyName = "StartingReserveCap",
                            SingleValue = true,
                            AsNumber = true,
                        },
                        {
                            TableColumn = 4,
                            KeyName = "StartingReserves",
                            SingleValue = true,
                            AsNumber = true,
                        },
                        {
                            TableColumn = 5,
                            KeyName = "UnitGrowth",
                            SingleValue = true,
                            AsNumber = true,
                        },
                        {
                            TableColumn = 6,
                            KeyName = "RequiredGrowthForReplenishment",
                            SingleValue = true,
                            AsNumber = true,
                        },
                    },
                },
            },
        },
        ChildFiles = {
            WezSpesulGreenskinUnitPoolData = {
                FileName = "WezSpesulGreenskinUnitPoolData.lua",
                Filter = {
                    {
                        -- Military Grouping Key
                        -- Ideally we would use the key but for specials this should be the same
                        ColumnNumber = 7,
                        Type = "CONTAINSVALUE",
                        Value = "wh_main_group_greenskins",
                        Operator = "AND",
                    },
                },
            },
            WezSpesulSavageOrcUnitPoolData = {
                FileName = "WezSpesulSavageOrcUnitPoolData.lua",
                Filter = {
                    {
                        -- Military Grouping Key
                        -- Ideally we would use the key but for specials this should be the same
                        ColumnNumber = 7,
                        Type = "CONTAINSVALUE",
                        Value = "wh_main_group_savage_orcs",
                        Operator = "AND",
                    },
                },
            },
        },
    },
}
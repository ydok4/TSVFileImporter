UnitCapResourceFilters = {
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
        FileName = "units_to_groupings_military_permissions_tables_data__.tsv",
        OutputFile = false,
        -- Filters work on a per column basis
        -- Each index in the filter object correlates to
        -- a column in a tsv loaded table
        -- Keywords are used to denote what type of filtering should be applied
        Filter = {
            {
                -- Unit Key
                ColumnNumber = 1,
                Type = "DOESNOTCONTAINVALUE",
                Value = "_cha_",
                Operator = "AND",
            },
            {
                -- Unit Key
                ColumnNumber = 1,
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
            BeastmenUnitPoolData = {
                FileName = "BeastmenUnitPoolData.lua",
                Filter = {
                    {
                        -- Military Grouping Key
                        -- Ideally we would use the key but for specials this should be the same
                        ColumnNumber = 7,
                        Type = "CONTAINSVALUE",
                        Value = "wh_dlc03_group_beastmen",
                        Operator = "AND",
                    },
                },
            },
            BretonniaUnitPoolData = {
                FileName = "BretonniaUnitPoolData.lua",
                Filter = {
                    {
                        -- Military Grouping Key
                        -- Ideally we would use the key but for specials this should be the same
                        ColumnNumber = 7,
                        Type = "CONTAINSVALUE",
                        Value = "wh_main_group_bretonnia",
                        Operator = "AND",
                    },
                },
            },
            ChaosUnitPoolData = {
                FileName = "ChaosUnitPoolData.lua",
                Filter = {
                    {
                        -- Military Grouping Key
                        -- Ideally we would use the key but for specials this should be the same
                        ColumnNumber = 7,
                        Type = "CONTAINSVALUE",
                        Value = "wh_main_group_chaos",
                        Operator = "AND",
                    },
                },
            },
            DarkElfUnitPoolData = {
                FileName = "DarkElfUnitPoolData.lua",
                Filter = {
                    {
                        -- Military Grouping Key
                        -- Ideally we would use the key but for specials this should be the same
                        ColumnNumber = 7,
                        Type = "CONTAINSVALUE",
                        Value = "wh2_main_def",
                        Operator = "AND",
                    },
                },
            },
            DwarfUnitPoolData = {
                FileName = "DwarfUnitPoolData.lua",
                Filter = {
                    {
                        -- Military Grouping Key
                        -- Ideally we would use the key but for specials this should be the same
                        ColumnNumber = 7,
                        Type = "CONTAINSVALUE",
                        Value = "wh_main_group_dwarfs",
                        Operator = "AND",
                    },
                },
            },
            HighElfUnitPoolData = {
                FileName = "HighElfUnitPoolData.lua",
                Filter = {
                    {
                        -- Military Grouping Key
                        -- Ideally we would use the key but for specials this should be the same
                        ColumnNumber = 7,
                        Type = "CONTAINSVALUE",
                        Value = "wh2_main_hef",
                        Operator = "AND",
                    },
                },
            },
            EmpireUnitPoolData = {
                FileName = "EmpireUnitPoolData.lua",
                Filter = {
                    {
                        -- Military Grouping Key
                        -- Ideally we would use the key but for specials this should be the same
                        ColumnNumber = 7,
                        Type = "CONTAINSVALUE",
                        Value = "wh_main_group_empire",
                        Operator = "AND",
                    },
                },
            },
            GreenskinUnitPoolData = {
                FileName = "GreenskinUnitPoolData.lua",
                Filter = {
                    {
                        -- Military Grouping Key
                        -- Ideally we would use the key but for specials this should be the same
                        ColumnNumber = 7,
                        Type = "CONTAINSVALUE",
                        Value = "wh_main_group_greenskins",
                        Operator = "OR",
                    },
                },
            },
            KislevUnitPoolData = {
                FileName = "KislevUnitPoolData.lua",
                Filter = {
                    {
                        -- Military Grouping Key
                        -- Ideally we would use the key but for specials this should be the same
                        ColumnNumber = 7,
                        Type = "CONTAINSVALUE",
                        Value = "wh_main_group_kislev",
                        Operator = "AND",
                    },
                },
            },
            LizardmenUnitPoolData = {
                FileName = "LizardmenUnitPoolData.lua",
                Filter = {
                    {
                        -- Military Grouping Key
                        -- Ideally we would use the key but for specials this should be the same
                        ColumnNumber = 7,
                        Type = "CONTAINSVALUE",
                        Value = "wh2_main_lzd",
                        Operator = "AND",
                    },
                },
            },
            NorscaUnitPoolData = {
                FileName = "NorscaUnitPoolData.lua",
                Filter = {
                    {
                        -- Military Grouping Key
                        -- Ideally we would use the key but for specials this should be the same
                        ColumnNumber = 7,
                        Type = "CONTAINSVALUE",
                        Value = "wh_main_group_norsca",
                        Operator = "AND",
                    },
                },
            },
            RogueArmyUnitPoolData = {
                FileName = "RogueArmyUnitPoolData.lua",
                Filter = {
                    {
                        -- Military Grouping Key
                        -- Ideally we would use the key but for specials this should be the same
                        ColumnNumber = 7,
                        Type = "CONTAINSVALUE",
                        Value = "_rogue_",
                        Operator = "AND",
                    },
                },
            },
            SavageOrcUnitPoolData = {
                FileName = "SavageOrcUnitPoolData.lua",
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
            SkavenUnitPoolData = {
                FileName = "SkavenUnitgPoolData.lua",
                Filter = {
                    {
                        -- Military Grouping Key
                        -- Ideally we would use the key but for specials this should be the same
                        ColumnNumber = 7,
                        Type = "CONTAINSVALUE",
                        Value = "wh2_main_skv",
                        Operator = "AND",
                    },
                },
            },
            TEBUnitPoolData = {
                FileName = "TEBUnitPoolData.lua",
                Filter = {
                    {
                        -- Military Grouping Key
                        -- Ideally we would use the key but for specials this should be the same
                        ColumnNumber = 7,
                        Type = "CONTAINSVALUE",
                        Value = "wh_main_group_teb",
                        Operator = "AND",
                    },
                },
            },
            TombKingsUnitPoolData = {
                FileName = "TombKingsUnitPoolData.lua",
                Filter = {
                    {
                        -- Military Grouping Key
                        -- Ideally we would use the key but for specials this should be the same
                        ColumnNumber = 7,
                        Type = "CONTAINSVALUE",
                        Value = "wh2_dlc09_tomb_kings",
                        Operator = "AND",
                    },
                },
            },
            VampireCoastUnitPoolData = {
                FileName = "VampireCoastUnitPoolData.lua",
                Filter = {
                    {
                        -- Military Grouping Key
                        -- Ideally we would use the key but for specials this should be the same
                        ColumnNumber = 7,
                        Type = "CONTAINSVALUE",
                        Value = "wh2_dlc11_group_vampire_coast",
                        Operator = "AND",
                    },
                },
            },
            VampireCountsUnitPoolData = {
                FileName = "VampireCountsUnitPoolData.lua",
                Filter = {
                    {
                        -- Military Grouping Key
                        -- Ideally we would use the key but for specials this should be the same
                        ColumnNumber = 7,
                        Type = "CONTAINSVALUE",
                        Value = "wh_main_group_vampire_counts",
                        Operator = "AND",
                    },
                },
            },
            WoodElfUnitPoolData = {
                FileName = "WoodElfUnitPoolData.lua",
                Filter = {
                    {
                        -- Military Grouping Key
                        -- Ideally we would use the key but for specials this should be the same
                        ColumnNumber = 7,
                        Type = "CONTAINSVALUE",
                        Value = "wh_dlc05_group_wood_elves",
                        Operator = "AND",
                    },
                },
            },
        },
    },
}
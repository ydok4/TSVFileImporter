UnitCapBuildingFilters = {
    building_units_allowed_tables_data__ = {
        FileName = "building_units_allowed_tables_data__.tsv",
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
        FileName = "building_levels_tables_data__.tsv",
        OutputFile = false,
        -- Filters work on a per column basis
        -- Each index in the filter object correlates to
        -- a column in a tsv loaded table
        -- Keywords are used to denote what type of filtering should be applied
        Filter = {
        },
    },

    building_chain_availability_sets_tables_data__ = {
        FileName = "building_chain_availability_sets_tables_data__.tsv",
        OutputFile = false,
        -- Filters work on a per column basis
        -- Each index in the filter object correlates to
        -- a column in a tsv loaded table
        -- Keywords are used to denote what type of filtering should be applied
        Filter = {

        },
    },

    main_units_tables_data__ = {
        FileName = "main_units_tables_data__.tsv",
        OutputFile = false,
        -- Filters work on a per column basis
        -- Each index in the filter object correlates to
        -- a column in a tsv loaded table
        -- Keywords are used to denote what type of filtering should be applied
        Filter = {
            {
                -- Unit Key
                ColumnNumber = 18,
                Type = "DOESNOTCONTAINVALUE",
                Value = "_cha_",
                Operator = "AND",
            },
            {
                -- Unit Key
                ColumnNumber = 18,
                Type = "DOESNOTCONTAINVALUE",
                Value = "_ror",
                Operator = "AND",
            },
            {
                -- Unit Key
                ColumnNumber = 18,
                Type = "DOESNOTCONTAINVALUE",
                Value = "_blessed",
                Operator = "AND",
            },
            {
                -- Unit Key
                ColumnNumber = 18,
                Type = "DOESNOTCONTAINVALUE",
                Value = "_summoned",
                Operator = "AND",
            },
            {
                -- Unit Key
                ColumnNumber = 18,
                Type = "DOESNOTCONTAINVALUE",
                Value = "_shp_",
                Operator = "AND",
            },
            {
                -- Unit Key
                ColumnNumber = 18,
                Type = "DOESNOTCONTAINVALUE",
                Value = "_qb",
                Operator = "AND",
            },
            {
                -- Unit Key
                ColumnNumber = 18,
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
                            KeyName = "UnitCapChange",
                            SingleValue = true,
                        },
                        {
                            TableColumn = 4,
                            KeyName = "ImmediateUnitAmountChange",
                            SingleValue = true,
                        },
                        {
                            TableColumn = 5,
                            KeyName = "UnitGrowthChange",
                            SingleValue = true,
                        },
                        {
                            TableColumn = 6,
                            KeyName = "OverrideUnitCap",
                            SingleValue = true,
                        },
                    },
                },
            },
        },
        ChildFiles = {
            BeastmenBuildingPoolData = {
                FileName = "BeastmenBuildingPoolData.lua",
                Filter = {
                    {
                        -- Building Chain Key
                        -- Ideally we would use the key but for specials this should be the same
                        ColumnNumber = 7,
                        Type = "CONTAINSVALUE",
                        Value = "wh_dlc03_bas_bst",
                        Operator = "AND",
                    },
                },
            },
            BretonniaBuildingPoolData = {
                FileName = "BretonniaBuildingPoolData.lua",
                Filter = {
                    {
                        -- Building Chain Key
                        -- Ideally we would use the key but for specials this should be the same
                        ColumnNumber = 7,
                        Type = "CONTAINSVALUE",
                        Value = "wh_main_bas_brt",
                        Operator = "AND",
                    },
                },
            },
            ChaosBuildingPoolData = {
                FileName = "ChaosBuildingPoolData.lua",
                Filter = {
                    {
                        -- Building Chain Key
                        -- Ideally we would use the key but for specials this should be the same
                        ColumnNumber = 7,
                        Type = "CONTAINSVALUE",
                        Value = "wh_main_bas_chs",
                        Operator = "AND",
                    },
                },
            },
            DarkElfBuildingPoolData = {
                FileName = "DarkElfBuildingPoolData.lua",
                Filter = {
                    {
                        -- Building Chain Key
                        -- Ideally we would use the key but for specials this should be the same
                        ColumnNumber = 7,
                        Type = "CONTAINSVALUE",
                        Value = "wh2_main_bas_def",
                        Operator = "AND",
                    },
                },
            },
            DwarfBuildingPoolData = {
                FileName = "DwarfBuildingPoolData.lua",
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
            HighElfBuildingPoolData = {
                FileName = "HighElfBuildingPoolData.lua",
                Filter = {
                    {
                        -- Building Chain Key
                        -- Ideally we would use the key but for specials this should be the same
                        ColumnNumber = 7,
                        Type = "CONTAINSVALUE",
                        Value = "wh2_main_bas_hef",
                        Operator = "AND",
                    },
                },
            },
            EmpireBuildingPoolData = {
                FileName = "EmpireBuildingPoolData.lua",
                Filter = {
                    {
                        -- Building Chain Key
                        -- Ideally we would use the key but for specials this should be the same
                        ColumnNumber = 7,
                        Type = "CONTAINSVALUE",
                        Value = "wh_main_bas_emp",
                        Operator = "AND",
                    },
                },
            },
            GreenskinBuildingPoolData = {
                FileName = "GreenskinBuildingPoolData.lua",
                Filter = {
                    {
                        -- Building Chain Key
                        -- Ideally we would use the key but for specials this should be the same
                        ColumnNumber = 7,
                        Type = "CONTAINSVALUE",
                        Value = "wh_main_bas_gob",
                        Operator = "OR",
                    },
                    {
                        -- Building Chain Key
                        -- Ideally we would use the key but for specials this should be the same
                        ColumnNumber = 7,
                        Type = "CONTAINSVALUE",
                        Value = "wh_main_bas_grn",
                        Operator = "OR",
                    },
                    {
                        -- Building Chain Key
                        -- Ideally we would use the key but for specials this should be the same
                        ColumnNumber = 7,
                        Type = "CONTAINSVALUE",
                        Value = "wh_main_bas_orc",
                        Operator = "OR",
                    },
                },
            },
            KislevBuildingPoolData = {
                FileName = "KislevBuildingPoolData.lua",
                Filter = {
                    {
                        -- Building Chain Key
                        -- Ideally we would use the key but for specials this should be the same
                        ColumnNumber = 7,
                        Type = "CONTAINSVALUE",
                        Value = "wh_main_bas_ksl",
                        Operator = "AND",
                    },
                },
            },
            LizardmenBuildingPoolData = {
                FileName = "LizardmenBuildingPoolData.lua",
                Filter = {
                    {
                        -- Building Chain Key
                        -- Ideally we would use the key but for specials this should be the same
                        ColumnNumber = 7,
                        Type = "CONTAINSVALUE",
                        Value = "wh2_main_bas_lzd",
                        Operator = "AND",
                    },
                },
            },
            NorscaBuildingPoolData = {
                FileName = "NorscaBuildingPoolData.lua",
                Filter = {
                    {
                        -- Building Chain Key
                        -- Ideally we would use the key but for specials this should be the same
                        ColumnNumber = 7,
                        Type = "CONTAINSVALUE",
                        Value = "wh_main_bas_nor",
                        Operator = "AND",
                    },
                },
            },
            RogueArmyBuildingPoolData = {
                FileName = "RogueArmyBuildingPoolData.lua",
                Filter = {
                    {
                        -- Building Chain Key
                        -- Ideally we would use the key but for specials this should be the same
                        ColumnNumber = 7,
                        Type = "CONTAINSVALUE",
                        Value = "wh2_main_bas_rogue",
                        Operator = "AND",
                    },
                },
            },
            SavageOrcBuildingPoolData = {
                FileName = "SavageOrcBuildingPoolData.lua",
                Filter = {
                    {
                        -- Building Chain Key
                        -- Ideally we would use the key but for specials this should be the same
                        ColumnNumber = 7,
                        Type = "CONTAINSVALUE",
                        Value = "wh_main_bas_savorc",
                        Operator = "AND",
                    },
                },
            },
            SkavenBuildingPoolData = {
                FileName = "SkavenBuildingPoolData.lua",
                Filter = {
                    {
                        -- Building Chain Key
                        -- Ideally we would use the key but for specials this should be the same
                        ColumnNumber = 7,
                        Type = "CONTAINSVALUE",
                        Value = "wh2_main_bas_skv",
                        Operator = "AND",
                    },
                },
            },
            TEBBuildingPoolData = {
                FileName = "TEBBuildingPoolData.lua",
                Filter = {
                    {
                        -- Building Chain Key
                        -- Ideally we would use the key but for specials this should be the same
                        ColumnNumber = 7,
                        Type = "CONTAINSVALUE",
                        Value = "wh_main_bas_teb",
                        Operator = "AND",
                    },
                },
            },
            TombKingsBuildingPoolData = {
                FileName = "TombKingsBuildingPoolData.lua",
                Filter = {
                    {
                        -- Building Chain Key
                        -- Ideally we would use the key but for specials this should be the same
                        ColumnNumber = 7,
                        Type = "CONTAINSVALUE",
                        Value = "wh2_dlc09_bas_tmb",
                        Operator = "AND",
                    },
                },
            },
            VampireCoastBuildingPoolData = {
                FileName = "VampireCoastBuildingPoolData.lua",
                Filter = {
                    {
                        -- Building Chain Key
                        -- Ideally we would use the key but for specials this should be the same
                        ColumnNumber = 7,
                        Type = "CONTAINSVALUE",
                        Value = "wh_dlc11_bas_cst",
                        Operator = "AND",
                    },
                },
            },
            VampireCountsBuildingPoolData = {
                FileName = "VampireCountsBuildingPoolData.lua",
                Filter = {
                    {
                        -- Building Chain Key
                        -- Ideally we would use the key but for specials this should be the same
                        ColumnNumber = 7,
                        Type = "CONTAINSVALUE",
                        Value = "wh_main_bas_vmp",
                        Operator = "AND",
                    },
                },
            },
            WoodElfBuildingPoolData = {
                FileName = "WoodElfBuildingPoolData.lua",
                Filter = {
                    {
                        -- Building Chain Key
                        -- Ideally we would use the key but for specials this should be the same
                        ColumnNumber = 7,
                        Type = "CONTAINSVALUE",
                        Value = "wh_dlc05_bas_wef",
                        Operator = "AND",
                    },
                },
            },
        },
    },
}
UnitCapEffectFilters = {
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
    building_units_allowed_tables_data__ = {
        FileName = "building_units_allowed_tables_data__.tsv",
        OutputFile = false,
        -- Filters work on a per column basis
        -- Each index in the filter object correlates to
        -- a column in a tsv loaded table
        -- Keywords are used to denote what type of filtering should be applied
        Filter = {
        },
    },

    -- Output Lua files
    EmpireBuildingPoolData = {
        FileName = "EmpireBuildingPoolData.lua",
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
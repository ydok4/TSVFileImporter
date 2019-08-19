CataphKrakaDrakUnitCapEffectFilters = {
    main_units_tables_data__ = {
        FileName = "main_units_tables_AK_kraka.tsv",
        Directory = "CataphTSVs",
        OutputFile = true,
        -- Filters work on a per column basis
        -- Each index in the filter object correlates to
        -- a column in a tsv loaded table
        -- Keywords are used to denote what type of filtering should be applied
        Filter = {
            {
                -- Unit Key
                ColumnNumber = 6,
                Type = "DOESNOTCONTAINVALUE",
                Value = "_orgi",
                Operator = "AND",
            },
            {
                -- Unit Key
                ColumnNumber = 6,
                Type = "DOESNOTCONTAINVALUE",
                Value = "_wardlord",
                Operator = "AND",
            },
            {
                -- Unit Key
                ColumnNumber = 6,
                Type = "DOESNOTCONTAINVALUE",
                Value = "kraka_losturk",
                Operator = "AND",
            },
            {
                -- Unit Key
                ColumnNumber = 6,
                Type = "DOESNOTCONTAINVALUE",
                Value = "kraka_nor_truesons",
                Operator = "AND",
            },
            {
                -- Unit Key
                ColumnNumber = 6,
                Type = "DOESNOTCONTAINVALUE",
                Value = "kraka_forsaken",
                Operator = "AND",
            },
            {
                -- Unit Key
                ColumnNumber = 6,
                Type = "DOESNOTCONTAINVALUE",
                Value = "kraka_stoneguard",
                Operator = "AND",
            },
            {
                -- Unit Key
                ColumnNumber = 6,
                Type = "DOESNOTCONTAINVALUE",
                Value = "kraka_nor_carrions",
                Operator = "AND",
            },
            {
                -- Unit Key
                ColumnNumber = 6,
                Type = "DOESNOTCONTAINVALUE",
                Value = "kraka_crimsonbane",
                Operator = "AND",
            },
            {
                -- Unit Key
                ColumnNumber = 6,
                Type = "DOESNOTCONTAINVALUE",
                Value = "kraka_drakeguard",
                Operator = "AND",
            },
            {
                -- Unit Key
                ColumnNumber = 6,
                Type = "DOESNOTCONTAINVALUE",
                Value = "kraka_thunderbows",
                Operator = "AND",
            },
            {
                -- Unit Key
                ColumnNumber = 6,
                Type = "DOESNOTCONTAINVALUE",
                Value = "kraka_wrath",
                Operator = "AND",
            },
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
    unit_sets_tables_data__ = {
        FileName = "unit_sets_tables_AK_kraka.tsv",
        Directory = "CataphTSVs",
        -- Filters work on a per column basis
        -- Each index in the filter object correlates to
        -- a column in a tsv loaded table
        -- Keywords are used to denote what type of filtering should be applied
        OutputFile = true,
        OnlyLoadHeader = true,
        Filter = {
        },
    },
    unit_set_to_unit_junctions_tables_data__ = {
        FileName = "unit_set_to_unit_junctions_tables_AK_kraka.tsv",
        Directory = "CataphTSVs",
        -- Filters work on a per column basis
        -- Each index in the filter object correlates to
        -- a column in a tsv loaded table
        -- Keywords are used to denote what type of filtering should be applied
        OutputFile = true,
        OnlyLoadHeader = true,
        Filter = {
        },
    },
    effect_bonus_value_ids_unit_sets_tables_data__ = {
        FileName = "effect_bonus_value_ids_unit_sets_tables_AK_kraka.tsv",
        Directory = "CataphTSVs",
        -- Filters work on a per column basis
        -- Each index in the filter object correlates to
        -- a column in a tsv loaded table
        -- Keywords are used to denote what type of filtering should be applied
        OutputFile = true,
        OnlyLoadHeader = true,
        Filter = {
        },
    },
    effects_tables_data__ = {
        FileName = "effects_tables_data__.tsv",
        -- Filters work on a per column basis
        -- Each index in the filter object correlates to
        -- a column in a tsv loaded table
        -- Keywords are used to denote what type of filtering should be applied
        OutputFile = true,
        OnlyLoadHeader = true,
        Filter = {
        },
    },
    effect_bundles_tables_data__ = {
        FileName = "effect_bundles_tables_data__.tsv",
        -- Filters work on a per column basis
        -- Each index in the filter object correlates to
        -- a column in a tsv loaded table
        -- Keywords are used to denote what type of filtering should be applied
        OutputFile = true,
        OnlyLoadHeader = true,
        Filter = {
        },
    },
    effect_bundles_to_effects_junctions_tables_data__ = {
        FileName = "effect_bundles_to_effects_junctions_tables_data__.tsv",
        -- Filters work on a per column basis
        -- Each index in the filter object correlates to
        -- a column in a tsv loaded table
        -- Keywords are used to denote what type of filtering should be applied
        OutputFile = true,
        OnlyLoadHeader = true,
        Filter = {
        },
    },
}
RebelLeadersTransforms = {
    -- Each record can have transform operations applied
    -- Each table below is a transform operation
    -- For each record the condition will be checked and then
    -- the transform applied
    -- Empire Rebel Transform
    faction_agent_permitted_subtypes_tables_data__ = {
        Step1 = {
        -- The name of the file this transform operation is to be applied to
        FileName = "faction_agent_permitted_subtypes_tables_data__",
        -- In an operation if the condition is met,
        -- Then the transforms are applied
        Filters = {

        },
        -- Transforms determine how data should be changed
        Transforms = {
            {
                Type = "NEWROW",
                Columns = {
                    {
                        -- Subtype column
                        ColumnNumber = 3,
                        Type = "APPEND",
                        Value = "_rebel",
                    },
                },
            },
        },
        -- This value is used if a column has unsepecified transforms
        DefaultColumnTransformBehaviour = "SELECTEXISTING",
        NextTransformOperation = "Step2",
    },
    Step2 = {
        -- The name of the file this transform operation is to be applied to
        FileName = "agent_subtypes_tables_data__",
        -- In an operation if the condition is met,
        -- Then the transforms are applied
        Filters = {
            -- Agent Sub Type Column
            {
                ColumnNumber = 1,
                Type = "MATCHINGORIGINALPREVIOUSSTEP",
                -- Index of column from previous step
                Value = "3",
                Operator = "AND",
            },
        },
        PostTransformFilters = {
            {
                ColumnNumber = 1,
                Type = "TRANSFORMUNIQUE",
                -- Index of column from previous step
                Value = "",
                Operator = "AND",
            },
        },
        -- Transforms determine how data should be changed
        Transforms = {
                {
                    Type = "NEWROW",
                    Columns = {
                        {
                            -- Agent sub type Key column
                            ColumnNumber = 1,
                            Type = "APPEND",
                            -- Index of column from previous step
                            Value = "_rebel",
                        },
                    },
                },
            },
            -- This value is used if a column has unsepecified transforms
            DefaultColumnTransformBehaviour = "SELECTEXISTING",
            NextTransformOperation = "Step3",
        },
    Step3 = {
        -- The name of the file this transform operation is to be applied to
        FileName = "campaign_character_art_sets_tables_data__",
        -- In an operation if the condition is met,
        -- Then the transforms are applied
        Filters = {
            -- Agent Sub Type Column
            {
                ColumnNumber = 8,
                Type = "MATCHINGORIGINALPREVIOUSSTEP",
                -- Index of column from previous step
                Value = "1",
                Operator = "AND",
            },
        },
        PostTransformFilters = {
            {
                ColumnNumber = 2,
                Type = "TRANSFORMUNIQUE",
                -- Index of column from previous step
                Value = "",
                Operator = "AND",
            },
        },
        -- Transforms determine how data should be changed
        Transforms = {
                {
                    Type = "NEWROW",
                    Columns = {
                        {
                            -- Art set Id column
                            ColumnNumber = 2,
                            Type = "APPEND",
                            -- Index of column from previous step
                            Value = "_rebel",
                        },
                        {
                            -- Agent sub type column
                            ColumnNumber = 8,
                            Type = "REPLACEWITHPREVIOUSSTEP",
                            -- Index of column from previous step
                            Value = "1",
                        },
                    },
                },
            },
            -- This value is used if a column has unsepecified transforms
            DefaultColumnTransformBehaviour = "SELECTEXISTING",
            NextTransformOperation = "Step4",
        },
        Step4 = {
            -- The name of the file this transform operation is to be applied to
            FileName = "campaign_character_arts_tables_data__",
            -- In an operation if the condition is met,
            -- Then the transforms are applied
            Filters = {
                -- Agent Sub Type Column
                {
                    ColumnNumber = 1,
                    Type = "MATCHINGORIGINALPREVIOUSSTEP",
                    -- Index of column from previous step
                    Value = "2",
                    Operator = "AND",
                },
            },
            -- Transforms determine how data should be changed
            Transforms = {
                {
                    Type = "NEWROW",
                    Columns = {
                        {
                            -- Art set Id column
                            ColumnNumber = 1,
                            Type = "REPLACEWITHPREVIOUSSTEP",
                            -- Index of column from previous step
                            Value = "2",
                        },
                        {
                            -- Agent sub type column
                            ColumnNumber = 14,
                            Type = "NUMERICID",
                            -- Index of column from previous step
                            Value = "23190",
                        },
                    },
                },
            },
            -- This value is used if a column has unsepecified transforms
            DefaultColumnTransformBehaviour = "SELECTEXISTING",
        },
    }
}
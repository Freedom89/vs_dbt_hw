WITH mytable AS (
    SELECT
        *
    FROM
        {# you can use ref or source here as well #}
        my_data_source
) {{ my_first_macro(
    table = 'mytable',
    int_input = 10.4,
    enum_input = "apple",
    default_input = 10,
) }},
SELECT
    *
FROM
    output_mytable

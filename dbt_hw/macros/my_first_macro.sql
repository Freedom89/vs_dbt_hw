{% macro my_first_macro(
        table,
        int_input,
        enum_input,
        default_input = none,
        call_system_var = var('end_date')
    ) %}
    {{ call_system_var }}
    {{ int_input | int }}
    {# note, jinja templating int takes in float #}
    {#to check if it is int, should return True#}
    {{ int_input | int > 0 }}
    {{ enum_input | int }}
    {#to check if it is int, should return False#}
    {{ enum_input | int > 0 }}

    {%- if int_input is not none -%}
        {%- if int_input | int == 0 -%}
            {{ exceptions.raise_compiler_error("must_be_int must be an int greater than 0") }}
        {%- endif -%}
    {%- endif -%}

    {# you can assign new variables as well #}
    {% set int_parsed = int_input | int %}
    {{ int_parsed }}

    {%- if not enum_input in (
            "apple",
            "orrange",
        ) -%}
        {{ exceptions.raise_compiler_error("enum_input must be apple or orange") }}
    {%- endif %}

    {% set output_table = 'output_' + table %}
    output_table AS (
        SELECT
            *
        FROM
            {{ table }}
        WHERE
            VALUE = {{ int_parsed }}
            AND category = {{ enum_input }}
            AND partition_date > {{ call_system_var }}

            {%- if default_input is not none -%}
                AND VALUE > default_input
            {%- endif -%}
    )
{% endmacro %}

{# Set a variable #}
{%- set this_is_a_variable = 'some value' -%}
{%- set this_is_a_list = ['hello','there'] -%}
{%- set this_is_a_dict ={ 'key1' :'value1',
'key2' :'value2' } -%}
{%- set dict_of_arrays ={ 'key1': ['value11','value12'],
'key2' :['value21','value22'] } -%}
{{ this_is_a_variable }}
{{ this_is_a_list }}
{# you can loop through the list #}
{%- for item in this_is_a_list -%}
    {{ item }}
{%- endfor -%}

{# notice i did not put the - sign infront, this is for breaklines #}
{% for k,
    v in this_is_a_dict.items() %}
    "This is the key {{ k }}, this is the value {{ v }}"
{%- endfor -%}

{% for k,
    v in dict_of_arrays.items() %}
    "This is the key {{ k }}, first element {{ v[0] }}, second element {{v[1]}}"
{%- endfor -%}

{# you can also convert numbers to types #}
{{ 123.0 | int }}
{# or upper case #}
{{ "abc" | upper }}
{# or lower case #}
{{ "ABC" | lower }}
{# you can also use if else #}
{%- set x = 1 -%}
{# because x is inside the jinja templating, no {{}} is required #}
{%- if x == 1 -%}
    "x is indeed 1"
{%- else -%}
    "x is not one"
{% endif %}

{%- set y = 2 -%}
{# because x is inside the jinja templating, no {{}} is required #}
{% if y == 1 %}
    "y is indeed 1"
{%- else -%}
    "y is not one"
{% endif %}

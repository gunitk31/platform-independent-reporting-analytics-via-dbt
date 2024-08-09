{% macro cast_str_to_timestamp(column_name) -%}
    {{ return(adapter.dispatch('cast_str_to_timestamp')(column_name)) }}
{%- endmacro %}

{% macro default__cast_str_to_timestamp(column_name) -%}
    {{ column_name }}
{%- endmacro %}

{% macro athena__cast_str_to_timestamp(column_name) -%}
    date_parse({{ column_name }}, '%Y-%m-%dT%H:%i:%sZ')
{%- endmacro %}
{% macro cast_str_to_date(column_name) -%}
    {{ return(adapter.dispatch('cast_str_to_date')(column_name)) }}
{%- endmacro %}

{% macro default__cast_str_to_date(column_name) -%}
    TO_DATE({{ column_name }})
{%- endmacro %}

{% macro athena__cast_str_to_date(column_name) -%}
    date_parse({{ column_name }}, '%Y-%m-%d')
{%- endmacro %}
{% macro assign_default_to_null(column_name, default_value) -%}
    {{ return(adapter.dispatch('assign_default_to_null')(column_name, default_value)) }}
{%- endmacro %}

{% macro default__assign_default_to_null(column_name, default_value) -%}
    (CASE WHEN {{ column_name }} IS NULL THEN '{{ default_value }}' ELSE {{ column_name }} END) AS {{ column_name }}
{%- endmacro %}

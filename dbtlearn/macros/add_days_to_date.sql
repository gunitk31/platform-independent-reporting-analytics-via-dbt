{% macro add_days_to_date(column_name, days_to_add) -%}
    {{ return(adapter.dispatch('add_days_to_date')(column_name, days_to_add)) }}
{%- endmacro %}

{% macro default__add_days_to_date(column_name, days_to_add) -%}
    DATEADD(DAY, {{ days_to_add }}, {{ column_name }})
{%- endmacro %}

{% macro athena__add_days_to_date(column_name, days_to_add) -%}
    date_add('day', {{ days_to_add }}, {{ column_name }})
{%- endmacro %}
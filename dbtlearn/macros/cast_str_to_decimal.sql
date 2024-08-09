{% macro cast_str_to_decimal(column_name, precision_digit_1, precision_digit_2) -%}
    {{ return(adapter.dispatch('cast_str_to_decimal')(column_name, precision_digit_1, precision_digit_2)) }}
{%- endmacro %}

{% macro default__cast_str_to_decimal(column_name, precision_digit_1, precision_digit_2) -%}
    CAST({{ column_name }} AS NUMBER({{ precision_digit_1 }}, {{ precision_digit_2 }}))
{%- endmacro %}

{% macro athena__cast_str_to_decimal(column_name, precision_digit_1, precision_digit_2) -%}
    CAST({{ column_name }} AS DECIMAL({{ precision_digit_1 }}, {{ precision_digit_2 }}))
{%- endmacro %}
{% macro learn_variables() %}

    {% set my_name_jinja = 'Gunit' %}
    {{ log('Hello ' ~ my_name_jinja, info = True) }}

    {{ log('Hello dbt user ' ~ var('user_name', 'NO USERNAME RECEIVED') ~ '!', info = True) }}

{% endmacro %}
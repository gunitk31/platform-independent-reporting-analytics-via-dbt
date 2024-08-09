{% macro learn_logging() %}
    {{ log("Hello World! Welcome to your log file!", info=True) }}
{% endmacro %}
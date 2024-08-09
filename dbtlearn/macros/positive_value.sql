{% test positive_value(model, column_name) %}
SELECT 
    * 
FROM
    {{ model }}
WHERE 
    CAST({{ column_name }} AS INT) < 1
{% endtest %}

{{
  config(
    materialized = 'incremental',
    on_schema_change = 'fail'
  )
}}

WITH src_reviews AS (
    SELECT * FROM {{ref("src_reviews")}}
)
SELECT
    *
FROM
    src_reviews
WHERE 
    review_text IS NOT NULL

{% if is_incremental() %}
  {% if var('start_date', False) or var('end_date', False) %}
    {{ log('Loading ' ~ this ~ ' incrementally (start_date: ' ~ var('start_date') ~ ', end_date: ' ~ var('start_date'), info = True) }}
    and review_date >= '{{ var("start_date") }}'
    and review_date < '{{ var("end_date") }}'
  {% else %}  
    {{ log('Loading ' ~ this ~ ' incrementally (all missing dates)', info = True) }}
    and review_date > (select max(review_date) from {{ this }})
  {% endif %}
{% endif %} 
{{
  config(
    materialized = 'table'
  )
}}

WITH 
fct_reviews AS (
    SELECT * FROM {{ref("fct_reviews")}}
),
full_moon_dates AS (
    SELECT * from {{ref("seed_full_moon_dates")}}
)

SELECT
  r.*,
  CASE
    WHEN fm.full_moon_date IS NULL THEN 'not full moon'
    ELSE 'full moon'
  END AS is_full_moon
FROM
  fct_reviews r
LEFT JOIN 
  full_moon_dates fm
ON 
  ({{ cast_str_to_date('substr(r.review_date,1,10)') }} = {{ add_days_to_date('fm.full_moon_date', '1') }})
  --(TO_DATE(r.review_date) = DATEADD(DAY, 1, fm.full_moon_date))
{{
  config(
    materialized = 'view'
  )
}}

WITH src_listings AS (
    SELECT * FROM {{ref("src_listings")}}
)

SELECT
    listing_id,
    listing_name,
    room_type,
    CASE
        WHEN CAST(minimum_nights AS INT) = 0 THEN 1
        ELSE CAST(minimum_nights AS INT)
    END AS minimum_nights,
    host_id,
    {{ cast_str_to_decimal(dbt.replace('price_str', "'$'", "''"),10,2) }} AS price,
    --REPLACE(price_str,'$') :: NUMBER(10,2) AS price,
    created_at,
    updated_at
FROM
    src_listings
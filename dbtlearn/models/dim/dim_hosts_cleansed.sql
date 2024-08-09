{{
  config(
    materialized = 'view'
  )
}}

WITH src_hosts AS (
    SELECT * FROM {{ref("src_hosts")}}
)
SELECT
    host_id,
    {{ assign_default_to_null('host_name', 'Anonymous') }},
    is_superhost,
    created_at,
    updated_at
FROM
    src_hosts
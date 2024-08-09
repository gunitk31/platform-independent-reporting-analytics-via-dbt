SELECT 
    * 
FROM 
    {{ ref('dim_listings_cleansed') }} l
WHERE minimum_nights < 1
LIMIT 10
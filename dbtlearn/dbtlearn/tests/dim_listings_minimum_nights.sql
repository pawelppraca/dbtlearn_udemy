{{
    config(
    store_failures =  true
    )
}}


WITH dim_listings AS (
    SELECT * FROM {{ ref("dim_listings_cleaned")}}
)



SELECT 
    *
FROM dim_listings
WHERE minimum_nights < 10
LIMIT 10
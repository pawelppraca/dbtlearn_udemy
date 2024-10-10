Select * FROM {{ ref('fct_reviews') }} r
JOIN {{ ref('dim_listings_cleaned') }} lis 
    ON lis.listing_id = r.listing_id
    WHERE r.review_date < lis.created_at
LIMIT 10
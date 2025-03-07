
WITH src_hosts AS (
    SELECT * FROM {{ ref("src_hosts")}}
)

SELECT 
    'recon' AS target_model,
    host_id, 
    CASE 
        WHEN host_name is NULL THEN 'Anonymous'
        ELSE host_name
    end AS host_name,
    is_superhost, 
    created_at, 
    updated_at
FROM src_hosts
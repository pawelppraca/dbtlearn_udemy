 {{
    config(
    materialized = 'table',
    )
 }}

WITH src_hosts AS (
    SELECT * FROM {{ ref("src_hosts")}}
)

SELECT 
    host_id AS HostID, 
    CASE 
        WHEN host_name is NULL THEN 'Anonymous'
        ELSE host_name
    end AS HostName,
    is_superhost AS Superhost, 
    created_at AS CreateDate, 
    updated_at AS UpdateDate
FROM src_hosts
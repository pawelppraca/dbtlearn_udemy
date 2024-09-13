WITH source AS (
    select * FROM {{ ref("src_hosts")}}
)

select * from source

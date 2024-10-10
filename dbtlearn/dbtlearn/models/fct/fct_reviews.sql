{{
    config(
        materialized = 'incremental',
        on_schema_change = 'fail'
    )
}}

WITH src_reviews AS (
    SELECT * FROM {{ ref('src_reviews')}}
)
SELECT 
   {{ dbt_utils.generate_surrogate_key(['listing_id', 'review_date', 'reviewer_name', 'review_text'])}} AS review_id,
    * 
FROM src_reviews
WHERE review_text is not null
{% if is_incremental() %}
    {% if var('start_date',False) and  var('end_date')  %}
        {{ log('Loading '~ this ~ 'incrementaly (start date: ' ~ var('start_date') ~ ', end date: ' ~ var('end_date'), info=True) }}
        AND review_date >= '{{ var("start_date") }}'
        AND review_date < '{{ var("end_date") }}'
    {% else %}
        AND review_date > coalesce((select max(review_date) from {{ this }}), '1900-01-01')
        {{ log('Loading '~ this ~ 'incrementaly (all missing dates)', info=True) }}
    {% endif %}
{% endif %}


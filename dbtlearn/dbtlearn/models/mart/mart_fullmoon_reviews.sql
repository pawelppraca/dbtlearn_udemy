{{
  config(
    materialized = 'table',
    )
}}

-- Wynikowa tabela zwraca listę ocen noclegów z dodatkową kolumną czy data wydania opinii powstała w dniu po pełni księżyca
-- innymi słowy czy opinia została napisana po nocy z pełnią, czy pełnia miała wpływ na jakość opinii

WITH fct_reviews AS (
    SELECT * FROM {{ ref('fct_reviews')}}
),
full_moon_dates AS (
    SELECT * FROM {{ ref('seed_full_moon_dates')}}
)

SELECT
    r.*,
    CASE 
        WHEN fm.full_moon_date is NULL then 'not full moon'
        ELSE 'full moon'
    end AS is_full_moon
FROM fct_reviews r
LEFT JOIN full_moon_dates fm
    ON (
        DATE(r.review_date) = date_add(fm.full_moon_date,'1 day')
    )
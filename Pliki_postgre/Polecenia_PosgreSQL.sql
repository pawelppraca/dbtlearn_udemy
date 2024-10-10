-- Import danych do tabeli PostgreSQL z pliku CSV
Struktura musi być zgodna

copy raw.raw_reviews from 'C:\Temp\reviews.csv' with csv header

-- DATEADD
select date_add(NOW(),'3 day')

--GETDATE
NOW()

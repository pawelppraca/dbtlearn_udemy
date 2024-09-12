DROP TABLE raw.reviews;
DROP TABLE raw.hosts;
DROP TABLE raw.listings;


CREATE TABLE raw.listings
    (	id integer,
        listing_url varchar(500),
        name varchar(255),
        room_type varchar(100),
        minimum_nights integer,
        host_id integer,
        price varchar(50),
        created_at TIMESTAMP NOT NULL,
        updated_at TIMESTAMP);

CREATE TABLE raw.reviews
	(listing_id  integer ,
	 date TIMESTAMP,
	 reviewer_name varchar(100),
	 comments text,
	 sentiment varchar(100));

CREATE TABLE raw.hosts
	(id integer,
	 name varchar(100),
	 is_superhost varchar(100),
	 created_at TIMESTAMP NOT NULL,
	 updated_at TIMESTAMP);



	copy raw.reviews from 'C:\Temp\reviews.csv' with csv header;
	copy raw.hosts from 'C:\Temp\hosts.csv' with csv header;
	copy raw.listings from 'C:\Temp\listings.csv' with csv header;

	-- PLiki pobrane ze strony: 
	--https://dbtlearn.s3.amazonaws.com/hosts.csv
	--https://dbtlearn.s3.amazonaws.com/reviews.csv
	--https://dbtlearn.s3.amazonaws.com/listings.csv
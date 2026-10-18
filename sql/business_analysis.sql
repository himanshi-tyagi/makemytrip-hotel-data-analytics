-- Run the notebook first and import data/cleaned/makemytrip_hotels_cleaned.csv
-- into a MySQL table named hotel_listings.
-- Use your MySQL import wizard or LOAD DATA LOCAL INFILE as appropriate.

CREATE TABLE IF NOT EXISTS hotel_listings (
    hotel_name VARCHAR(255),
    rating DECIMAL(3,2),
    rating_description VARCHAR(50),
    reviews INT,
    star_rating DECIMAL(2,1),
    location VARCHAR(255),
    nearest_landmark VARCHAR(255),
    distance_to_landmark VARCHAR(50),
    price DECIMAL(12,2),
    tax DECIMAL(12,2),
    city_source VARCHAR(100),
    source_file VARCHAR(100),
    distance_value DECIMAL(10,2),
    distance_unit VARCHAR(10),
    distance_km DECIMAL(10,3),
    price_outlier_flag BOOLEAN
);

-- 1. Listing count and average/median-style price proxy by city.
SELECT
    city_source,
    COUNT(*) AS hotel_listings,
    ROUND(AVG(price), 2) AS average_listed_price,
    ROUND(MIN(price), 2) AS minimum_listed_price,
    ROUND(MAX(price), 2) AS maximum_listed_price,
    ROUND(AVG(rating), 2) AS average_rating
FROM hotel_listings
GROUP BY city_source
ORDER BY average_listed_price DESC;

-- 2. Price and rating by star category.
SELECT
    star_rating,
    COUNT(*) AS listing_count,
    ROUND(AVG(price), 2) AS average_listed_price,
    ROUND(AVG(rating), 2) AS average_rating
FROM hotel_listings
GROUP BY star_rating
ORDER BY star_rating;

-- 3. Top-rated hotels with a minimum review count to avoid ranking on tiny samples.
SELECT
    hotel_name, city_source, star_rating, rating, reviews, price
FROM hotel_listings
WHERE rating IS NOT NULL AND reviews >= 100
ORDER BY rating DESC, reviews DESC
LIMIT 20;

-- 4. Potential price outliers to manually review.
SELECT hotel_name, city_source, star_rating, rating, price
FROM hotel_listings
WHERE price_outlier_flag = TRUE
ORDER BY price DESC;

-- Important: listed price is not realized revenue; no booking records are present.

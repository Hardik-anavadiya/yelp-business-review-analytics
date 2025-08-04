-- Create a table to hold raw JSON reviews
CREATE OR REPLACE TABLE yelp_reviews (
    review_text VARIANT
);

-- Load data from AWS S3 into Snowflake
COPY INTO yelp_reviews
FROM 's3://my-first-project-hardik/'
CREDENTIALS = (
    AWS_KEY_ID = '',
    AWS_SECRET_KEY = ''
)
FILE_FORMAT = (TYPE = JSON);

-- Transform JSON into structured table with sentiment analysis
CREATE OR REPLACE TABLE tbl_yelp_reviews AS 
SELECT  
    review_text:business_id::STRING AS business_id,
    review_text:date::DATE AS review_date,
    review_text:user_id::STRING AS user_id,
    review_text:stars::NUMBER AS review_stars,
    review_text:text::STRING AS review_text,
    analyze_sentiment(review_text) AS sentiments
FROM yelp_reviews;

-- Preview transfo

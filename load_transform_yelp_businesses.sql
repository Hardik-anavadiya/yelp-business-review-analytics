-- Create a table to hold raw JSON business data
CREATE OR REPLACE TABLE yelp_businesses (
    business_text VARIANT
);

-- Load business JSON data from AWS S3 into Snowflake
COPY INTO yelp_businesses
FROM 's3://my-first-project-hardik/yelp_academic_dataset_business.json'
CREDENTIALS = (
    AWS_KEY_ID = '<your_aws_key_id>',
    AWS_SECRET_KEY = '<your_aws_secret_key>'
)
FILE_FORMAT = (TYPE = JSON);

-- Transform JSON into a structured business table
CREATE OR REPLACE TABLE tbl_yelp_businesses AS 
SELECT
    business_text:business_id::STRING AS business_id,
    business_text:name::STRING AS name,
    business_text:city::STRING AS city,
    business_text:state::STRING AS state,
    business_text:review_count::STRING AS review_count,
    business_text:stars::NUMBER AS stars,
    business_text:categories::STRING AS categories
FROM yelp_businesses;

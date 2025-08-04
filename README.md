# Yelp Business Review Analytics

This end-to-end data analytics project focuses on processing and analyzing a large-scale Yelp dataset using Python, AWS S3, and Snowflake. The project includes data engineering, sentiment analysis, and advanced SQL-based business insights.

## Project Overview

- Processed over 7 million Yelp reviews (5GB) and business data (100MB) from JSON files.
- Built a scalable data pipeline using Python for data preparation and splitting.
- Leveraged AWS S3 for cloud storage and Snowflake for data warehousing and querying.

## Tech Stack

- Python  
- AWS S3  
- Snowflake  
- SQL  
- TextBlob (for sentiment analysis)

## Key Features

### Data Engineering & ETL

- Split large JSON files into smaller chunks using Python for efficient ingestion.
- Uploaded data to AWS S3 and loaded it into Snowflake using VARIANT columns and the `COPY INTO` command.
- Transformed JSON into structured tabular format using SQL queries and `CREATE TABLE AS SELECT`.

### Sentiment Analysis

- Created a Python UDF in Snowflake using the TextBlob library.
- Calculated sentiment polarity for each review and classified it as positive, neutral, or negative.
- Appended sentiment results to the final cleaned review table.

### SQL-Based Business Insights

- Unnested comma-separated categories using `SPLIT_TO_TABLE`.
- Identified top users and most-reviewed businesses using `ROW_NUMBER()` and `QUALIFY`.
- Calculated:
  - Percentage of 5-star reviews
  - Monthly review trends
  - Most popular business categories
  - Top businesses by positive sentiment reviews

## Project Outcome

This project demonstrates strong proficiency in cloud data engineering, large-scale data processing, and sentiment analysis. It showcases the ability to build scalable, end-to-end analytics solutions using Python, Snowflake, and SQL.



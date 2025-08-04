Yelp Business Review Analytics
This end-to-end data analytics project focuses on processing and analyzing a large-scale Yelp dataset using Python, AWS S3, and Snowflake. The project includes data engineering, sentiment analysis, and advanced SQL-based business insights.

Project Overview
Processed over 7 million Yelp reviews (5GB) and business data (100MB) from JSON files.

Built a scalable data pipeline using Python for data preparation and splitting.

Leveraged AWS S3 for cloud storage and Snowflake for data warehousing and querying.

Tech Stack
Python

AWS S3

Snowflake

SQL

TextBlob (for sentiment analysis)

Key Features
Data Engineering & ETL
Split large JSON files into smaller chunks using Python for efficient ingestion.

Loaded semi-structured data into Snowflake using VARIANT columns and the COPY INTO command.

Converted JSON to tabular format using SQL transformations.

Sentiment Analysis
Created a Python UDF in Snowflake using the TextBlob library.

Performed polarity-based sentiment classification (positive, neutral, negative).

Added sentiment column to the final review table.

SQL-Based Business Insights
Unnested business categories using SPLIT_TO_TABLE.

Identified top reviewers and most reviewed businesses using ROW_NUMBER() and QUALIFY.

Calculated percentage of 5-star reviews, monthly review trends, and category popularity.

Extracted top businesses by positive sentiment.

Project Outcome
This project demonstrates strong proficiency in cloud data engineering, large-scale data processing, sentiment analysis, and advanced SQL. It showcases the ability to build an end-to-end pipeline using modern data tools and techniques.

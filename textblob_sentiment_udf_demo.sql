-- Create a simple table for testing sentiment analysis
CREATE TABLE reviews (
    review VARCHAR(200)
);

-- Insert sample review texts
INSERT INTO reviews VALUES ('I love this product! It works perfectly');
INSERT INTO reviews VALUES ('This product is okay, but it could be better.');
INSERT INTO reviews VALUES ('I hate this product. It stopped working after a week.');
INSERT INTO reviews VALUES ('This product is okay. Not that great');
INSERT INTO reviews VALUES ('This product is not good. But I can use');

-- Create a Python UDF using TextBlob to analyze sentiment
CREATE OR REPLACE FUNCTION analyze_sentiment(text STRING)
RETURNS STRING
LANGUAGE PYTHON
RUNTIME_VERSION = '3.9'
PACKAGES = ('textblob') 
HANDLER = 'sentiment_analyzer'
AS $$
from textblob import TextBlob
def sentiment_analyzer(text):
    analysis = TextBlob(text)
    if analysis.sentiment.polarity > 0:
        return 'Positive'
    elif analysis.sentiment.polarity == 0:
        return 'Neutral'
    else:
        return 'Negative'
$$;

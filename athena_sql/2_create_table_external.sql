-- Step 2: Create External Table
CREATE EXTERNAL TABLE IF NOT EXISTS rawg_games.games_2024 (
    id BIGINT,
    name STRING,
    released DATE,
    rating DOUBLE,
    ratings_count INT,
    metacritic INT,
    playtime INT,
    platforms STRING,
    slug STRING,
    background_image STRING,
    rating_top INT,
    year INT,
    month INT, 
    days_since_release INT,
    platform_count INT,
    rating_category STRING
)
PARTITIONED BY (quarter INT) -- very important specify the partition to 
-- allow Athena to scan the parquet files
STORED AS PARQUET
LOCATION 's3://rawg-pyspark/processed/games/'
TBLPROPERTIES ('parquet.compression'='SNAPPY');

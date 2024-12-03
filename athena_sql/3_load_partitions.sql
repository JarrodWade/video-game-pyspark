-- Step 3: Load Partitions
MSCK REPAIR TABLE rawg_games.games_2024;

-- basically tells Athena to scan and recognize the parquet files in the S3 bucket
-- and load them into the table

--Alternatively ... you could manually add the partitions
--ALTER TABLE rawg_games.games_2024 ADD PARTITION (quarter=1);
--ALTER TABLE rawg_games.games_2024 ADD PARTITION (quarter=2);
--ALTER TABLE rawg_games.games_2024 ADD PARTITION (quarter=3);
--ALTER TABLE rawg_games.games_2024 ADD PARTITION (quarter=4);
# RAWG Video Game Sales Analysis

This project extracts and analyzes video game sales data from the RAWG API using PySpark in Jupyter Notebooks, AWS S3, and Athena. The data is stored in AWS S3 using the parquet file format for efficiency and analyzed using Amazon Athena. 

## Architecture
- **Data Source**: RAWG Video Games Database API
- **Processing**: Apache Spark (PySpark)
- **Storage**: S3
- **Analysis**: Amazon Athena
- **Development**: Jupyter Notebooks

## Project Structure

```
project_root/
├── docker-compose.yaml        # Container orchestration
├── notebooks/                 # Jupyter notebooks for analysis
│   ├── 01_extract_rawg_data.ipynb
│   ├── 02_transform_games_data.ipynb
│   └── 03_analyze_sales.ipynb
├── athena_sql/               # Athena SQL queries
│   ├── 1_create_db.sql                    # Create Athena database
│   ├── 2_create_table_external.sql        # Create external table
│   ├── 3_load_partitions.sql              # Load table partitions
│   ├── 4_game_counts_by_quarter.sql       # Count games by quarter
│   ├── 5_average_game_ratings.sql         # Average ratings analysis
│   ├── 6_top_10_games_2024.sql           # Top rated games
│   └── 7_most_reviewed_games_2024.sql    # Most reviewed games
└── .env.example              # Template for environment variables
```

## Prerequisites
- Docker and Docker Compose
- RAWG API Key (get it from [RAWG](https://rawg.io/apidocs))
- AWS Credentials with access to S3 and Athena

## Setup
1. Clone the repository:
   ```bash
   git clone https://github.com/JarrodWade/video-game-pyspark.git
   cd video-game-pyspark
   ```

2. Set up environment variables:
   - Copy `.env.example` to `.env`
   - Fill in your credentials:
     ```
     AWS_ACCESS_KEY_ID=your_access_key
     AWS_SECRET_ACCESS_KEY=your_secret_key
     AWS_REGION=your_region
     RAWG_API_KEY=your_rawg_api_key
     ```

3. Start the containers:
   ```bash
   docker-compose up -d
   OR
   make up
   ```

## Data Analysis
The project includes several SQL scripts for analyzing the game data using Amazon Athena. You would need to run the scripts within the Athena interface. *Please also keep in mind Athena only allows 1 query exectuion per query tab:

1. Database and Table Setup:
   - Create Athena database
   - Create external table pointing to S3 Parquet files
   - Load partitioned data



<img width="367" alt="Screenshot 2024-12-03 at 10 51 46 AM" src="https://github.com/user-attachments/assets/4707020a-513b-4c02-8a58-972fa05a4039">




2. Analysis Queries:
   - Game counts by quarter
   - Average ratings by quarter and category
   - Top 10 rated games of 2024
   - Most reviewed games with statistical analysis
  

<img width="1099" alt="Screenshot 2024-12-03 at 10 54 43 AM" src="https://github.com/user-attachments/assets/f71bc203-2e41-445f-8bce-dc4caac8a86c">


<img width="1097" alt="Screenshot 2024-12-03 at 10 55 34 AM" src="https://github.com/user-attachments/assets/7b880651-bb0c-4c17-8ebd-118b72d5cf0e">



## Services
- **Jupyter Lab**: http://localhost:8888
- **Spark UI**: http://localhost:4040 (when Spark is running)
- **Amazon Athena**: Access through AWS Console or AWS Athena GUI


## Data Storage
- Raw data and processed data are stored in the `rawg-pyspark` S3 bucket
- Data is partitioned by quarter and stored in Parquet format for efficient querying
- Athena queries leverage partitioning for optimized performance

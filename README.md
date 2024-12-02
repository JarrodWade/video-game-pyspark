# RAWG Video Game Sales Analysis

This project extracts and analyzes video game sales data from the RAWG API using PySpark and Apache Iceberg. The data is stored in MinIO (S3-compatible storage) using the Apache Iceberg table format for efficient querying and analysis.

## Architecture
- **Data Source**: RAWG Video Games Database API
- **Processing**: Apache Spark (PySpark)
- **Storage**: MinIO (S3-compatible) with Apache Iceberg
- **Development**: Jupyter Notebooks

## Project Structure

```
project_root/
├── docker-compose.yaml # Container orchestration
├── notebooks/ # Jupyter notebooks for analysis
│ ├── 01_extract_rawg_data.ipynb
│ ├── 02_transform_games_data.ipynb
│ └── 03_analyze_sales.ipynb
├── data/ # Raw data storage
└── .env.example # Template for environment variables
```

## Prerequisites
- Docker and Docker Compose
- RAWG API Key (get it from [RAWG](https://rawg.io/apidocs))

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
     MINIO_ROOT_USER=your_minio_user
     MINIO_ROOT_PASSWORD=your_minio_password
     ```

3. Start the containers:
   ```bash
   docker-compose up -d
   ```

## Services
- **Jupyter Lab**: http://localhost:8888
- **MinIO Console**: http://localhost:9001
  - Login with credentials from .env file
- **Spark UI**: http://localhost:4040 (when Spark is running)

## Data Storage
- Raw data and Iceberg tables are stored in the `rawg-video-game-sales` S3 bucket
- Data is organized using Apache Iceberg table format for efficient querying and time travel capabilities

## Usage
1. Access Jupyter Lab at http://localhost:8888
2. Navigate to the notebooks directory
3. Execute notebooks in sequence:
   - 01_extract_rawg_data.ipynb: Extracts data from RAWG API
   - 02_transform_games_data.ipynb: Transforms and loads data into Iceberg
   - 03_analyze_sales.ipynb: Analyzes video game sales data

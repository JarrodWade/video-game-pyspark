-- Most reviewed games of 2024 with rating statistics
WITH game_stats AS (
    SELECT 
        AVG(rating) as avg_rating,
        AVG(ratings_count) as avg_review_count,
        STDDEV(rating) as rating_stddev,
        STDDEV(ratings_count) as review_count_stddev
    FROM rawg_games.games_2024
    WHERE year = 2024
)
SELECT 
    g.name,
    g.released,
    g.rating,
    g.ratings_count,
    ROUND(g.rating - s.avg_rating, 2) as rating_diff_from_avg,
    ROUND(g.ratings_count - s.avg_review_count, 0) as review_count_diff_from_avg,
    ROUND((g.rating - s.avg_rating) / NULLIF(s.rating_stddev, 0), 2) as rating_z_score,
    ROUND((g.ratings_count - s.avg_review_count) / NULLIF(s.review_count_stddev, 0), 2) as review_count_z_score
FROM 
    rawg_games.games_2024 g
CROSS JOIN game_stats s
WHERE 
    g.year = 2024
ORDER BY 
    g.ratings_count DESC,
    g.rating DESC
LIMIT 10;


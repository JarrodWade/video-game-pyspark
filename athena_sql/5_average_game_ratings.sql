-- Average rating by quarter and rating_category
SELECT 
    quarter,
    rating_category,
    AVG(rating) as avg_rating,
    COUNT(*) as game_count
FROM rawg_games.games_2024
GROUP BY quarter, rating_category
ORDER BY quarter, rating_category;
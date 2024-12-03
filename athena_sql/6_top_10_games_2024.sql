-- Top games of 2024 based on rating
SELECT 
    id,
    name,
    released,
    rating,
    ratings_count,
    metacritic,
    platforms
FROM 
    rawg_games.games_2024
WHERE 
    year = 2024
ORDER BY 
    rating DESC,
    ratings_count DESC
LIMIT 10;
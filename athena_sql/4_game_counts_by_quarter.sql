-- Count games by quarter
SELECT quarter, COUNT(*) as game_count
FROM rawg_games.games_2024
GROUP BY quarter
ORDER BY quarter;
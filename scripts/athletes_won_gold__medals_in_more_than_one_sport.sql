SELECT
    athlete_name AS athlete,
    COUNT(DISTINCT sport) AS sports
FROM events
WHERE medal = 'Gold'
GROUP BY athlete
HAVING COUNT(DISTINCT sport) > 1
ORDER BY sports DESC
LIMIT 5;

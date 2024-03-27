SELECT
    DISTINCT r.region AS country,
    COUNT(athlete_id) AS total_athletes,
    SUM(CASE WHEN gender = 'M' THEN 1 ELSE 0 END) AS male,
    SUM(CASE WHEN gender = 'F' THEN 1 ELSE 0 END) AS female
FROM events e
INNER JOIN regions r ON e.noc = r.noc
GROUP BY country
ORDER BY total_athletes DESC
LIMIT 10;
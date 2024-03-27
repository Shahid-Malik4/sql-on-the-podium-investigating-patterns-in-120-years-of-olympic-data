SELECT
    DISTINCT r.region AS country,
    SUM(CASE WHEN medal = 'Gold' THEN 1 ELSE 0 END) AS gold,
    SUM(CASE WHEN medal = 'Bronze' THEN 1 ELSE 0 END) AS bronze,
    SUM(CASE WHEN medal = 'Silver' THEN 1 ELSE 0 END) AS silver,
    SUM(CASE WHEN medal != 'NA' THEN 1 ELSE 0 END) AS total
FROM events e
INNER JOIN regions r ON e.noc = r.noc
GROUP BY country
ORDER BY total DESC
LIMIT 10;
SELECT
    r.region AS region,
    COUNT(*) AS total_medals
FROM events e
INNER JOIN regions r ON e.noc = r.noc
WHERE e.medal IN ('Gold', 'Silver', 'Bronze')
GROUP BY region
ORDER BY total_medals DESC
LIMIT 10;
SELECT
    DISTINCT city AS city,
    COUNT(DISTINCT year) AS total_hosts
FROM events
GROUP BY city
ORDER BY total_hosts DESC
LIMIT 5;

SELECT
    DISTINCT year AS year,
    COUNT(DISTINCT noc) AS regions_participated,
    COUNT(DISTINCT athlete_id) AS athletes_participated,
    SUM(CASE WHEN medal != 'NA' THEN 1 ELSE 0 END) AS medals
FROM events
GROUP BY year
ORDER BY regions_participated DESC
LIMIT 5;
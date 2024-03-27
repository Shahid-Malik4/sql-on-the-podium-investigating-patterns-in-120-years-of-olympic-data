WITH RankedRegions AS (
    SELECT
        e.year AS year,
        r.region AS region,
        SUM(CASE WHEN e.medal != 'NA' THEN 1 ELSE 0 END) AS total_medals,
        RANK() OVER (PARTITION BY e.year ORDER BY SUM(CASE WHEN e.medal != 'NA' THEN 1 ELSE 0 END) DESC) AS rnk
    FROM events e
    INNER JOIN regions r ON e.noc = r.noc
    GROUP BY year, region
)
SELECT 
    year, 
    region, 
    total_medals
FROM 
    RankedRegions
WHERE rnk <= 1
ORDER BY Year;

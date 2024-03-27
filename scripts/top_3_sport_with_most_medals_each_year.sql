WITH YearlySportMedalCounts AS (
    SELECT
        year AS year,
        sport AS sport,
        COUNT(*) AS total_medals,
        RANK() OVER (PARTITION BY year ORDER BY COUNT(*) DESC) AS rnk
    FROM events
    WHERE medal IN ('Gold', 'Silver', 'Bronze')
    GROUP BY year, sport
)
SELECT 
    year, 
    sport, 
    total_medals
FROM YearlySportMedalCounts
WHERE rnk <= 3
ORDER BY year;

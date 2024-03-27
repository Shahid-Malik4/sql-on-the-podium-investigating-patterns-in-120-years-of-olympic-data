SELECT
    r.region AS region,
    COUNT(*) AS total_medals
FROM events e
INNER JOIN regions r ON e.noc = r.noc
WHERE e.medal IN ('Gold', 'Silver', 'Bronze')
GROUP BY region
ORDER BY total_medals DESC
LIMIT 10;

/*
|   Region   |  Total_Medals  |
|------------|----------------|
|    USA     |      5392      |
|   Russia   |      3942      |
|  Germany   |      3719      |
|     UK     |      1963      |
|   France   |      1681      |
|   Italy    |      1598      |
|   Sweden   |      1534      |
| Australia  |      1344      |
|   Canada   |      1319      |
|  Hungary   |      1134      |

*/

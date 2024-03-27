SELECT
    DISTINCT city AS city,
    COUNT(DISTINCT year) AS hosts
FROM events
GROUP BY city
ORDER BY total_hosts DESC
LIMIT 5;

/*
|    city     | hosts |
|:-----------:|:-----:|
|   London    |   3   |
|   Athina    |   3   |
|    Paris    |   2   |
| Los Angeles |   2   |
|  Innsbruck  |   2   |

*/

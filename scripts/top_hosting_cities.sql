SELECT
    DISTINCT city AS city,
    COUNT(DISTINCT year) AS total_hosts
FROM events
GROUP BY city
ORDER BY total_hosts DESC
LIMIT 5;

/*
|    City     | Hosts |
|:-----------:|:-----:|
|   London    |   3   |
|   Athina    |   3   |
|    Paris    |   2   |
| Los Angeles |   2   |
|  Innsbruck  |   2   |

*/

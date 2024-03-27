SELECT
    r.region AS region
FROM regions r
INNER JOIN events e ON r.noc = e.noc
WHERE e.medal = 'Gold'
GROUP BY region
HAVING COUNT(DISTINCT e.year) = (SELECT COUNT(DISTINCT year) FROM events);

/*
| Region |
|--------|
| USA    |

*/

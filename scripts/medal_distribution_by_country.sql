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

/*
| Region    | Total Medals |
|-----------|--------------|
| USA       | 5392         |
| Russia    | 3942         |
| Germany   | 3719         |
| UK        | 1963         |
| France    | 1681         |
| Italy     | 1598         |
| Sweden    | 1534         |
| Australia | 1344         |
| Canada    | 1319         |
| Hungary   | 1134         |

*/

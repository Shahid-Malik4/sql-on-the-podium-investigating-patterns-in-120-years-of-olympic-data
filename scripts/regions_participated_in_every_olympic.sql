SELECT
    r.region AS region
FROM regions r
INNER JOIN events e ON r.noc = e.noc
GROUP BY region
HAVING COUNT(DISTINCT e.year) = (SELECT COUNT(DISTINCT year) FROM events);

/*
| Region       |
|--------------|
| Australia    |
| Greece       |
| Switzerland  |
| UK           |
| USA          |

*/

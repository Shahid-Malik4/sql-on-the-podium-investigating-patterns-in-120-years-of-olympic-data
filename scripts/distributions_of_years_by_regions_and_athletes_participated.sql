SELECT
    DISTINCT year AS year,
    COUNT(DISTINCT noc) AS regions_participated,
    COUNT(DISTINCT athlete_id) AS athletes_participated,
    SUM(CASE WHEN medal != 'NA' THEN 1 ELSE 0 END) AS medals
FROM events
GROUP BY year
ORDER BY regions_participated DESC
LIMIT 5;

/*
| Year | Regions Participated | Athletes Participated | Medals |
|------|----------------------|-----------------------|--------|
| 2016 | 207                  | 11176                 | 2022   |
| 2012 | 205                  | 10512                 | 1940   |
| 2008 | 204                  | 10895                 | 2048   |
| 2004 | 201                  | 10554                 | 2000   |
| 2000 | 200                  | 10641                 | 2003   |

*/

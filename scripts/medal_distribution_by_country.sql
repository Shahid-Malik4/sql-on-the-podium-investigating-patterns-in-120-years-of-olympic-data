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
|  Country  |  Gold  |  Bronze  |  Silver  |  Total  |
|-----------|--------|----------|----------|---------|
|    USA    |  2524  |   1294   |   1574   |   5392  |
|  Russia   |  1597  |   1176   |   1169   |   3942  |
|  Germany  |  1292  |   1252   |   1175   |   3719  |
|    UK     |  656   |   624    |   683    |   1963  |
|  France   |  491   |   627    |   563    |   1681  |
|   Italy   |  567   |   503    |   528    |   1598  |
|  Sweden   |  477   |   535    |   522    |   1534  |
| Australia |  366   |   522    |   456    |   1344  |
|  Canada   |  460   |   430    |   429    |   1319  |
|  Hungary  |  432   |   371    |   331    |   1134  |

*/

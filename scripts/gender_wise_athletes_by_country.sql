SELECT
    DISTINCT r.region AS country,
    COUNT(athlete_id) AS total_athletes,
    SUM(CASE WHEN gender = 'M' THEN 1 ELSE 0 END) AS male,
    SUM(CASE WHEN gender = 'F' THEN 1 ELSE 0 END) AS female
FROM events e
INNER JOIN regions r ON e.noc = r.noc
GROUP BY country
ORDER BY total_athletes DESC
LIMIT 10;

/*
| country   | total_Athletes | male  | female |
|-----------|----------------|-------|--------|
| USA       | 18034          | 12600 | 5434   |
| Germany   | 15681          | 10860 | 4821   |
| Russia    | 11501          | 7404  | 4097   |
| UK        | 11488          | 8258  | 3230   |
| France    | 11404          | 8706  | 2698   |
| Italy     | 10321          | 7796  | 2525   |
| Canada    | 9501           | 5968  | 3533   |
| Japan     | 8327           | 5556  | 2771   |
| Sweden    | 8327           | 6343  | 1984   |
| Australia | 7599           | 4869  | 2730   |

*/

SELECT
    r.region AS region,
    SUM(CASE WHEN e.medal != 'NA' AND e.season = 'Summer' THEN 1 ELSE 0 END) as summer_medals,
    SUM(CASE WHEN e.medal != 'NA' AND e.season = 'Winter' THEN 1 ELSE 0 END) as winter_medals,
    SUM(CASE WHEN e.medal != 'NA' THEN 1 ELSE 0 END) as total_medals
FROM events e
INNER JOIN regions r ON e.noc = r.noc 
GROUP BY region;

/*
| region                    | summer_medals | winter_medals | total_medals |
|---------------------------|---------------|---------------|--------------|
| China                     | 913           | 80            | 993          |
| Denmark                   | 591           | 5             | 596          |
| Netherlands               | 906           | 122           | 1028         |
| USA                       | 4790          | 602           | 5392         |
| Finland                   | 474           | 426           | 900          |
| Norway                    | 590           | 443           | 1033         |
| Romania                   | 634           | 2             | 636          |
| Estonia                   | 43            | 7             | 50           |
| France                    | 1531          | 150           | 1681         |
| Morocco                   | 23            | 0             | 23           |
| Spain                     | 487           | 2             | 489          |
| Egypt                     | 25            | 0             | 25           |
| Bulgaria                  | 336           | 6             | 342          |
| Italy                     | 1407          | 191           | 1598         |
| Azerbaijan                | 44            | 0             | 44           |
| Russia                    | 3185          | 757           | 3942         |
| Argentina                 | 274           | 0             | 274          |
| Cuba                      | 409           | 0             | 409          |
| Belarus                   | 124           | 15            | 139          |
| Greece                    | 121           | 0             | 121          |
| Cameroon                  | 22            | 0             | 22           |
| Turkey                    | 79            | 0             | 79           |
| Chile                     | 32            | 0             | 32           |
| Mexico                    | 110           | 0             | 110          |

*/

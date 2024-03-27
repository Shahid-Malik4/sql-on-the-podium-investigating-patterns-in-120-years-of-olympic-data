WITH RankedRegions AS (
    SELECT
        e.year AS year,
        r.region AS region,
        SUM(CASE WHEN e.medal != 'NA' THEN 1 ELSE 0 END) AS total_medal,
        RANK() OVER (PARTITION BY e.year ORDER BY SUM(CASE WHEN e.medal != 'NA' THEN 1 ELSE 0 END) DESC) AS rnk
    FROM events e
    INNER JOIN regions r ON e.noc = r.noc
    GROUP BY year, region
)
SELECT 
    year, 
    region, 
    total_medal
FROM 
    RankedRegions
WHERE rnk <= 1
ORDER BY Year;

/*
|  year |  region  | total_medal |
|-------|----------|-------------|
|  1896 | Germany  |     30      |
|  1900 |  France  |    168      |
|  1904 |   USA    |    348      |
|  1906 |  France  |     53      |
|  1908 |    UK    |    316      |
|  1912 |  Sweden  |    190      |
|  1920 |   USA    |    188      |
|  1924 |   USA    |    187      |
|  1928 |   USA    |     97      |
|  1932 |   USA    |    208      |
|  1936 | Germany  |    230      |
|  1948 |   USA    |    154      |
|  1952 |   USA    |    151      |
|  1956 |  Russia  |    206      |
|  1960 |  Russia  |    211      |
|  1964 |  Russia  |    221      |
|  1968 |  Russia  |    229      |
|  1972 | Germany  |    283      |
|  1976 |  Russia  |    342      |
|  1980 |  Russia  |    496      |
|  1984 |   USA    |    348      |
|  1988 |  Russia  |    365      |
|  1992 |  Russia  |    279      |
|  1994 | Germany  |     40      |
|  1996 |   USA    |    248      |
|  1998 | Finland  |     58      |
|  2000 |   USA    |    241      |
|  2002 |   USA    |     82      |
|  2004 |   USA    |    262      |
|  2006 |  Canada  |     69      |
|  2008 |   USA    |    317      |
|  2010 |   USA    |     93      |
|  2012 |   USA    |    247      |
|  2014 |  Canada  |     86      |
|  2016 |   USA    |    263      |

*/

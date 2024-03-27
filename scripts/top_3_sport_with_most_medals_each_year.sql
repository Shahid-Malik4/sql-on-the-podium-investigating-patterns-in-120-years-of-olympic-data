WITH YearlySportMedalCounts AS (
    SELECT
        year AS year,
        sport AS sport,
        COUNT(*) AS total_medals,
        RANK() OVER (PARTITION BY year ORDER BY COUNT(*) DESC) AS rnk
    FROM events
    WHERE medal IN ('Gold', 'Silver', 'Bronze')
    GROUP BY year, sport
)
SELECT 
    year, 
    sport, 
    total_medals
FROM YearlySportMedalCounts
WHERE rnk <= 3
ORDER BY year;

/*
| Year |         Sport         | Medal_Count |
|------|-----------------------|-------------|
| 1896 | Gymnastics            | 31          |
| 1896 | Athletics             | 29          |
| 1896 | Cycling               | 11          |
| 1900 | Athletics             | 75          |
| 1900 | Sailing               | 63          |
| 1900 | Rowing                | 62          |
| 1904 | Athletics             | 74          |
| 1904 | Gymnastics            | 45          |
| 1904 | Rowing                | 38          |
| 1906 | Athletics             | 63          |
| 1906 | Gymnastics            | 42          |
| 1906 | Shooting              | 37          |
| 1908 | Athletics             | 99          |
| 1908 | Shooting              | 97          |
| 1908 | Gymnastics            | 97          |
| 1912 | Gymnastics            | 198         |
| 1912 | Shooting              | 143         |
| 1912 | Athletics             | 142         |
| 1920 | Shooting              | 181         |
| 1920 | Gymnastics            | 167         |
| 1920 | Athletics             | 130         |
| 1924 | Athletics             | 129         |
| 1924 | Fencing               | 70          |
| 1924 | Shooting              | 70          |
| 1928 | Athletics             | 106         |
| 1928 | Gymnastics            | 70          |
| 1928 | Rowing                | 70          |
| 1932 | Athletics             | 107         |
| 1932 | Rowing                | 76          |
| 1932 | Fencing               | 65          |
| 1936 | Athletics             | 112         |
| 1936 | Rowing                | 76          |
| 1936 | Gymnastics            | 70          |
| 1948 | Athletics             | 123         |
| 1948 | Rowing                | 76          |
| 1948 | Gymnastics            | 72          |
| 1952 | Athletics             | 123         |
| 1952 | Gymnastics            | 110         |
| 1952 | Rowing                | 75          |
| 1956 | Athletics             | 124         |
| 1956 | Gymnastics            | 99          |
| 1956 | Rowing                | 72          |
| 1960 | Athletics             | 127         |
| 1960 | Swimming              | 104         |
| 1960 | Rowing                | 76          |
| 1960 | Fencing               | 76          |
| 1964 | Athletics             | 133         |
| 1964 | Swimming              | 115         |
| 1964 | Rowing                | 77          |
| 1968 | Swimming              | 153         |
| 1968 | Athletics             | 128         |
| 1968 | Rowing                | 79          |
| 1972 | Swimming              | 160         |
| 1972 | Athletics             | 148         |
| 1972 | Rowing                | 77          |
| 1976 | Rowing                | 163         |
| 1976 | Athletics             | 144         |
| 1976 | Swimming              | 130         |
| 1980 | Rowing                | 165         |
| 1980 | Athletics             | 153         |
| 1980 | Swimming              | 131         |
| 1984 | Athletics             | 164         |
| 1984 | Rowing                | 161         |
| 1984 | Swimming              | 148         |
| 1988 | Athletics             | 171         |
| 1988 | Swimming              | 167         |
| 1988 | Rowing                | 165         |
| 1992 | Athletics             | 173         |
| 1992 | Swimming              | 167         |
| 1992 | Rowing                | 155         |
| 1994 | Ice Hockey            | 65          |
| 1994 | Cross Country Skiing  | 44          |
| 1994 | Biathlon              | 36          |
| 1996 | Athletics             | 178         |
| 1996 | Swimming              | 175         |
| 1996 | Rowing                | 144         |
| 1998 | Ice Hockey            | 125         |
| 1998 | Cross Country Skiing  | 44          |
| 1998 | Biathlon              | 36          |
| 1998 | Short Track Speed Skating | 36     |
| 2000 | Athletics             | 190         |
| 2000 | Swimming              | 185         |
| 2000 | Rowing                | 144         |
| 2002 | Ice Hockey            | 125         |
| 2002 | Cross Country Skiing  | 54          |
| 2002 | Short Track Speed Skating | 46     |
| 2004 | Swimming              | 185         |
| 2004 | Athletics             | 180         |
| 2004 | Rowing                | 144         |
| 2006 | Ice Hockey            | 131         |
| 2006 | Cross Country Skiing  | 60          |
| 2006 | Speed Skating         | 59          |
| 2008 | Swimming              | 200         |
| 2008 | Athletics             | 187         |
| 2008 | Rowing                | 144         |
| 2010 | Ice Hockey            | 124         |
| 2010 | Cross Country Skiing  | 60          |
| 2010 | Speed Skating         | 51          |
| 2012 | Swimming              | 195         |
| 2012 | Athletics             | 189         |
| 2012 | Rowing                | 144         |
| 2014 | Ice Hockey            | 130         |
| 2014 | Biathlon              | 60          |
| 2014 | Cross Country Skiing  | 60          |
| 2016 | Swimming              | 191         |
| 2016 | Athletics             | 191         |
| 2016 | Rowing                | 144         |

*/

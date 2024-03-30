# Introduction
📊 The "Investigating Patterns in 120 Years of Olympic Data" project involved the extraction, cleaning, and manipulation of Olympic Games dataset sourced from Kaggle. Using Excel for initial cleaning and MySQL for data preparation, normalization, and analysis, the project aimed to derive insights into Olympic performance metrics, including regional medal distribution, athlete achievements, and trends over time.


# Background
**Objective:** The objective of the project is to analyze and derive insights from historical Olympic Games data spanning 120 years. The project involves acquiring, cleaning, and manipulating data from Kaggle using Excel, followed by importing the processed data into a MySQL database. The focus of the analysis is to gain a comprehensive understanding of Olympic performance, including identifying regions with the most medals, analyzing medals by season and gender, identifying top medal-winning athletes, exploring regions' consistent participation across Olympic events, recognizing regions that consistently win gold medals, examining average age and medal distribution by gender and year, identifying the year with the most medals won, and determining the regions that have participated in every Olympic Games.


## Tools Used
For my deep dive into the analysis, I harnessed the power of several key tools:

- **SQL:** The backbone of my analysis and was the primary tool used for querying and analyzing the dataset.
- **MySQL:** The chosen database management system, ideal for doing such kind of analysis.
- **Git & GitHub:** Essential for version control and sharing my SQL scripts and analysis, ensuring collaboration and project tracking.


# Project Phases:

### 1. Data Extraction and Preparation:
Acquire raw Olympic Games dataset from Kaggle and use Excel for initial cleaning. Conducted data cleaning in Excel, addressing inconsistencies, missing values, and formatting issues.

### 2. Data Import and Normalization in MySQL:
Imported cleaned data into MySQL for further data preparation, normalization, and analysis. Conducted data normalization to improve performance and reduce redundancy, ensuring efficient querying.

### 3. SQL Analysis with Advanced Functionalities:
Utilized a range of SQL functionalities for in-depth analysis:
- **Basic SELECT, WHERE, FROM Commands:** Extracted specific data subsets based on conditions.
- **Advanced GROUP BY, HAVING:** Conducted group-wise aggregations and filtering.
- **Common Table Expressions (CTE):** Created temporary result sets for complex queries.
- **Joins and Subqueries:** Combined data from multiple tables and performed nested queries.
- **Window Functions (SUM, AVG, RANK, ROW_NUMBER, LEAD, LAG):** Calculated aggregated values and performed ranking and analytical operations.

### 4. Key Features and Insights:
- **Regions with Most Medals:** Identified regions with the highest medal counts across all Olympic Games.
- **Medals by Season:** Visualized and analyzed medal distributions in Summer and Winter Olympics.
- **Medals by Gender:** Explored gender-based medal distributions to identify patterns.
- **Top Medal-Winning Athletes:** Recognized athletes with the most Olympic medals. Regions Participated in Every Olympic: Identified regions that consistently participated in every Olympic Games.
- **Regions Winning Gold in Every Olympic:** Recognized regions with a consistent record of winning gold medals.
- **Average Age and Medal Distribution by Gender and Year:** Analyzed average athlete age and medal distribution trends over time.
- **Year with Most Medals Won:** Identified the Olympic year with the highest overall medal count.
- **Regions Participated:** Explored regions participating in each Olympic year.


### Queries and Results:

### 1. **Top Performing Countries:**
```sql
SELECT
    r.region AS country,
    COUNT(*) AS total_medals
FROM events e
INNER JOIN regions r ON e.noc = r.noc
WHERE e.medal IN ('Gold', 'Silver', 'Bronze')
GROUP BY country
ORDER BY total_medals DESC
LIMIT 10;
```

Here's the breakdown of query results
- The analysis revealed that the **United States**, **Russia**, and **Germany** are consistently among the top-performing countries in terms of total medals won across all Olympic Games editions.

|   region   |  total_medals  |
|------------|----------------|
|    USA     |      5392      |
|   Russia   |      3942      |
|  Germany   |      3719      |
|     UK     |      1963      |
|   France   |      1681      |
|   Italy    |      1598      |
|   Sweden   |      1534      |
| Australia  |      1344      |
|   Canada   |      1319      |
|  Hungary   |      1134      |


### 2. **Cities That Hosted Olympics Most Times:**
```sql
SELECT
    DISTINCT city AS city,
    COUNT(DISTINCT year) AS hosts
FROM events
GROUP BY city
ORDER BY total_hosts DESC
LIMIT 5;
```

Here's the breakdown of query results
- Cities like **London** and **Athens** have hosted the Olympics multiple times, demonstrating their significance as prominent hosts in Olympic history.

|    city     | hosts |
|:-----------:|:-----:|
|   London    |   3   |
|   Athens    |   3   |
|    Paris    |   2   |
| Los Angeles |   2   |
|  Innsbruck  |   2   |


### 3. **Top Performing Athletes with Medals in Multiple Sports:**
```sql
SELECT
    athlete_name AS athlete,
    COUNT(DISTINCT sport) AS sports
FROM events
WHERE medal = 'Gold'
GROUP BY athlete
HAVING COUNT(DISTINCT sport) > 1
ORDER BY sports DESC
LIMIT 5;
```

Here's the breakdown of query results
- Athletes who have won medals in multiple sports demonstrate versatility and excellence across different disciplines, highlighting their exceptional athletic abilities.

| athlete                             | sports |
|-------------------------------------|--------|
| Aleksandr Vladimirovich Popov       | 2      |
| Anfisa Anatolyevna Reztsova         | 2      |
| Carl Frederik Pedersen              | 2      |
| Carl Schuhmann                      | 2      |
| Charles Frederick "Karch" Kiraly    | 2      |


### 4. **Regions Participated in All Olympic Games:**
```sql
SELECT
    r.region AS region
FROM regions r
INNER JOIN events e ON r.noc = e.noc
GROUP BY region
HAVING COUNT(DISTINCT e.year) = (SELECT COUNT(DISTINCT year) FROM events);
```

Here's the breakdown of query results
- Regions like **Australia**, **USA** and **Switzerland** participated in all Olympic Games editions showcase a consistent commitment to the Olympic movement, contributing to the global spirit of sportsmanship and competition.

| region       |
|--------------|
| Australia    |
| Greece       |
| Switzerland  |
| UK           |
| USA          |


### 5. **Top Performing Regions in Each Year:**
```sql
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
```

Here's the brealdown of query results
- The analysis identified regions like **USA**, **Russia** and **Germany** that consistently excel in specific years, reflecting their dominance and success in certain Olympic Games editions.

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

### 6. **Medal Distribution by Sport in Each Year**
```sql
WITH YearlySportMedalCounts AS (
    SELECT
        year AS year,
        sport AS sport,
        COUNT(*) AS total_medal,
        RANK() OVER (PARTITION BY year ORDER BY COUNT(*) DESC) AS rnk
    FROM events
    WHERE medal IN ('Gold', 'Silver', 'Bronze')
    GROUP BY year, sport
)
SELECT 
    year, 
    sport, 
    total_medal
FROM YearlySportMedalCounts
WHERE rnk <= 3
ORDER BY year;
```

Here's the breakdown of query results
- Sports such as **Athletics**, **Swimming**, and **Gymnastics** tend to have a higher distribution of medals compared to other sports, indicating their popularity and competitiveness in the Olympics.

| year |         sport         | total_medal |
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



## Lessons Learned:

1. **SQL Fundamentals:** Through this project, I gained a deeper understanding of SQL syntax, including SELECT statements, JOINs, GROUP BY, HAVING, and ORDER BY clauses. Also WITH clause and Window Functions. I learned how to structure queries to retrieve specific information from a database efficiently.

2. **Data Analysis Techniques:** This project allowed me to practice data analysis techniques using SQL. I learned how to extract meaningful insights from a dataset, such as identifying trends, aggregating data, and filtering results based on specific criteria.

3. **Database Management:** Working with a dataset in MySQL helped me improve my database management skills. I learned how to create tables, insert data, and execute queries to retrieve information from the database.

4. **Git Version Control:** I used Git for version control throughout the project. It helped me track changes to my code and revert to previous versions if needed. I learned how to create branches, commit changes, and merge branches using Git commands.

5. **GitHub Collaboration:** By hosting my project on GitHub, I learned how to collaborate with others effectively. I utilized GitHub features such as pull requests, code reviews, and issue tracking to manage project tasks efficiently.


## Conclusion:

The analysis of historical Olympic Games data provides valuable insights into the performance of countries, athletes, and host cities across various editions of the Olympics. By examining medal counts, participation trends, and hosting patterns, i gain a deeper understanding of the impact and significance of the Olympic Games on a global scale.

Through this project, i have learned valuable lessons in data analysis, database management, version control, and collaboration using tools such as SQL, MySQL, Git, and GitHub. By leveraging real Olympic data, i have gained practical experience in querying datasets, extracting meaningful insights, and presenting findings in a structured format.

Overall, this project has enriched my knowledge of the Olympic Games and enhanced my skills in data analysis and project management. It highlights the power of data-driven insights in uncovering trends, patterns, and stories behind one of the world's most celebrated sporting events.

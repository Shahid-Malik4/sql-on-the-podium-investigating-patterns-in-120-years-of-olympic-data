SELECT
    r.region AS region,
    SUM(CASE WHEN e.medal != 'NA' AND e.season = 'Summer' THEN 1 ELSE 0 END) as summer_total_medals,
    SUM(CASE WHEN e.medal != 'NA' AND e.season = 'Winter' THEN 1 ELSE 0 END) as winter_total_medals,
    SUM(CASE WHEN e.medal != 'NA' THEN 1 ELSE 0 END) as total_medals
FROM events e
INNER JOIN regions r ON e.noc = r.noc 
GROUP BY region;
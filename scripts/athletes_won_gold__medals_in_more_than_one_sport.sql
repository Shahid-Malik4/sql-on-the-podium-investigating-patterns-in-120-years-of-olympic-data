SELECT
    athlete_name AS athlete,
    COUNT(DISTINCT sport) AS sports
FROM events
WHERE medal = 'Gold'
GROUP BY athlete
HAVING COUNT(DISTINCT sport) > 1
ORDER BY sports DESC
LIMIT 5;

/*
| athlete                             | sports |
|-------------------------------------|--------|
| Aleksandr Vladimirovich Popov       | 2      |
| Anfisa Anatolyevna Reztsova         | 2      |
| Carl Frederik Pedersen              | 2      |
| Carl Schuhmann                      | 2      |
| Charles Frederick "Karch" Kiraly    | 2      |

*/

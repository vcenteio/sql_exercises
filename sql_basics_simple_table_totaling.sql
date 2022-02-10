-- https://www.codewars.com/kata/5809575e166583acfa000083/train/sql

SELECT
    (row_number() OVER (ORDER BY sum(points) DESC)) AS rank,
    (CASE WHEN clan = '' THEN '[no clan specified]' ELSE clan END) AS clan,
    sum(points) AS total_points,
    count(name) AS total_people
FROM people
GROUP BY clan
ORDER BY total_points DESC;

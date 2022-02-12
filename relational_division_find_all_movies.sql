-- https://www.codewars.com/kata/5817b124e7f4576fd00020a2/train/sql

SELECT
    f.title
FROM
    actor a
    JOIN film_actor USING(actor_id)
    JOIN film f USING(film_id)
WHERE a.actor_id IN (105, 122)
GROUP BY f.title
HAVING count(f.title) = 2
ORDER BY f.title;

-- https://www.codewars.com/kata/5818bde9559ff58bd90004a2/train/sql


WITH joined_tables AS (
    SELECT
        a.actor_id,
        concat_ws(' ', a.first_name, a.last_name) AS full_name,
        f.film_id,
        f.title
    FROM actor AS a
    JOIN film_actor USING (actor_id)
    JOIN film AS f USING (film_id)
    ORDER BY a.actor_id
),
    actors_with_casts_together AS (
    SELECT
        DISTINCT
        t1.actor_id AS first_actor_id,
        t1.full_name AS first_actor,
        t1.actor_id AS second_actor_id,
        t2.full_name AS second_actor,
        t1.title,
        count(t1.title) OVER(PARTITION BY t1.full_name, t2.full_name) AS no_films
    FROM joined_tables AS t1
    FULL JOIN joined_tables AS t2 USING(film_id)
    WHERE t1.actor_id != t2.actor_id AND t1.actor_id < t2.actor_id
    GROUP BY first_actor, second_actor, t1.title, first_actor_id, second_actor_id
    ORDER BY no_films DESC
)
SELECT
    first_actor,
    second_actor,
    title
FROM  actors_with_casts_together
WHERE no_films = (SELECT max(no_films) FROM  actors_with_casts_together);


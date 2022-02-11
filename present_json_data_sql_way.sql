-- https://www.codewars.com/kata/5daf515c3affec002b2fb921/train/sql

SELECT
    users.data ->> 'first_name' AS first_name,
    users.data ->> 'last_name' AS last_name,
    extract(year from age((users.data ->> 'date_of_birth')::date)) AS age,
    CASE
        WHEN users.data ->> 'private' = 'true' THEN 'Hidden'
        WHEN json_array_length(users.data -> 'email_addresses') = 0 THEN 'None'
        ELSE users.data -> 'email_addresses' ->> 0
    END AS email_address
FROM users
ORDER BY first_name, last_name;

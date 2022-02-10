-- https://www.codewars.com/kata/582cba7d3be8ce3a8300007c/train/sql

SELECT
    s.transaction_date::date AS day,
    d.name AS department,
    count(s.id) AS sale_count
FROM department d
    JOIN sale s ON d.id = s.department_id
GROUP BY d.name, day
ORDER BY day;

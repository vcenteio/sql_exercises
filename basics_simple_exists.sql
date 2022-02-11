-- https://www.codewars.com/kata/58113a64e10b53ec36000293/train/sql

SELECT
    d.id,
    d.name
FROM departments d
WHERE EXISTS (
    SELECT 1
    FROM sales
    WHERE d.id = sales.department_id AND sales.price > 98.00
);

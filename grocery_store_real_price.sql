-- https://www.codewars.com/kata/5a8f00745084d718940000c5/train/sql

SELECT
    name,
    weight,
    price,
    CAST(ROUND((CAST(price AS numeric) / (CAST(weight AS numeric) / 1000.0)), 2) AS real) AS price_per_kg
FROM products
ORDER BY price_per_kg, name;

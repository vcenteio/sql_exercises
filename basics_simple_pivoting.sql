-- https://www.codewars.com/kata/58126aa90ea99769e7000119/train/sql

CREATE EXTENSION tablefunc;
SELECT
    ct.name,
    ct.good,
    ct.ok,
    ct.bad
FROM crosstab($$
        SELECT
            p.name,
            d.detail,
            count(d.detail)
        FROM products p JOIN details d
            ON p.id = d.product_id
        GROUP BY p.name, d.detail
        ORDER BY p.name
    $$, $$
        SELECT
            d.detail
        FROM details d
        GROUP BY d.detail
$$) AS ct(name text, ok integer, good integer, bad integer)
ORDER BY name;

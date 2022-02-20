-- https://www.codewars.com/kata/5982020284a83baf2f00001c/train/sql

-- should not contain CROSSTAB
-- should not contain CREATE EXTENSION TABLEFUNC
-- should not contain FUNCTION
-- should not contain UNDEFINED_FUNC

-- First alternative

SELECT
    p.name,
    count(d.id) filter(where d.detail = 'good') AS good,
    count(d.id) filter(where d.detail = 'ok') AS ok,
    count(d.id) filter(where d.detail = 'bad') AS bad
FROM products AS p JOIN details AS d
    ON p.id = d.product_id
GROUP BY p.name
ORDER BY p.name;


-- Second alternative

WITH product_and_details AS(
    SELECT
        p.id AS product_id,
        p.name,
        d.id AS detail_id,
        d.detail
    FROM products AS p JOIN details AS d
        ON p.id = d.product_id
)
SELECT
    pds.name,
    (SELECT count(pd.detail) FROM product_and_details AS pd WHERE pd.name = pds.name AND pd.detail = 'good') AS good,
    (SELECT count(pd.detail) FROM product_and_details AS pd WHERE pd.name = pds.name AND pd.detail = 'ok') AS ok,
    (SELECT count(pd.detail) FROM product_and_details AS pd WHERE pd.name = pds.name AND pd.detail = 'bad') AS bad
FROM product_and_details AS pds
GROUP BY pds.name
ORDER BY pds.name;



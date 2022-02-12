-- https://www.codewars.com/kata/5811527d9d278b242f000006/train/sql

CREATE VIEW departments_total_orders_gt_10k AS
    SELECT
        d.id AS id,
        sum(p.price) AS total_orders_amount
    FROM
        departments d
        JOIN sales s
            ON d.id = s.department_id
        JOIN products p
            ON p.id = s.product_id
    GROUP BY d.id
    HAVING sum(p.price) > 10000;

CREATE VIEW members_approved_for_voucher AS
    SELECT
        m.id,
        m.name,
        m.number,
        m.email,
        m.city,
        m.street_name,
        m.street_address,
        sum(p.price) AS total_spending
    FROM
        members m
        JOIN sales s
            ON m.id = s.member_id
        JOIN products p
            ON p.id = s.product_id
        JOIN departments_total_orders_gt_10k d
            ON d.id = s.department_id
    GROUP BY m.id
    HAVING sum(p.price) > 1000
    ORDER BY m.id;

SELECT
    id,
    name,
    email,
    total_spending
FROM members_approved_for_voucher;

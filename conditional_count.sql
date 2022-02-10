-- https://www.codewars.com/kata/5816a3ecf54413a113000074/train/sql

SELECT
    extract(month FROM payment_date) AS month,
    count(payment_id) AS total_count,
    sum(amount) AS total_amount,
    count(payment_id) FILTER (WHERE staff_id = 1) AS mike_count,
    sum(amount) FILTER (WHERE staff_id = 1) AS mike_amount,
    count(payment_id) FILTER (WHERE staff_id = 2) AS jon_count,
    sum(amount) FILTER (WHERE staff_id = 2) AS jon_amount
FROM payment
GROUP BY month
ORDER BY month;

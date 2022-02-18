-- https://www.codewars.com/kata/589e0837e10c4a1018000028/train/sql


SELECT
    date_trunc('month', created_at)::date AS date,
    count(created_at),
    round(
      ((count(created_at) - lag(count(created_at), 1) OVER(order by date_trunc('month', created_at)::date)) * 100)::numeric
      /
      lag(count(created_at), 1) OVER(order by date_trunc('month', created_at)::date)::numeric
    , 1) || '%' AS percent_growth
FROM posts
GROUP BY date
ORDER BY date;

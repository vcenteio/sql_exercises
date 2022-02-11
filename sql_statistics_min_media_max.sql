-- https://www.codewars.com/kata/58167fa1f544130dcf000317/train/sql

SELECT
    min(r.score),
    percentile_cont(0.50) WITHIN GROUP (ORDER BY r.score)::float AS median,
    max(r.score)
FROM result r;

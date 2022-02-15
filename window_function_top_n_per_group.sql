-- https://www.codewars.com/kata/582001237a3a630ce8000a41/train/sql

SELECT
    category_id,
    category,
    title,
    views,
    post_id
FROM (
  SELECT
      c.id AS category_id,
      c.category,
      p.title,
      p.id AS post_id,
      p.views,
      row_number() OVER(PARTITION BY p.category_id ORDER BY p.views DESC, p.id) AS rn
  FROM categories c LEFT JOIN posts p
      ON c.id = p.category_id
) numbered_posts
WHERE numbered_posts.rn < 3
ORDER BY category, views DESC, post_id
;

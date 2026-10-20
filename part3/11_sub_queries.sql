-- one query inside another query
-- the inner query runs first
-- outer query runs last
-- which posts is performing better than average
SELECT
  title,
  status,
  views
FROM
  posts
WHERE
  views > (
    SELECT
      AVG(views)
    FROM
      posts
  )
ORDER BY
  views DESC;
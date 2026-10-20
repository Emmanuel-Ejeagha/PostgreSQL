-- GROUP BY creates groups of rows
-- WHERE -> filters normal rows vbefore grouping
-- HAVING -> filters groups after grouping
-- find authors who have written atleast 2 posts
SELECT
  u.name AS author_name,
  COUNT(p.id) AS total_posts,
  SUM(p.views) AS total_views
FROM
  users AS u
  LEFT JOIN posts AS p ON u.id = p.user_id
GROUP BY
  (u.id, u.name)
HAVING
  COUNT(p.id) >= 2
ORDER BY
  total_posts DESC;
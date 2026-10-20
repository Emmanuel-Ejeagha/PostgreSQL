SELECT
  users.name AS authour_name,
  posts.title AS title,
  posts.status
FROM
  users
  INNER JOIN posts ON users.id = posts.user_id
ORDER BY
  users.name,
  posts.title
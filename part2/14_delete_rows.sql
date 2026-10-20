SELECT
  *
FROM
  products;

DELETE IF EXISTS
FROM
  products
WHERE
  id = '04929acb-2994-4680-803b-4a3d6c55475d' RETURNING *;

SELECT
  *
FROM
  products;
-- linit -> how many rows you want to return
-- offset -> how many rows you want to skip
SELECT
  name AS product_name,
  price AS product_price
FROM
  products
ORDER BY
  name ASC
LIMIT
  8;

SELECT
  *
FROM
  products
ORDER BY
  name
LIMIT
  5
OFFSET
  0;

SELECT
  *
FROM
  products
ORDER BY
  name
LIMIT
  5
OFFSET
  5;
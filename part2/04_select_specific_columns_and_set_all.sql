SELECT
  name,
  category,
  price
FROM
  products
ORDER BY
  price DESC
LIMIT
  5;

SELECT
  name AS product_name,
  category,
  stock AS stock_shortage,
  price AS selling_price
FROM
  products
WHERE
  stock < 5;
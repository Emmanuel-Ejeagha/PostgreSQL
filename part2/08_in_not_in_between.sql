-- IN -> value must match one item in from the list
-- NOT IN -> value must not match any thing from the list
-- BETWEEN value must be inside the range
SELECT
  *
FROM
  products
WHERE
  category IN ('Laptops', 'Storage')
ORDER BY
  created_at ASC,
  name ASC;

SELECT
  name AS product_name,
  category,
  price AS selling_price
FROM
  products
WHERE
  category NOT IN ('Laptops')
ORDER BY
  category ASC,
  name ASC;

SELECT
  name AS product_name,
  category,
  price AS product_price,
  description
FROM
  products
WHERE
  price BETWEEN 80 AND 200
ORDER BY
  name ASC;

SELECT
  name,
  price AS selling_price,
  stock
FROM
  products
WHERE
  category IN ('Laptops')
  AND price BETWEEN 500 AND 1000
ORDER BY
  name ASC;
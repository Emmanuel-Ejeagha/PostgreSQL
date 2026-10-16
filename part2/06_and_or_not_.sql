-- AND -> every condition must be true
-- OR -> atleast one condition must be true.
-- NOT -> reverse/exclude a condition
SELECT
  name AS product_name,
  price AS selling_price,
  stock
FROM
  products
WHERE
  (
    category = 'Laptops'
    AND stock > 0
  )
  OR (
    category = 'Accessories'
    AND stock > 0
  );

SELECT
  name AS product_name,
  category,
  price AS selling_price
FROM
  products
WHERE
  NOT category = 'Laptops';

SELECT
  name as product_name,
  category,
  price AS selling_price
FROM
  products
WHERE
  NOT category = 'Accessories';
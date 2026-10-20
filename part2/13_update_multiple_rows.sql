SELECT
  name,
  category,
  price,
  is_active
FROM
  products
WHERE
  category = 'Laptops';

UPDATE products
SET
  price = ROUND(price * 1.10, 2)
WHERE
  category = 'Laptops';

SELECT
  name,
  category,
  price,
  is_active
FROM
  products
WHERE
  category = 'Laptops';
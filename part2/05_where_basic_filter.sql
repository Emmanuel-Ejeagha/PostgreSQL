SELECT
  name AS product_name,
  category,
  price AS selling_price
FROM
  products
WHERE
  category = 'Laptops';

-- find products where the category is `Laptops` and the price is `> 500`
SELECT
  name AS product_name,
  price AS selling_price
FROM
  products
WHERE
  is_active = FALSE;
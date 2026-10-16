-- like - case sesitive pattern catch
-- ilike - case insensitive pattern match
-- % means any number of characters
-- _ exactly one character
SELECT
  name AS product_name,
  price AS selling_price
FROM
  products
WHERE
  name LIKE 'A%'
  -- OR name LIKE 'Sam%'
ORDER BY
  name ASC;

SELECT
  category,
  name AS product_name,
  price AS selling_price
FROM
  products
WHERE
  name ILIKE '%A%'
  OR description ILIKE '%G%'
ORDER BY
  category ASC,
  name ASC,
  price ASC;
SELECT
  name,
  price,
  sku
FROM
  products
WHERE
  sku IN ('LAP-HP-002');

UPDATE products
SET
  stock = 20,
  price = 310000
WHERE
  name = 'HP Pavillion';

SELECT
  name,
  price,
  stock AS inventory
FROM
  products
WHERE
  name ILIKE ('%Hp P%');

UPDATE products
SET
  stock = 10,
  price = 2000.50
WHERE
  sku = 'CMP-KNG-008';

SELECT
  name,
  stock,
  price
FROM
  products
WHERE
  sku = 'CMP-KNG-008';
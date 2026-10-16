INSERT INTO
  products (name, category, price, stock, sku, description)
VALUES
  (
    'HP Pavillion',
    'Laptops',
    20230,
    10,
    'LAP-HP-002',
    'Core i7 7th Gen, 16GB RAM, 512GB SSD'
  );

SELECT
  *
FROM
  products;

SELECT
  *
FROM
  products
WHERE
  sku = 'LAP-HP-002'
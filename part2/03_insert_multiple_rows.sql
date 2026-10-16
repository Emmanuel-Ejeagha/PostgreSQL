SELECT
  name,
  sku,
  category
FROM
  products
WHERE
  sku IN ('LAP-HP-001', 'LAP-HP-002', 'LAP-LEN-002') --search for products with 'LAP-HP-001', 'LAP-HP-002', 'LAP-LEN-002'
DROP TABLE IF EXISTS products;

CREATE EXTENSION IF NOT EXISTS pgcrypto;

CREATE TABLE
  IF NOT EXISTS products (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid (),
    name TEXT NOT NULL,
    category TEXT NOT NULL,
    price NUMERIC(10, 2) NOT NULL CHECK (price >= 0),
    stock INTEGER NOT NULL DEFAULT 0 CHECK (stock >= 0),
    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    sku TEXT UNIQUE,
    description TEXT,
    created_at TIMESTAMP NOT NULL DEFAULT NOW ()
  );

INSERT INTO
  products (
    name,
    category,
    price,
    stock,
    is_active,
    sku,
    description
  )
VALUES
  (
    'HP ZBook 15 G4',
    'Laptops',
    589.50,
    12,
    TRUE,
    'LAP-HP-001',
    'Core i7 7th Gen, 16GB RAM, 512GB SSD'
  ),
  (
    'Lenovo ThinkPad T14',
    'Laptops',
    1250.00,
    8,
    TRUE,
    'LAP-LEN-002',
    'Core i7 12th Gen, 32GB RAM, 1TB SSD'
  ),
  (
    'Dell Latitude 5420',
    'Laptops',
    849.99,
    15,
    TRUE,
    'LAP-DEL-003',
    'Core i5 11th Gen, 16GB RAM, 512GB SSD'
  ),
  (
    'Logitech MX Master 3S',
    'Accessories',
    99.99,
    25,
    TRUE,
    'ACC-LOG-004',
    'Wireless ergonomic productivity mouse'
  ),
  (
    'HP USB-C Dock G5',
    'Accessories',
    149.50,
    6,
    TRUE,
    'ACC-HP-005',
    'USB-C docking station for laptops'
  ),
  (
    'Samsung 27-inch Monitor',
    'Monitors',
    229.99,
    10,
    TRUE,
    'MON-SAM-006',
    '27-inch Full HD IPS monitor'
  ),
  (
    'LG UltraWide Monitor',
    'Monitors',
    399.00,
    4,
    TRUE,
    'MON-LG-007',
    '34-inch ultrawide productivity monitor'
  ),
  (
    'Kingston 16GB DDR4 RAM',
    'Computer Components',
    35.99,
    30,
    TRUE,
    'CMP-KNG-008',
    '16GB DDR4 laptop memory module'
  ),
  (
    'Samsung 1TB SSD',
    'Storage',
    89.50,
    20,
    TRUE,
    'STR-SAM-009',
    '1TB solid-state drive'
  ),
  (
    'Seagate 2TB External HDD',
    'Storage',
    74.99,
    18,
    TRUE,
    'STR-SEA-010',
    'Portable external USB hard drive'
  ),
  (
    'Microsoft Surface Keyboard',
    'Accessories',
    79.00,
    0,
    TRUE,
    'ACC-MIC-011',
    'Wireless keyboard for everyday productivity'
  ),
  (
    'Anker 65W USB-C Charger',
    'Accessories',
    39.99,
    40,
    TRUE,
    'ACC-ANK-012',
    'Compact 65W USB-C power adapter'
  ),
  (
    'Apple MacBook Air M2',
    'Laptops',
    999.00,
    5,
    TRUE,
    'LAP-APP-013',
    'Apple M2 laptop with 13-inch display'
  ),
  (
    'Acer Aspire 5',
    'Laptops',
    499.99,
    0,
    FALSE,
    'LAP-ACE-014',
    'Budget laptop currently unavailable'
  ),
  (
    'TP-Link Wi-Fi 6 Router',
    'Networking',
    119.99,
    14,
    TRUE,
    'NET-TPL-015',
    'Dual-band Wi-Fi 6 wireless router'
  );

SELECT
  *
FROM
  products;

SELECT
  name,
  category,
  price
FROM
  products
WHERE
  price >= 200
ORDER BY
  name DESC;
DROP TABLE IF EXISTS basics.products_basic;

CREATE TABLE
  basics.products_basic (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    stock INTEGER DEFAULT 0,
    total_view BIGINT DEFAULT 0,
    price NUMERIC(10, 2),
    is_active BOOLEAN DEFAULT TRUE
  );

INSERT INTO
  basics.products_basic (
    name,
    description,
    stock,
    total_view,
    price,
    is_active
  )
VALUES
  (
    'Hp ZBook',
    'CORE i7 7th Gen',
    350,
    345,
    589.50,
    false
  ),
  (
    'Lenovo ThinkPad',
    'CORE i7 12th Gen',
    35,
    35,
    74359.50,
    TRUE
  ),
  (
    'Dell Latitude',
    'CORE i9 10th Gen',
    30,
    359,
    5849.50,
    false
  );

SELECT
  *
FROM
  basics.products_basic;

SELECT
  id,
  name,
  price,
  is_active
FROM
  basics.products_basic;

SELECT
  name,
  price
FROM
  basics.products_basic
WHERE
  is_active;
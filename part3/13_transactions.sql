-- multiple sql statments run as one safe unit
-- e.g.  ecommerce website
-- placing an order
-- reduce the stock of the product
-- creating payment records
-- transferring money
-- creating user records with related profile data
BEGIN;

UPDATE posts
SET
  status = 'published'
WHERE
  title = 'My First Backend Project'
  AND status = 'draft';

UPDATE posts
SET
  views = views + 50
WHERE
  title = 'My First Backend Project';

SELECT
  title,
  status,
  views
FROM
  posts
WHERE
  title = 'My First Backend Project';

COMMIT;
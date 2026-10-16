DROP TABLE IF EXISTS basics.value_examples;

CREATE TABLE
  IF NOT EXISTS basics.value_examples (
    id SERIAL PRIMARY KEY,
    user_name TEXT,
    bio TEXT,
    score INTEGER
  );

INSERT INTO
  basics.value_examples (user_name, bio, score)
VALUES
  ('', 'backend developer', NULL),
  (NULL, '', 34),
  ('judx', 'teacher', NULL);

SELECT
  *
FROM
  basics.value_examples;

SELECT
  *
FROM
  basics.value_examples
WHERE
  user_name is NULL;

SELECT
  *
FROM
  basics.value_examples
WHERE
  user_name IS NOT NULL;
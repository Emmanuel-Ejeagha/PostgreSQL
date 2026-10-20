CREATE EXTENSION IF NOT EXISTS pgcrypto;

CREATE TABLE
  IF NOT EXISTS users (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid (),
    name VARCHAR(100) NOT NULL
  );

CREATE TABLE
  IF NOT EXISTS posts (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid (),
    user_id UUID NOT NULL REFERENCES users (id),
    title TEXT NOT NULL,
    status TEXT NOT NULL DEFAULT 'draft' CHECK (status IN ('draft', 'published')),
    views INTEGER NOT NULL DEFAULT 0 CHECK (views >= 0)
  );

CREATE TABLE
  IF NOT EXISTS comments (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid (),
    post_id UUID NOT NULL REFERENCES posts (id),
    body TEXT NOT NULL
  );

CREATE TABLE
  IF NOT EXISTS tags (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid (),
    name TEXT NOT NULL UNIQUE
  );

CREATE TABLE
  post_tags (
    post_id UUID NOT NULL REFERENCES posts (id),
    tag_id UUID NOT NULL REFERENCES tags (id),
    PRIMARY KEY (post_id, tag_id)
  );

INSERT INTO
  users (name)
VALUES
  ('Emmanuel Ejeagha'),
  ('Ada Okafor'),
  ('Chinedu Obi'),
  ('Fatima Bello');

INSERT INTO
  posts (user_id, title, status, views)
VALUES
  (
    (
      SELECT
        id
      FROM
        users
      WHERE
        name = 'Emmanuel Ejeagha'
    ),
    'Getting Started with PostgreSQL',
    'published',
    1250
  ),
  (
    (
      SELECT
        id
      FROM
        users
      WHERE
        name = 'Emmanuel Ejeagha'
    ),
    'Understanding UUIDs in Databases',
    'draft',
    0
  ),
  (
    (
      SELECT
        id
      FROM
        users
      WHERE
        name = 'Ada Okafor'
    ),
    'Introduction to REST APIs',
    'published',
    860
  ),
  (
    (
      SELECT
        id
      FROM
        users
      WHERE
        name = 'Ada Okafor'
    ),
    'API Authentication Best Practices',
    'published',
    2140
  ),
  (
    (
      SELECT
        id
      FROM
        users
      WHERE
        name = 'Chinedu Obi'
    ),
    'Learning Python for Beginners',
    'published',
    970
  ),
  (
    (
      SELECT
        id
      FROM
        users
      WHERE
        name = 'Chinedu Obi'
    ),
    'My First Backend Project',
    'draft',
    0
  ),
  (
    (
      SELECT
        id
      FROM
        users
      WHERE
        name = 'Fatima Bello'
    ),
    'Introduction to Database Design',
    'published',
    1580
  ),
  (
    (
      SELECT
        id
      FROM
        users
      WHERE
        name = 'Fatima Bello'
    ),
    'SQL Joins Explained',
    'draft',
    0
  );

INSERT INTO
  comments (post_id, body)
VALUES
  (
    (
      SELECT
        id
      FROM
        posts
      WHERE
        title = 'Getting Started with PostgreSQL'
    ),
    'Very helpful introduction. Thank you!'
  ),
  (
    (
      SELECT
        id
      FROM
        posts
      WHERE
        title = 'Getting Started with PostgreSQL'
    ),
    'Could you explain indexes in a future post?'
  ),
  (
    (
      SELECT
        id
      FROM
        posts
      WHERE
        title = 'Introduction to REST APIs'
    ),
    'The examples made APIs much easier to understand.'
  ),
  (
    (
      SELECT
        id
      FROM
        posts
      WHERE
        title = 'API Authentication Best Practices'
    ),
    'Security is so important when building APIs.'
  ),
  (
    (
      SELECT
        id
      FROM
        posts
      WHERE
        title = 'Learning Python for Beginners'
    ),
    'I am starting my Python journey this week.'
  ),
  (
    (
      SELECT
        id
      FROM
        posts
      WHERE
        title = 'Introduction to Database Design'
    ),
    'Please write more about database normalization.'
  ),
  (
    (
      SELECT
        id
      FROM
        posts
      WHERE
        title = 'SQL Joins Explained'
    ),
    'Looking forward to the next lesson!'
  );

INSERT INTO
  tags (name)
VALUES
  ('PostgreSQL'),
  ('SQL'),
  ('Backend Development'),
  ('REST API'),
  ('Python'),
  ('Database Design'),
  ('Security'),
  ('Beginner Tutorial');

INSERT INTO
  post_tags (post_id, tag_id)
VALUES
  (
    (
      SELECT
        id
      FROM
        posts
      WHERE
        title = 'Getting Started with PostgreSQL'
    ),
    (
      SELECT
        id
      FROM
        tags
      WHERE
        name = 'PostgreSQL'
    )
  ),
  (
    (
      SELECT
        id
      FROM
        posts
      WHERE
        title = 'Getting Started with PostgreSQL'
    ),
    (
      SELECT
        id
      FROM
        tags
      WHERE
        name = 'SQL'
    )
  ),
  (
    (
      SELECT
        id
      FROM
        posts
      WHERE
        title = 'Getting Started with PostgreSQL'
    ),
    (
      SELECT
        id
      FROM
        tags
      WHERE
        name = 'Beginner Tutorial'
    )
  ),
  (
    (
      SELECT
        id
      FROM
        posts
      WHERE
        title = 'Understanding UUIDs in Databases'
    ),
    (
      SELECT
        id
      FROM
        tags
      WHERE
        name = 'Database Design'
    )
  ),
  (
    (
      SELECT
        id
      FROM
        posts
      WHERE
        title = 'Introduction to REST APIs'
    ),
    (
      SELECT
        id
      FROM
        tags
      WHERE
        name = 'REST API'
    )
  ),
  (
    (
      SELECT
        id
      FROM
        posts
      WHERE
        title = 'Introduction to REST APIs'
    ),
    (
      SELECT
        id
      FROM
        tags
      WHERE
        name = 'Backend Development'
    )
  ),
  (
    (
      SELECT
        id
      FROM
        posts
      WHERE
        title = 'API Authentication Best Practices'
    ),
    (
      SELECT
        id
      FROM
        tags
      WHERE
        name = 'Security'
    )
  ),
  (
    (
      SELECT
        id
      FROM
        posts
      WHERE
        title = 'Learning Python for Beginners'
    ),
    (
      SELECT
        id
      FROM
        tags
      WHERE
        name = 'Python'
    )
  ),
  (
    (
      SELECT
        id
      FROM
        posts
      WHERE
        title = 'My First Backend Project'
    ),
    (
      SELECT
        id
      FROM
        tags
      WHERE
        name = 'Backend Development'
    )
  ),
  (
    (
      SELECT
        id
      FROM
        posts
      WHERE
        title = 'Introduction to Database Design'
    ),
    (
      SELECT
        id
      FROM
        tags
      WHERE
        name = 'Database Design'
    )
  ),
  (
    (
      SELECT
        id
      FROM
        posts
      WHERE
        title = 'SQL Joins Explained'
    ),
    (
      SELECT
        id
      FROM
        tags
      WHERE
        name = 'SQL'
    )
  );

-- Count records in each table
SELECT
  COUNT(*) AS total_users
FROM
  users;

SELECT
  COUNT(*) AS total_posts
FROM
  posts;

SELECT
  COUNT(*) AS total_comments
FROM
  comments;

SELECT
  COUNT(*) AS total_tags
FROM
  tags;

SELECT
  COUNT(*) AS total_post_tags
FROM
  post_tags;

-- View posts with their authors
SELECT
  p.title,
  u.name AS author,
  p.status,
  p.views
FROM
  posts p
  JOIN users u ON p.user_id = u.id
ORDER BY
  u.name,
  p.title;

-- View posts with their tags
SELECT
  p.title,
  t.name AS tag
FROM
  post_tags pt
  JOIN posts p ON pt.post_id = p.id
  JOIN tags t ON pt.tag_id = t.id
ORDER BY
  p.title,
  t.name;
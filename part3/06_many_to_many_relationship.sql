-- one post can have multiple tags
-- one tag can be asso iated with multiple posts
-- post.id === post_tags.post-id
-- tags.id === post_tags.tag_id
SELECT
  posts.title AS post_title,
  tag.name AS tag_name
FROM
  posts
  INNER JOIN post_tags ON posts.id = posts_tag.post_id
  INNER JOIN tags ON post_tags.tag_id = tags.id
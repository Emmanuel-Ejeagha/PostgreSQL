# PostgreSQL Learning Series

Hands-on PostgreSQL practice covering database fundamentals through core SQL querying, relationships, joins, and data manipulation — from creating databases and schemas to filtering with `WHERE`, `LIKE`, `IN`, and advanced `JOIN` operations.

## Prerequisites

- PostgreSQL 14+
- `psql` CLI or a client like pgAdmin / DBeaver

## Getting Started

```bash
# Clone the repo
git clone https://github.com/Emmanuel-Ejeagha/PostgreSQL.git
cd PostgreSQL

# Run Part 1 scripts (creates databases, schemas, tables in `basics`)
psql -U postgres -f part1/01-first_database.sql
psql -U postgres -d postgresql_part1 -f part1/02-first_schema.sql
psql -U postgres -d postgresql_part1 -f part1/03_first_table.sql

# Load the base products table for Part 2
psql -U postgres -d postgresql_part1 -f part2/01_sql_concepts_base_file.sql
```

Run Part 3 after Part 2 (sets up `users`, `posts`, `comments`, `tags` with relationships):

```bash
psql -U postgres -d postgresql_part1 -f part3/01_reset_and_seed_relationships.sql
```

## Repository Structure

```
PostgreSQL/
├── part1/   # Database fundamentals: databases, schemas, tables, data types
├── part2/   # DML & querying: INSERT, SELECT, WHERE, AND/OR/NOT, LIKE, IN, pagination, UPDATE, DELETE
├── part3/   # Relationships & joins: UUID PKs, foreign keys, one-to-many, inner/left join, aggregates
└── README.md
```

### Part 1 — Fundamentals (`basics` schema)

| File | Covers |
| ---- | ------ |
| `part1/01-first_database.sql` | `CREATE DATABASE`, `DROP DATABASE IF EXISTS` |
| `part1/02-first_schema.sql` | `CREATE SCHEMA`, `pgcrypto` extension, `information_schema` |
| `part1/03_first_table.sql` | `CREATE TABLE`, `SERIAL PK`, `UNIQUE`, `CHECK`, `DEFAULT NOW()` |
| `part1/04_data_types.sql` | `VARCHAR`, `TEXT`, `INT`, `BIGINT`, `NUMERIC(10,2)`, `BOOLEAN` |
| `part1/05_other_data_types.sql` | `UUID` + `gen_random_uuid()`, `JSONB`, `->` / `->>` operators, `?` existence |
| `part1/06_null_empty_string_zero.sql` | `NULL` vs `''` vs `0`, `IS NULL` / `IS NOT NULL` |

### Part 2 — DML & Filtering (`products` table)

| File | Covers |
| ---- | ------ |
| `part2/01_sql_concepts_base_file.sql` | Base `products` table (UUID PK, constraints, seed data), `ORDER BY`, `LIMIT` |
| `part2/02_insert_single_row.sql` | Single-row `INSERT INTO ... VALUES` |
| `part2/03_insert_multiple_rows.sql` | Multi-row insert / lookup with `IN (...)` |
| `part2/04_select_specific_columns_and_set_all.sql` | Column projection, aliases (`AS`), `ORDER BY ... DESC`, `LIMIT` |
| `part2/05_where_basic_filter.sql` | Basic `WHERE` equality filtering |
| `part2/06_and_or_not_.sql` | `AND` / `OR` / `NOT` combinations with parentheses |
| `part2/07_like_ilike_patterns.sql` | `LIKE` (case-sensitive) vs `ILIKE` (case-insensitive), `%` and `_` wildcards |
| `part2/08_in_not_in_between.sql` | `IN` / `NOT IN` / `BETWEEN` (in progress) |
| `part2/11_limit_offset_pagination.sql` | `LIMIT` and `OFFSET` for pagination |
| `part2/12_update_single_roll.sql` | Single-row `UPDATE` by name/SKU, `ILIKE` filtering |
| `part2/13_update_multiple_rows.sql` | Bulk `UPDATE` with arithmetic (`price * 1.10`), `ROUND` |
| `part2/14_delete_rows.sql` | `DELETE` by UUID primary key |

### Part 3 — Relationships & Joins ( `users`, `posts`, `comments`, `tags` )

| File | Covers |
| ---- | ------ |
| `part3/01_reset_and_seed_relationships.sql` | Tables with UUID PKs, foreign keys, `INSERT` seed data, sample queries |
| `part3/02_foreign_keys.sql` | Foreign key references `users(id) → posts.user_id` |
| `part3/03_one_to_many_relationship.sql` | `INNER JOIN` users → posts |
| `part3/04_inner_join.sql` | `INNER JOIN` with `WHERE status = 'published'`, ordered by views |
| `part3/05_left_join.sql` | `LEFT JOIN` posts → comments, keeping all posts even without comments |
| `part3/06_many_to_many_relationship.sql` | `post_tags` junction table, many-to-many between posts and tags |
| `part3/07_table_aliases.sql` | Alias usage in joins and projections |
| `part3/08_aggregate_functions.sql` | `COUNT`, `SUM`, `AVG`, `MAX`, `MIN` |
| `part3/09_group_by.sql` | `GROUP BY` with aggregate functions |
| `part3/10_count_distinct.sql` | `COUNT(DISTINCT ...)` |
| `part3/11_sub_queries.sql` | Nested `SELECT` in `WHERE`, `FROM`, and `INSERT` |
| `part3/12_indexes.sql` | `CREATE INDEX`, `EXPLAIN` analysis |
| `part3/13_transactions.sql` | `BEGIN`, `COMMIT`, `ROLLBACK`, savepoints |

## Key Concepts

- **Schema-first design:** `basics.students`, `basics.products_basic`, `basics.app_events`, `public.users/public.posts`
- **Constraints:** `PRIMARY KEY`, `UNIQUE`, `NOT NULL`, `CHECK (age >= 18)`, `DEFAULT`, `IN ('draft','published')`
- **Modern types:** `UUID` primary keys via `pgcrypto`, semi-structured `JSONB`, `->` / `->>` operators
- **Query patterns:** projection → filtering → sorting → limiting → joining → aggregating
- **Pagination:** `LIMIT ... OFFSET ...`
- **Updates & Deletes:** single-row by name/SKU, bulk by category, by UUID primary key
- **Join types:** `INNER JOIN` (matching only), `LEFT JOIN` (all left, matching right or NULL)
- **Normalization:** 1:M via foreign key, M:N via junction table `post_tags`

## Conventions

- One concept per file, numbered for execution order (`01_`, `02_`, …)
- `DROP TABLE IF EXISTS` / `CREATE TABLE IF NOT EXISTS` for safe re-runs
- Files are idempotent where possible (`IF NOT EXISTS`, `DEFAULT` values)
- Seed data uses consistent naming and includes author names

## Author

**Emmanuel Ejeagha** — [GitHub](https://github.com/Emmanuel-Ejeagha)
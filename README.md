# PostgreSQL Learning Series

Hands-on PostgreSQL practice covering database fundamentals through core SQL querying — from creating databases and schemas to filtering with `WHERE`, `LIKE`, and `IN`.

## Prerequisites

- PostgreSQL 14+
- `psql` CLI or a client like pgAdmin / DBeaver

## Getting Started

```bash
# Clone the repo
git clone https://github.com/Emmanuel-Ejeagha/PostgreSQL.git
cd PostgreSQL

# Run scripts in order with psql
psql -U postgres -f part1/01-first_database.sql
psql -U postgres -d postgresql_part1 -f part1/02-first_schema.sql
psql -U postgres -d postgresql_part1 -f part1/03_first_table.sql
```

Run Part 2 against any database after loading the base `products` table:

```bash
psql -U postgres -d postgresql_part1 -f part2/01_sql_concepts_base_file.sql
```

## Repository Structure

```
PostgreSQL/
├── part1/   # Database fundamentals: databases, schemas, tables, data types
├── part2/   # DML & querying: INSERT, SELECT, WHERE, AND/OR/NOT, LIKE, IN
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

## Key Concepts

- **Schema-first design:** `basics.students`, `basics.products_basic`, `basics.app_events`
- **Constraints:** `PRIMARY KEY`, `UNIQUE`, `NOT NULL`, `CHECK (age >= 18)`, `DEFAULT`
- **Modern types:** `UUID` primary keys via `pgcrypto`, semi-structured `JSONB`
- **Query patterns:** projection → filtering → sorting → limiting

## Conventions

- One concept per file, numbered for execution order (`01_`, `02_`, …)
- `DROP TABLE IF EXISTS` before `CREATE` for safe re-runs
- Files are idempotent where possible (`IF NOT EXISTS`)

## Author

**Emmanuel Ejeagha** — [GitHub](https://github.com/Emmanuel-Ejeagha)

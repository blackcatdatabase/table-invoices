# 📦 Invoices

![SQL](https://img.shields.io/badge/SQL-MySQL%208.0%2B-4479A1?logo=mysql&logoColor=white) ![License](https://img.shields.io/badge/license-BlackCat%20Proprietary-red) ![Status](https://img.shields.io/badge/status-stable-informational) ![Generated](https://img.shields.io/badge/generated-from%20schema--map-blue)

<!-- Auto-generated from schema-map.psd1 @ 1e83bb6 (2025-10-21T10:18:36+02:00) -->

> Schema package for table **invoices** (repo: `invoices`).

## Files
```
schema/
  001_table.sql
  # (no deferred indexes declared in map)
  030_foreign_keys.sql
```

## Quick apply
```bash
# Apply schema (Linux/macOS):
mysql -h "$DB_HOST" -u "$DB_USER" -p"$DB_PASS" "$DB_NAME" < schema/001_table.sql
mysql -h "$DB_HOST" -u "$DB_USER" -p"$DB_PASS" "$DB_NAME" < schema/030_foreign_keys.sql
```

```powershell
# Apply schema (Windows PowerShell):
mysql -h $env:DB_HOST -u $env:DB_USER -p$env:DB_PASS $env:DB_NAME < schema/001_table.sql
mysql -h $env:DB_HOST -u $env:DB_USER -p$env:DB_PASS $env:DB_NAME < schema/030_foreign_keys.sql
```

## Docker quickstart
```bash
# Spin up a throwaway MySQL and apply just this package:
docker run --rm -e MYSQL_ROOT_PASSWORD=root -e MYSQL_DATABASE=app -p 3307:3306 -d mysql:8
sleep 15
mysql -h 127.0.0.1 -P 3307 -u root -proot app < schema/001_table.sql
mysql -h 127.0.0.1 -P 3307 -u root -proot app < schema/030_foreign_keys.sql
```

## Columns
| Column | Type | Null | Default | Extra |
|-------:|:-----|:----:|:--------|:------|
| id | BIGINT UNSIGNED | — | — | AUTO_INCREMENT, PK |
| order_id | BIGINT UNSIGNED | YES | — |  |
| invoice_number | VARCHAR(100) | NO | — |  |
| variable_symbol | VARCHAR(50) | YES | — |  |
| issue_date | DATE | NO | — |  |
| due_date | DATE | YES | — |  |
| subtotal | DECIMAL(12,2) | NO | — |  |
| discount_total | DECIMAL(12,2) | NO | — |  |
| tax_total | DECIMAL(12,2) | NO | — |  |
| total | DECIMAL(12,2) | NO | — |  |
| currency | CHAR(3) | NO | — |  |
| qr_data | LONGTEXT | YES | — |  |
| created_at | DATETIME(6) | NO | CURRENT_TIMESTAMP(6) |  |

## Relationships
- FK → **orders** via (order_id) (ON DELETE SET NULL).

```mermaid
erDiagram
  INVOICES {
    INT id PK
    INT order_id
    VARCHAR invoice_number
    VARCHAR variable_symbol
    DATETIME issue_date
    DATETIME due_date
    DECIMAL subtotal
    DECIMAL discount_total
    DECIMAL tax_total
    DECIMAL total
    VARCHAR currency
    VARCHAR qr_data
    DATETIME created_at
  }
  INVOICES }o--|| ORDERS : "order_id"
```

## Indexes
- No deferred indexes declared for this table.

## Notes
- Generated from the umbrella repository **blackcat-database** using `scripts/schema-map.psd1`.
- To change the schema, update the map and re-run the generators.

## License
Distributed under the **BlackCat Store Proprietary License v1.0**. See `LICENSE`.

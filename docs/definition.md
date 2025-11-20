<!-- Auto-generated from schema-map-postgres.psd1 @ 62c9c93 (2025-11-20T21:38:11+01:00) -->
# Definition – invoices

Issued invoices linked to orders. invoice_number is UNIQUE.

## Columns
| Column | Type | Null | Default | Description | Notes |
|-------:|:-----|:----:|:--------|:------------|:------|
| id | BIGINT | — | AS | Surrogate primary key. |  |
| tenant_id | BIGINT | NO | — |  |  |
| order_id | BIGINT | YES | — | Order (FK orders.id), optional. |  |
| invoice_number | VARCHAR(100) | NO | — | Unique invoice number (UNIQUE). |  |
| variable_symbol | VARCHAR(50) | YES | — | Local payment identifier/VS. |  |
| issue_date | DATE | NO | — | Issue date. |  |
| due_date | DATE | YES | — | Due date (optional). |  |
| subtotal | NUMERIC(12,2) | NO | — | Subtotal excl. discounts & tax. |  |
| discount_total | NUMERIC(12,2) | NO | — | Total discount amount. |  |
| tax_total | NUMERIC(12,2) | NO | — | Total tax amount. |  |
| total | NUMERIC(12,2) | NO | — | Grand total. |  |
| currency | CHAR(3) | NO | — | ISO 4217 currency code. |  |
| qr_data | TEXT | YES | — | Encoded payment data (string/QR). |  |
| created_at | TIMESTAMPTZ(6) | NO | CURRENT_TIMESTAMP(6) | Creation timestamp (UTC). |  |
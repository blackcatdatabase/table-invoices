# Definition – invoices

Issued invoices linked to orders.

## Columns
| Column | Type | Null | Default | Description | Notes |
|-------:|:-----|:----:|:--------|:------------|:------|
| id | BIGINT UNSIGNED | — | — | Surrogate primary key. |  |
| order_id | BIGINT UNSIGNED | YES | — | Order (FK orders.id), optional. |  |
| invoice_number | VARCHAR(100) | NO | — | Unique invoice number. |  |
| variable_symbol | VARCHAR(50) | YES | — | Local payment identifier/VS. |  |
| issue_date | DATE | NO | — | Issue date. |  |
| due_date | DATE | YES | — | Due date (optional). |  |
| subtotal | DECIMAL(12,2) | NO | — | Subtotal excl. discounts & tax. |  |
| discount_total | DECIMAL(12,2) | NO | — | Total discount amount. |  |
| tax_total | DECIMAL(12,2) | NO | — | Total tax amount. |  |
| total | DECIMAL(12,2) | NO | — | Grand total. |  |
| currency | CHAR(3) | NO | — | ISO 4217 currency code. |  |
| qr_data | LONGTEXT | YES | — | Encoded payment data (string/QR). |  |
| created_at | DATETIME(6) | NO | CURRENT_TIMESTAMP(6) | Creation timestamp (UTC). |  |

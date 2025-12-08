# invoices

Issued invoices linked to orders. invoice_number is UNIQUE.

## Columns
| Column | Type | Null | Default | Description |
| --- | --- | --- | --- | --- |
| created_at | DATETIME(6) | NO | CURRENT_TIMESTAMP(6) | Creation timestamp (UTC). |
| currency | CHAR(3) | NO |  | ISO 4217 currency code. |
| discount_total | DECIMAL(12,2) | NO |  | Total discount amount. |
| due_date | DATE | YES |  | Due date (optional). |
| id | BIGINT | NO |  | Surrogate primary key. |
| invoice_number | VARCHAR(100) | NO |  | Unique invoice number (UNIQUE). |
| issue_date | DATE | NO |  | Issue date. |
| order_id | BIGINT | YES |  | Order (FK orders.id), optional. |
| qr_data | LONGTEXT | YES |  | Encoded payment data (string/QR). |
| subtotal | DECIMAL(12,2) | NO |  | Subtotal excl. discounts & tax. |
| tax_total | DECIMAL(12,2) | NO |  | Total tax amount. |
| total | DECIMAL(12,2) | NO |  | Grand total. |
| variable_symbol | VARCHAR(50) | YES |  | Local payment identifier/VS. |

## Engine Details

### mysql

Unique keys:
| Name | Columns |
| --- | --- |
| ux_invoices_tenant_id | tenant_id, id |
| ux_invoices_tenant_no | tenant_id, invoice_number |

Indexes:
| Name | Columns | SQL |
| --- | --- | --- |
| idx_invoices_tenant_order | tenant_id,order_id | INDEX idx_invoices_tenant_order (tenant_id, order_id) |
| ux_invoices_tenant_id | tenant_id,id | UNIQUE KEY ux_invoices_tenant_id (tenant_id, id) |
| ux_invoices_tenant_no | tenant_id,invoice_number | UNIQUE KEY ux_invoices_tenant_no (tenant_id, invoice_number) |

Foreign keys:
| Name | Columns | References | Actions |
| --- | --- | --- | --- |
| fk_invoices_order | tenant_id,order_id | orders(tenant_id,id) | ON DELETE RESTRICT |
| fk_invoices_tenant | tenant_id | tenants(id) | ON DELETE RESTRICT |

### postgres

Unique keys:
| Name | Columns |
| --- | --- |
| ux_invoices_tenant_id | tenant_id, id |
| ux_invoices_tenant_no | tenant_id, invoice_number |

Indexes:
| Name | Columns | SQL |
| --- | --- | --- |
| idx_invoices_tenant_order | tenant_id,order_id | CREATE INDEX IF NOT EXISTS idx_invoices_tenant_order ON invoices (tenant_id, order_id) |
| ux_invoices_tenant_id | tenant_id,id | CREATE UNIQUE INDEX IF NOT EXISTS ux_invoices_tenant_id ON invoices (tenant_id, id) |
| ux_invoices_tenant_no | tenant_id,invoice_number | CREATE UNIQUE INDEX IF NOT EXISTS ux_invoices_tenant_no ON invoices (tenant_id, invoice_number) |

Foreign keys:
| Name | Columns | References | Actions |
| --- | --- | --- | --- |
| fk_invoices_order | tenant_id,order_id | orders(tenant_id,id) | ON DELETE RESTRICT |
| fk_invoices_tenant | tenant_id | tenants(id) | ON DELETE RESTRICT |

## Engine differences

## Views
| View | Engine | Flags | File |
| --- | --- | --- | --- |
| vw_invoices | mysql | algorithm=MERGE, security=INVOKER | [schema\040_views.mysql.sql](schema\040_views.mysql.sql) |
| vw_invoices_with_items | mysql | algorithm=TEMPTABLE, security=INVOKER | [schema\040_views_joins.mysql.sql](schema\040_views_joins.mysql.sql) |
| vw_invoices | postgres |  | [schema\040_views.postgres.sql](schema\040_views.postgres.sql) |
| vw_invoices_with_items | postgres |  | [schema\040_views_joins.postgres.sql](schema\040_views_joins.postgres.sql) |

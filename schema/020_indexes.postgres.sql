-- Auto-generated from schema-map-postgres.yaml (map@sha1:FAEA49A5D5F8FAAD9F850D0F430ED451C5C1D707)
-- engine: postgres
-- table:  invoices

CREATE UNIQUE INDEX IF NOT EXISTS ux_invoices_tenant_no ON invoices (tenant_id, invoice_number);

CREATE INDEX IF NOT EXISTS idx_invoices_tenant_order ON invoices (tenant_id, order_id);

CREATE UNIQUE INDEX IF NOT EXISTS ux_invoices_tenant_id ON invoices (tenant_id, id);

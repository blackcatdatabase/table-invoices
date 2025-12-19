-- Auto-generated from schema-map-postgres.yaml (map@sha1:8C4F2BC1C4D22EE71E27B5A7968C71E32D8D884D)
-- engine: postgres
-- table:  invoices

CREATE UNIQUE INDEX IF NOT EXISTS ux_invoices_tenant_no ON invoices (tenant_id, invoice_number);

CREATE INDEX IF NOT EXISTS idx_invoices_tenant_order ON invoices (tenant_id, order_id);

CREATE UNIQUE INDEX IF NOT EXISTS ux_invoices_tenant_id ON invoices (tenant_id, id);

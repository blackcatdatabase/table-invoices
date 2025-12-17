-- Auto-generated from schema-map-postgres.yaml (map@sha1:621FDD3D99B768B6A8AD92061FB029414184F4B3)
-- engine: postgres
-- table:  invoices

CREATE UNIQUE INDEX IF NOT EXISTS ux_invoices_tenant_no ON invoices (tenant_id, invoice_number);

CREATE INDEX IF NOT EXISTS idx_invoices_tenant_order ON invoices (tenant_id, order_id);

CREATE UNIQUE INDEX IF NOT EXISTS ux_invoices_tenant_id ON invoices (tenant_id, id);

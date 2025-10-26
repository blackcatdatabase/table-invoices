-- Auto-generated from schema-map-postgres.psd1 (map@38d5403)
-- engine: postgres
-- table:  invoices
ALTER TABLE invoices ADD CONSTRAINT fk_invoices_order FOREIGN KEY (order_id) REFERENCES orders(id) ON DELETE SET NULL;

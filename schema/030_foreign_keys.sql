-- Auto-generated from schema-map.psd1 (map@6cefe8e)
-- table: invoices
ALTER TABLE invoices ADD CONSTRAINT fk_invoices_order FOREIGN KEY (order_id) REFERENCES orders(id) ON DELETE SET NULL;

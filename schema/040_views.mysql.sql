-- Auto-generated from schema-views-mysql.psd1 (map@38d5403)
-- engine: mysql
-- table:  invoices
-- Contract view for [invoices]
CREATE OR REPLACE SQL SECURITY INVOKER VIEW vw_invoices AS
SELECT
  id,
  order_id,
  invoice_number,
  variable_symbol,
  issue_date,
  due_date,
  subtotal,
  discount_total,
  tax_total,
  total,
  currency,
  qr_data,
  created_at
FROM invoices;

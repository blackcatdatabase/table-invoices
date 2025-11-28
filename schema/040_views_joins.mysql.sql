-- Auto-generated from joins-mysql.psd1 (map@mtime:2025-11-27T17:49:37Z)
-- engine: mysql
-- view:   invoices_with_items
-- Invoices with item count and summed lines
CREATE OR REPLACE ALGORITHM=TEMPTABLE SQL SECURITY INVOKER VIEW vw_invoices_with_items AS
SELECT
  i.id,
  i.tenant_id,
  i.order_id,
  i.invoice_number,
  i.total,
  i.currency,
  i.issue_date,
  i.due_date,
  COUNT(ii.id) AS items_count,
  SUM(ii.line_total) AS items_total
FROM invoices i
LEFT JOIN invoice_items ii
  ON ii.invoice_id = i.id AND ii.tenant_id = i.tenant_id
GROUP BY i.id, i.tenant_id, i.order_id, i.invoice_number, i.total, i.currency, i.issue_date, i.due_date;

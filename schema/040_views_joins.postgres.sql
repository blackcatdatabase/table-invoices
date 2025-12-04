-- Auto-generated from joins-postgres.yaml (map@85230ed)
-- engine: postgres
-- view:   invoices_with_items

-- Invoices with item count and summed lines
CREATE OR REPLACE VIEW vw_invoices_with_items AS
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

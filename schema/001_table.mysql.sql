-- Auto-generated from schema-map-mysql.yaml (map@sha1:0D716345C0228A9FD8972A3D31574000D05317DB)
-- engine: mysql
-- table:  invoices

CREATE TABLE IF NOT EXISTS invoices (
  id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  tenant_id BIGINT UNSIGNED NOT NULL,
  order_id BIGINT UNSIGNED NULL,
  invoice_number VARCHAR(100) NOT NULL,
  variable_symbol VARCHAR(50) NULL,
  issue_date DATE NOT NULL,
  due_date DATE NULL,
  subtotal DECIMAL(12,2) NOT NULL,
  discount_total DECIMAL(12,2) NOT NULL,
  tax_total DECIMAL(12,2) NOT NULL,
  total DECIMAL(12,2) NOT NULL,
  currency CHAR(3) NOT NULL,
  qr_data LONGTEXT NULL,
  created_at DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  CONSTRAINT chk_invoices_nonneg CHECK (subtotal >= 0 AND discount_total >= 0 AND tax_total >= 0 AND total >= 0),
  CONSTRAINT chk_invoices_total_eq CHECK (total = subtotal - discount_total + tax_total),
  CONSTRAINT chk_invoices_currency CHECK (currency REGEXP '^[A-Z]{3}$'),
  UNIQUE KEY ux_invoices_tenant_no (tenant_id, invoice_number),
  INDEX idx_invoices_tenant_order (tenant_id, order_id),
  UNIQUE KEY ux_invoices_tenant_id (tenant_id, id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS online_sales_orders;
CREATE TABLE online_sales_orders (
  id INT AUTO_INCREMENT PRIMARY KEY,   
  order_id VARCHAR(20) NOT NULL,       
  order_date DATE NOT NULL,
  product_id VARCHAR(20),
  amount DECIMAL(10,2) NOT NULL
);

INSERT INTO online_sales_orders (order_id, order_date, product_id, amount) VALUES
('ORD001','2024-01-05','P001', 150.00),
('ORD001','2024-01-05','P002',  50.00),
('ORD002','2024-01-15','P003', 120.00),
('ORD003','2024-02-02','P001', 200.00),
('ORD004','2024-02-20','P004',  75.50),
('ORD005','2024-03-10','P005', 300.00),
('ORD006','2024-03-18','P002',  35.00),
('ORD007','2024-04-01','P006',  99.99),
('ORD008','2024-04-15','P007', 250.00),
('ORD009','2024-05-05','P001',  60.00),
('ORD010','2024-05-21','P008', 180.00),
('ORD011','2024-06-03','P009', 220.00),
('ORD012','2024-06-25','P010',  40.00),
('ORD013','2024-07-07','P001', 125.00),
('ORD014','2024-07-18','P011', 210.00),
('ORD015','2024-08-09','P012', 480.00),
('ORD016','2024-08-19','P002',  55.00),
('ORD017','2024-09-12','P013', 330.00),
('ORD018','2024-09-25','P014',  95.00),
('ORD019','2024-10-02','P015', 140.00),
('ORD020','2024-10-31','P016', 260.00),
('ORD021','2024-11-11','P001',  70.00),
('ORD022','2024-11-27','P017', 150.00),
('ORD023','2024-12-05','P018', 400.00),
('ORD024','2025-01-08','P019', 210.00),
('ORD025','2025-01-22','P020',  75.00),
('ORD026','2025-02-14','P001', 160.00),
('ORD027','2025-02-28','P021', 120.00),
('ORD028','2025-03-07','P022', 290.00),
('ORD029','2025-03-20','P023',  35.00);

SELECT
  YEAR(order_date) AS year,
  MONTH(order_date) AS month,
  SUM(amount) AS total_revenue,
  COUNT(DISTINCT order_id) AS order_volume,
  COUNT(*) AS total_line_items,             -- optional: total rows (line items)
  ROUND( SUM(amount) / NULLIF(COUNT(DISTINCT order_id),0), 2 ) AS avg_order_value
FROM online_sales_orders
GROUP BY YEAR(order_date), MONTH(order_date)
ORDER BY YEAR(order_date), MONTH(order_date);

SELECT
  YEAR(order_date) AS year,
  MONTH(order_date) AS month,
  SUM(amount) AS total_revenue,
  COUNT(DISTINCT order_id) AS order_volume
FROM online_sales_orders
WHERE order_date BETWEEN '2024-01-01' AND '2024-12-31'
GROUP BY YEAR(order_date), MONTH(order_date)
ORDER BY YEAR(order_date), MONTH(order_date);

SELECT
  YEAR(order_date) AS year,
  MONTH(order_date) AS month,
  SUM(amount) AS total_revenue
FROM online_sales_orders
GROUP BY YEAR(order_date), MONTH(order_date)
ORDER BY total_revenue DESC
LIMIT 3;

SELECT
  YEAR(order_date) AS year,
  MONTH(order_date) AS month,
  SUM(amount) AS total_revenue,
  COUNT(DISTINCT order_id) AS order_volume
FROM online_sales_orders
GROUP BY YEAR(order_date), MONTH(order_date)
ORDER BY YEAR(order_date), MONTH(order_date);

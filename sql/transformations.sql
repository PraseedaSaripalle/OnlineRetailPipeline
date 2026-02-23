USE retail_pipeline;

-- Create clean fact table
CREATE TABLE fact_sales AS
SELECT
    InvoiceNo AS invoice_no,
    StockCode AS stock_code,
    Quantity AS quantity,
    UnitPrice AS unit_price,
    (Quantity * UnitPrice) AS revenue,
    InvoiceDate AS invoice_date,
    CustomerID AS customer_id,
    Country AS country
FROM staging_transactions
WHERE Quantity > 0
  AND UnitPrice > 0
  AND CustomerID != 0;

-- Create daily revenue summary
CREATE TABLE daily_revenue AS
SELECT
    DATE(invoice_date) AS sale_date,
    SUM(revenue) AS total_revenue,
    COUNT(DISTINCT invoice_no) AS total_orders
FROM fact_sales
GROUP BY DATE(invoice_date)
ORDER BY sale_date;

-- Create top 10 products
CREATE TABLE top_products AS
SELECT
    stock_code,
    SUM(quantity) AS total_quantity_sold,
    SUM(revenue) AS total_revenue
FROM fact_sales
GROUP BY stock_code
ORDER BY total_revenue DESC
LIMIT 10;

-- Create country revenue summary
CREATE TABLE country_revenue AS
SELECT
    country,
    SUM(revenue) AS total_revenue,
    COUNT(DISTINCT customer_id) AS unique_customers
FROM fact_sales
GROUP BY country
ORDER BY total_revenue DESC;
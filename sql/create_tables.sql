-- Create Database
CREATE DATABASE IF NOT EXISTS retail_pipeline;
USE retail_pipeline;

-- Drop tables if they exist (for reproducibility)
DROP TABLE IF EXISTS staging_transactions;
DROP TABLE IF EXISTS fact_sales;
DROP TABLE IF EXISTS daily_revenue;
DROP TABLE IF EXISTS top_products;
DROP TABLE IF EXISTS country_revenue;

-- Create staging table
CREATE TABLE staging_transactions (
    InvoiceNo VARCHAR(20),
    StockCode VARCHAR(20),
    Description TEXT,
    Quantity INT,
    InvoiceDate DATETIME,
    UnitPrice DECIMAL(10,2),
    CustomerID INT,
    Country VARCHAR(100),
    load_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
# Retail Sales ETL Pipeline

## Project Overview

This project implements a production-ready ETL pipeline using Python and MySQL to process online retail transaction data. The system ingests raw Excel data, loads it into a MySQL staging table, performs SQL-based transformations to clean the data and compute revenue, and generates aggregated business insights.

---

## Dataset Description

The dataset contains online retail transactions with:

- 541,909 total records
- 25,900 unique invoices
- 4,070 unique products
- 38 countries

Key challenges handled:
- Negative quantities (returns)
- Negative unit prices
- Missing customer IDs
- Revenue calculation from quantity and unit price

---

## System Architecture

The pipeline follows this flow:

Excel Dataset  
⬇  
Python ETL Script  
⬇  
MySQL Staging Table  
⬇  
SQL Transformations  
⬇  
Fact Table  
⬇  
Aggregated Output Tables  

### Architecture Diagram

![Architecture Diagram](diagrams/architecture_diagram.png)

---

## Database Schema

The database consists of:

- `staging_transactions` (raw data)
- `fact_sales` (clean transactional data)
- `daily_revenue` (revenue by date)
- `top_products` (top 10 products by revenue)
- `country_revenue` (country-level summary)

### Schema Diagram

![Schema Diagram](diagrams/schema_diagram.png)

---

## ETL Process

1. Python reads the Excel dataset.
2. Missing CustomerID values are handled.
3. Data is loaded into the `staging_transactions` table.
4. SQL transformations:
   - Remove negative quantities
   - Remove negative unit prices
   - Remove missing customers
   - Calculate revenue (Quantity × UnitPrice)
5. Clean data is stored in `fact_sales`.
6. Aggregated summary tables are generated.

---

## How to Run the Project

### Step 1: Install Dependencies
pip install -r requirements.txt


### Step 2: Create Database and Tables

Run:
sql/create_tables.sql


inside MySQL Workbench.

### Step 3: Run ETL Script
py etl/load_to_mysql.py


### Step 4: Run Transformations

Run:

sql/transformations.sql


inside MySQL Workbench.

---

## Output Tables

- `fact_sales`
- `daily_revenue`
- `top_products`
- `country_revenue`

Example validation queries:

SELECT COUNT() FROM staging_transactions;
SELECT COUNT() FROM fact_sales;
SELECT * FROM daily_revenue LIMIT 5;



---

## Limitations and Future Improvements

- No automated scheduler implemented.
- No incremental loading strategy.
- No indexing optimization for performance.
- Could be extended with monitoring and alert systems.
- Could be migrated to a cloud-based data platform.

---

## Technologies Used

- Python
- Pandas
- SQLAlchemy
- MySQL
- GitHub



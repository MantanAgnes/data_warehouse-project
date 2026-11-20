
# SQL Data Warehouse & Sales Analytics Project

## 📌 Project Overview

This project demonstrates the design and implementation of an end-to-end **SQL Data Warehouse** using Microsoft SQL Server.

The project focuses on integrating sales data from multiple source systems, transforming raw data into structured datasets, and enabling business intelligence through SQL-based analytics.

The solution follows the **Medallion Architecture**, consisting of Bronze, Silver, and Gold layers, to ensure data quality, consistency, and analytical readiness.

### 🎯 Project Objectives

**Data Engineering**
- Build a centralized data warehouse using SQL Server.
- Integrate ERP and CRM data from CSV files.
- Develop ETL processes for data ingestion, cleansing, and transformation.
- Implement data quality checks.
- Create business-ready fact and dimension views.

**Data Analytics**
- Analyse customer purchasing behaviour.
- Evaluate product performance.
- Identify sales trends over time.
- Generate insights to support business decisions.

---

## 🛠️ Technologies Used

| Technology | Purpose |
|---|---|
| Microsoft SQL Server | Data warehouse platform |
| T-SQL | Data transformation and analytics |
| SQL Server Management Studio (SSMS) | Database development |
| CSV Files | ERP and CRM source datasets |
| Git & GitHub | Version control and documentation |

---

## 🏗️ Data Warehouse Architecture

The data warehouse follows a three-layer Medallion Architecture.

**Data Flow:**

ERP & CRM Sources → Bronze Layer → Silver Layer → Gold Layer → SQL Analytics

### 🥉 Bronze Layer — Raw Data

The Bronze Layer stores raw data imported from ERP and CRM systems.

**Key Features:**
- Raw data ingestion from CSV files.
- Full-load processing using `TRUNCATE` and `INSERT`.
- Data preserved in its original source structure.
- SQL stored procedures for loading data.

### 🥈 Silver Layer — Cleaned Data

The Silver Layer transforms raw data into cleaned and standardized datasets.

**Key Transformations:**
- Removing unwanted spaces.
- Handling missing or invalid values.
- Standardizing dates and categorical values.
- Resolving duplicate records.
- Applying business transformation rules.
- Creating derived columns.

### 🥇 Gold Layer — Business-Ready Data

The Gold Layer provides structured datasets optimized for analytical queries.

**Key Features:**
- Integration of ERP and CRM data.
- Star Schema data modelling.
- Fact and dimension views.
- Business calculations and transformations.
- Analytical datasets for reporting.

---

## 🔄 Data Integration

The project integrates data from two source systems.

### CRM — Customer Relationship Management

| Source Table | Description |
|---|---|
| crm_cust_info | Customer information |
| crm_prd_info | Product information |
| crm_sales_details | Sales transactions |

### ERP — Enterprise Resource Planning

| Source Table | Description |
|---|---|
| erp_cust_az12 | Additional customer information |
| erp_loc_a101 | Customer location information |
| erp_px_cat_g1v2 | Product category information |

These six source datasets are loaded into the Bronze Layer, transformed in the Silver Layer, and integrated into the Gold Layer.

---

## ⭐ Data Modelling — Star Schema

The Gold Layer follows a Star Schema design consisting of one fact view and two dimension views.

### Fact View: `gold.fact_sales`

Stores transactional sales information, including:

- Order number
- Product key
- Customer key
- Order date
- Shipping date
- Due date
- Sales amount
- Quantity
- Price

**Business Calculation:**

`Sales Amount = Quantity × Price`

### Dimension View: `gold.dim_customers`

Contains customer information such as:

- Customer key and ID
- Customer number
- First and last name
- Country
- Marital status
- Gender
- Birthdate

### Dimension View: `gold.dim_products`

Contains product information such as:

- Product key and ID
- Product number and name
- Category and subcategory
- Maintenance status
- Product cost
- Product line
- Start date

The fact view connects to the customer and product dimensions using surrogate keys.

---

## 📊 SQL Data Analytics

The analytics component focuses on three major business areas.

### 1. Customer Analytics

- Customer purchasing behaviour.
- Customer segmentation.
- Revenue contribution by customer.
- Customer order frequency.
- Customer performance over time.

### 2. Product Analytics

- Best-performing products.
- Revenue by product category.
- Product sales contribution.
- Product performance over time.
- High-performing and low-performing products.

### 3. Sales Analytics

- Monthly and yearly sales trends.
- Total revenue and order volume.
- Average order value.
- Cumulative sales analysis.
- Year-over-year performance.

---

## 📁 Repository Structure

```text
sql-data-warehouse-project/
│
├── datasets/
│   ├── source_crm/
│   └── source_erp/
│
├── scripts/
│   ├── bronze/
│   ├── silver/
│   └── gold/
│
├── analytics/
│
├── docs/
│   ├── high_level_architecture.png
│   ├── data_flow.png
│   ├── data_integration.png
│   ├── data_layers.pdf
│   └── data_model.png
│
└── README.md
```

*Adjust the folder structure to match your actual repository.*

---

## 🚀 How to Run the Project

### Prerequisites

- Microsoft SQL Server
- SQL Server Management Studio (SSMS)
- ERP and CRM CSV datasets

### Execution Steps

1. Create the SQL Server database and Bronze, Silver, and Gold schemas.
2. Execute the Bronze Layer scripts to create source tables.
3. Load the ERP and CRM CSV datasets.
4. Execute the Silver Layer scripts to cleanse and transform the data.
5. Execute the Gold Layer scripts to create analytical views.
6. Run data quality checks.
7. Execute the SQL analytics queries to explore business insights.

---

## 📈 Project Outcomes

This project demonstrates practical experience in:

- SQL data warehouse development.
- ETL pipeline implementation.
- Data cleansing and standardization.
- Multi-source data integration.
- Dimensional data modelling.
- SQL-based analytical reporting.
- Technical documentation and version control.

---

## 📚 Acknowledgements

This project was developed as a hands-on SQL Data Warehouse learning exercise.

**Learning Reference:** Data With Baraa — SQL Data Warehouse Project.

The implementation and documentation in this repository represent my own project work.

---

## 👤 Author

**MANTAN AGNES**

Aspiring Data Engineer | SQL | Data Warehousing | Data Analytics

GitHub:

LinkedIn: https://www.linkedin.com/in/agnes-mantan-29350a257

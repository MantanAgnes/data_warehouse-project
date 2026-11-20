/*
===============================================================================
Dimensions Exploration
===============================================================================
Purpose:
    - To explore the structure of dimension tables.

SQL Functions Used:
    - DISTINCT
    - ORDER BY
===============================================================================
*/


-- Count records in each Gold Layer view
SELECT
    'Customers' AS table_name,
    COUNT(*) AS total_records
FROM gold.dim_customers

UNION ALL

SELECT
    'Products' AS table_name,
    COUNT(*) AS total_records
FROM gold.dim_products

UNION ALL

SELECT
    'Sales' AS table_name,
    COUNT(*) AS total_records
FROM gold.fact_sales;

-- Retrieve a list of unique countries from which customers originate
SELECT DISTINCT
    country
FROM gold.dim_customers
ORDER BY country;

-- Retrieve a list of unique categories, subcategories, and products
SELECT DISTINCT
    category,
    subcategory,
    product_name
FROM gold.dim_products
ORDER BY category, subcategory, product_name;

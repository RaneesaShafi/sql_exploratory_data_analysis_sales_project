/*
===============================================================================
Ranking Analysis
===============================================================================
Purpose:
    - To rank items (e.g., products, customers) based on performance or other metrics.
    - To identify top performers or laggards.

SQL Functions Used:
    - Window Ranking Functions: RANK(), DENSE_RANK(), ROW_NUMBER(), TOP
    - Clauses: GROUP BY, ORDER BY
===============================================================================
*/

 --1: Which 5 products generate the highest revenue?

 Select TOP 5
 p.product_name,
 SUM(f.sales_amount) as total_revenue
 From gold.fact_sales f
 LEFT JOIN gold.dim_products p
 ON f.product_key = p.product_key
 GROUP BY p.product_name
 ORDER BY total_revenue DESC;

 --2: What are the 5 worst performing products in terms of sales?
 Select TOP 5
 p.product_name,
 SUM(f.sales_amount) as total_revenue
 From gold.fact_sales f
 LEFT JOIN gold.dim_products p
 ON f.product_key = p.product_key
 GROUP BY p.product_name
 ORDER BY total_revenue ASC;

 --3:Find top 10 customers who hace generated highest revenue
 Select TOP 10
 c.customer_key,
 c.first_name,
 SUM(f.sales_amount) as total_revenue
 From gold.fact_sales f
 LEFT JOIN gold.dim_customers c
 ON f.customer_key = c.customer_key
 GROUP BY c.customer_key,
  c.first_name
 ORDER BY total_revenue DESC;

 --4: Find 3 customers with the fewest orders placed
 Select TOP 3
 c.customer_key,
 c.first_name,
 c.last_name,
 COUNT(DISTINCT order_date) AS total_orders
 From gold.fact_sales f
 LEFT JOIN gold.dim_customers c
 ON c.customer_key = f.customer_key
 GROUP BY c.customer_key,c.first_name,c.last_name
 ORDER BY total_orders ASC

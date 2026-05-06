/*
===============================================================================
Measures Exploration (Key Metrics)
===============================================================================
Purpose:
    - To calculate aggregated metrics (e.g., totals, averages) for quick insights.
    - To identify overall trends or spot anomalies.

SQL Functions Used:
    - COUNT(), SUM(), AVG()
===============================================================================
*/

  --1: Find total sales
  Select 
  SUM(sales_amount) AS total_sales
  From gold.fact_sales;

  --2: Find how many items are sold
  Select 
  SUM(quantity) AS total_items
  From gold.fact_sales;

  --3: Find the average selling price
  Select 
  AVG(price) AS total_average
  From gold.fact_sales;

  --4: Find the total number of orders
  Select 
  COUNT(order_number) AS total_orders
  From gold.fact_sales;

  Select 
  COUNT(DISTINCT order_number) AS total_orders_distinct
  From gold.fact_sales;

  --5: Find the total number of products
  Select 
  COUNT(product_name) AS total_products
  From gold.dim_products;

  Select 
  COUNT(DISTINCT product_name) AS total_products
  From gold.dim_products;

  --6: Find total number of customers
  Select 
  COUNT(customer_key)AS total_customers
  From gold.dim_customers;

  --7: Find the total number of customers that has placed an order
  Select 
  COUNT(DISTINCT customer_key) AS total_customers
  From gold.fact_sales;

  ---Generate a Report that shows all key metrics of the business

  Select'Total Sales' AS measure_name,  SUM(sales_amount) AS measure_value From gold.fact_sales
  UNION ALL
  Select'Total Quantity' ,  SUM(quantity)  From gold.fact_sales
  UNION ALL
  Select'Average Price' , AVG(price)  From gold.fact_sales
  UNION ALL 
  Select 'Total No. Orders' , COUNT( DISTINCT order_number) From gold.fact_sales
  UNION ALL
  Select 'Total No. Products' , COUNT( product_name)  From gold.dim_products
  UNION ALL
  Select 'Total No. Customers' , COUNT(customer_key) From gold.dim_customers;

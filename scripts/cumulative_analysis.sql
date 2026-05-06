/*
===============================================================================
Cumulative Analysis
===============================================================================
Purpose:
    - To calculate running totals or moving averages for key metrics.
    - To track performance over time cumulatively.
    - Useful for growth analysis or identifying long-term trends.

SQL Functions Used:
    - Window Functions: SUM() OVER(), AVG() OVER()
===============================================================================
*/

--1: Calculate the total sales per month
--and the running total and moving average of sales over time
Select
order_date,
total_sales,
SUM(total_sales) OVER(ORDER BY order_date) AS running_total,
AVG(avg_price) OVER(ORDER BY order_date) AS moving_average
FROM
(
Select 
DATETRUNC(month, order_date) AS order_date,
SUM(sales_amount) AS total_sales,
AVG(price) AS avg_price
From gold.fact_sales
WHERE order_date IS NOT NULL
GROUP BY DATETRUNC(month, order_date)
--ORDER BY DATETRUNC(month, order_date)
)t

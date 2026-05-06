/*
===============================================================================
Date Range Exploration 
===============================================================================
Purpose:
    - To determine the temporal boundaries of key data points.
    - To understand the range of historical data.

SQL Functions Used:
    - MIN(), MAX(), DATEDIFF()
===============================================================================
*/

----Find the date of the first and last order--------
--How many years of sales are available
Select 
MIN(order_date) AS first_order_date,
MAX(order_date) AS last_order_date,
DATEDIFF(month, MIN(order_date), MAX(order_date)) AS order_range_months
From gold.fact_sales;

--Find the youngest and the oldest customer
Select 
MIN(birthdate) AS oldest_customer,
DATEDIFF(YEAR, MIN(birthdate), GETDATE()) AS oldest,
MAX(birthdate) AS youngest_customer,
DATEDIFF(YEAR, MAX(birthdate), GETDATE()) AS oungest
from gold.dim_customers;

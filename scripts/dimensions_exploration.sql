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

 -- Retrieve a list of unique countries from which customers originate
 Select Distinct
 country 
 From gold.dim_customers;

 -- Retrieve a list of unique categories, subcategories, and products

 Select DISTINCT 
 category, 
 subcategory,
 product_name
 From gold.dim_products
 ORDER BY 1,2,3

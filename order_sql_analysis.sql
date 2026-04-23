#Top 10 highest revenue generating products

SELECT product_id, SUM(sale_price) AS sales
FROM df_orders
GROUP BY product_id
ORDER BY sales DESC
LIMIT 10;


# Top 5 highest selling products in each region
WITH CTE AS (
    SELECT product_id,
           SUM(sale_price) AS sales,
           region
    FROM df_orders
    GROUP BY product_id, region
)
SELECT * FROM(
SELECT *,
       ROW_NUMBER() OVER (
           PARTITION BY region
           ORDER BY sales DESC
       ) AS rn
FROM CTE) A
WHERE rn<=5;

# Month over month growth comparison for 2022 and 2023 sales 
WITH CTE AS(
SELECT YEAR(order_date) AS order_year, MONTH(order_date) AS order_month, SUM(sale_price) AS sales
FROM df_orders
GROUP BY order_year, order_month)
SELECT order_month, SUM(CASE WHEN order_year = 2022 THEN sales ELSE 0 END) AS '2022',SUM(CASE WHEN order_year = 2023 THEN sales ELSE 0 END) AS '2023'
FROM CTE
GROUP BY order_month
ORDER BY order_month;

# For each category which month had highest sales
WITH CTE AS(
SELECT category,
DATE_FORMAT(order_date, '%Y-%m') AS order_year_month , 
SUM(sale_price) AS sales
FROM df_orders
GROUP BY category, order_year_month)
SELECT * FROM (SELECT *, 
ROW_NUMBER() OVER(PARTITION BY category ORDER BY sales DESC) AS rn
FROM CTE) A
WHERE rn =1;

# Which sub category had highest growth by profit in 2023 compared to 2022
WITH cte1 AS(
SELECT sub_category, SUM(sale_price) AS sales, YEAR(order_date) AS order_year
FROM df_orders
GROUP BY sub_category, order_year)
, cte2 AS (
SELECT sub_category, SUM(CASE WHEN order_year = 2022 THEN sales ELSE 0 END) AS sales_2022, SUM(CASE WHEN order_year = 2023 THEN sales ELSE 0 END) AS sales_2023 
FROM cte1
GROUP BY sub_category)
SELECT *, (sales_2023-sales_2022)*100/sales_2022 AS growth_percent
FROM cte2
ORDER BY growth_percent DESC;
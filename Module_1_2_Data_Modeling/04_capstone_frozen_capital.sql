/*
CAPSTONE PROJECT: Inventory & Data Modeling
BUSINESS CASE: The CFO requested an analysis of "frozen capital" (unsold inventory cost) 
specifically within the Men's department to identify the most problematic products.

SOLUTION: 
1. Created a CTE 'frozen_inventory' to aggregate total cost of unsold items (sold_at IS NULL).
2. Performed an INNER JOIN with the 'products' dimension table on the primary key.
3. Filtered for the 'Men' department and sorted by highest frozen cost to deliver actionable insights.
*/

WITH frozen_inventory AS(
  SELECT 
      product_id,
      SUM(cost) AS total_frozen_cost
  FROM `bigquery-public-data.thelook_ecommerce.inventory_items`
  WHERE sold_at IS NULL
  GROUP BY product_id
)
SELECT 
    p.name,
    p.brand,
    p.department,
    fi.total_frozen_cost
FROM `bigquery-public-data.thelook_ecommerce.products` AS p
INNER JOIN frozen_inventory AS fi 
    ON p.id = fi.product_id
WHERE p.department = 'Men'
ORDER BY total_frozen_cost DESC;

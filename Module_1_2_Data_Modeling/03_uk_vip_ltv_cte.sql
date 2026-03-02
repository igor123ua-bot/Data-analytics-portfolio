/*
BUSINESS CASE:
The marketing team is organizing an exclusive offline event in London.
Need to extract a list of VIP customers from the UK whose Lifetime Value (LTV) exceeds $500.

SOLUTION:
Used a Common Table Expression (CTE) to pre-aggregate total spend per user from the 'order_items' fact table.
Then, performed an INNER JOIN with the 'users' dimension table to filter by country ('United Kingdom') 
and LTV (> 500), sorting the final result by the highest LTV.
*/

WITH user_ltv AS (
  SELECT 
      user_id, 
      SUM(sale_price) AS total_spent
  FROM `bigquery-public-data.thelook_ecommerce.order_items`
  GROUP BY user_id
)

SELECT 
    u.first_name, 
    u.last_name, 
    u.email, 
    ltv.total_spent
FROM `bigquery-public-data.thelook_ecommerce.users` AS u
INNER JOIN user_ltv AS ltv
    ON u.id = ltv.user_id
WHERE u.country = 'United Kingdom'
  AND ltv.total_spent > 500
ORDER BY ltv.total_spent DESC;

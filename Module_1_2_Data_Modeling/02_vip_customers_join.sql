SELECT 
    u.first_name, 
    u.last_name, 
    u.email, 
    o.sale_price
FROM `bigquery-public-data.thelook_ecommerce.users` AS u
INNER JOIN `bigquery-public-data.thelook_ecommerce.order_items` AS o
    ON o.user_id = u.id
WHERE o.sale_price > 150
ORDER BY o.sale_price DESC;

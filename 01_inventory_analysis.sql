SELECT product_id, product_category, product_name, cost, sold_at
FROM bigquery-public-data.thelook_ecommerce.inventory_items
WHERE sold_at IS NULL
AND cost >200
ORDER BY cost DESC
--
Ситуація:
Ти аналітик інтернет-магазину TheLook. Керівництво стурбоване тим, що на складах (Distribution Centers)
лежить занадто багато дорогого товару, який не продається. Це "з'їдає" наш капітал (Inventory Cost).
Тобі доручили знайти найдорожчі одиниці товару, які досі лежать на складі і чекають на свого покупця.

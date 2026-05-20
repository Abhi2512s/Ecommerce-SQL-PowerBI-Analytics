SELECT 
    p.product_category_name,

    COUNT(DISTINCT oi.order_id) AS total_orders,

    ROUND(SUM(oi.price)::numeric, 2) AS total_revenue,

    ROUND(AVG(oi.price)::numeric, 2) AS avg_product_price

FROM order_items oi

JOIN products p
ON oi.product_id = p.product_id

GROUP BY p.product_category_name

ORDER BY total_revenue DESC;
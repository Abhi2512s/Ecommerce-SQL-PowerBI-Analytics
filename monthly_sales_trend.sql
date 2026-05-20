SELECT 
    DATE_TRUNC('month', o.order_purchase_timestamp) AS month,

    COUNT(DISTINCT o.order_id) AS total_orders,

    ROUND(SUM(p.payment_value)::numeric, 2) AS total_revenue,

    ROUND(AVG(p.payment_value)::numeric, 2) AS avg_order_value

FROM orders o

JOIN payments p
ON o.order_id = p.order_id

GROUP BY month

ORDER BY month;
WITH customer_spending AS (

    SELECT 
        c.customer_id,

        ROUND(SUM(p.payment_value)::numeric, 2) AS total_spent,

        COUNT(DISTINCT o.order_id) AS total_orders

    FROM customers c

    JOIN orders o
    ON c.customer_id = o.customer_id

    JOIN payments p
    ON o.order_id = p.order_id

    GROUP BY c.customer_id
)

SELECT *,

    CASE

        WHEN total_spent >= 5000 THEN 'High Value'

        WHEN total_spent >= 2000 THEN 'Medium Value'

        ELSE 'Low Value'

    END AS customer_segment

FROM customer_spending

ORDER BY total_spent DESC;
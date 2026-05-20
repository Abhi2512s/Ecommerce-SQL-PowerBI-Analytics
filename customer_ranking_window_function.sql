WITH customer_spending AS (

    SELECT 
        c.customer_id,

        ROUND(SUM(p.payment_value)::numeric, 2) AS total_spent

    FROM customers c

    JOIN orders o
    ON c.customer_id = o.customer_id

    JOIN payments p
    ON o.order_id = p.order_id

    GROUP BY c.customer_id
)

SELECT *,

    RANK() OVER(ORDER BY total_spent DESC) AS customer_rank,

    DENSE_RANK() OVER(ORDER BY total_spent DESC) AS dense_rank,

    ROW_NUMBER() OVER(ORDER BY total_spent DESC) AS row_num

FROM customer_spending

LIMIT 20;
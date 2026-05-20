SELECT 
    ROUND(SUM(payment_value)::numeric, 2) AS total_revenue
FROM payments;
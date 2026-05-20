SELECT 

    order_id,

    order_purchase_timestamp,

    order_estimated_delivery_date,

    order_delivered_customer_date,

    (order_delivered_customer_date - order_estimated_delivery_date)
    AS delay_days,

    CASE

        WHEN order_delivered_customer_date > order_estimated_delivery_date
        THEN 'Delayed'

        ELSE 'On Time'

    END AS delivery_status

FROM orders

WHERE order_delivered_customer_date IS NOT NULL;
-- Revenue Trend by Customer Segment (New vs Returning)

WITH first_time_buyers AS
(
SELECT 
	MIN(o.order_date) date,
    o.customer_id
    FROM orders o 
    GROUP BY customer_id
)
SELECT 
	DATE_FORMAT(o.order_date,'%Y-%m') month,
	-- o.customer_id,
    CASE
		WHEN o.customer_id = f.customer_id THEN 'new'
        ELSE 'returning'
        END AS customer_type,
	SUM(o.total_amount) revenue
FROM orders o
JOIN first_time_buyers f 
On o.customer_id = f.customer_id
GROUP BY month, customer_type
ORDER BY month, customer_type;

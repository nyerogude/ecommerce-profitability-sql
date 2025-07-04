-- calculate average order value 
SELECT 
	DATE_FORMAT(o.order_date,'%Y-%m') month,
	COUNT(o.order_id) number_of_orders,
    SUM(o.total_amount) total_revenue,
    ROUND(AVG(o.total_amount),2) average_order
FROM orders o 
GROUP BY month;

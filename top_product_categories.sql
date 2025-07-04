-- calculate top product categories per month
SELECT 
	DATE_FORMAT(o.order_date,'%Y-%m') month,
	p.category,
	SUM(o.quantity *p.selling_price) total_revenue,
    DENSE_RANK () OVER
    (
    PARTITION BY DATE_FORMAT(o.order_date,'%Y-%m')
    ORDER BY SUM(o.quantity *p.selling_price)
    ) AS revenue_rank
FROM orders o 
JOIN products p
ON o.product_id = p.product_id
GROUP BY DATE_FORMAT(o.order_date,'%Y-%m'),category;
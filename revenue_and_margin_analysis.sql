-- calculates monthly Revenue, Cost, Gross Profit, and Profit Margin
-- excludes cancelled orders
SELECT 
	DATE_FORMAT(o.order_date,'%Y-%m') month,
	SUM(p.selling_price* o.quantity) total_revenue,
	SUM(p.cost_price * o.quantity) total_cost,
	SUM(p.selling_price* o.quantity)-SUM(p.cost_price * o.quantity) gross_profit,
	ROUND(SUM((p.selling_price - p.cost_price) * o.quantity)/SUM(p.selling_price * o.quantity) *100,2) profit_margin_pct
FROM orders o
JOIN products p 
ON o.product_id = p.product_id
WHERE o.status = 'Completed'
GROUP BY month 
ORDER BY month;
-- Marketing ROI By Month
SELECT 
  ms.month,
  SUM(ms.spend) AS total_marketing_spend,
  ROUND(SUM(o.total_amount), 2) AS total_revenue,
  ROUND(SUM(o.total_amount) / SUM(ms.spend), 2) AS marketing_roi
FROM marketing_spend ms
JOIN orders o 
  ON DATE_FORMAT(o.order_date, '%Y%m') = ms.month
GROUP BY ms.month
ORDER BY ms.month;

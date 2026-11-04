SELECT 
    product,
    COUNT(*) AS total_complaints,
    SUM(CASE WHEN timely_response = 'Yes' THEN 1 ELSE 0 END) AS timely_count,
    ROUND(100.0 * SUM(CASE WHEN timely_response = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS timely_percentage
FROM consumer_complaints
GROUP BY product
ORDER BY total_complaints DESC;
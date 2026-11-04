SELECT 
    company_response_to_consumer,
    COUNT(*) AS total_complaints,
    SUM(CASE WHEN "consumer_disputed?" = 'Yes' THEN 1 ELSE 0 END) AS disputed_count,
    ROUND(100.0 * SUM(CASE WHEN "consumer_disputed?" = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS dispute_rate_percentage
FROM consumer_complaints
WHERE "consumer_disputed?" IS NOT NULL 
  AND "consumer_disputed?" != ''
GROUP BY company_response_to_consumer
ORDER BY total_complaints DESC;
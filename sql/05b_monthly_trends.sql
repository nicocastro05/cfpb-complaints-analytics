SELECT 
    SUBSTR(date_received, 1, 7) AS complaint_month,
    COUNT(*) AS total_complaints
FROM consumer_complaints
WHERE date_received IS NOT NULL 
  AND date_received != ''
GROUP BY complaint_month
ORDER BY complaint_month ASC;
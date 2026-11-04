SELECT 
    state,
    COUNT(*) AS total_complaints
FROM consumer_complaints
WHERE state IS NOT NULL 
  AND state != ''
  AND LENGTH(state) = 2
GROUP BY state
ORDER BY total_complaints DESC;
SELECT 
    product,
    issue,
    complaint_count
FROM (
    SELECT 
        product,
        issue,
        COUNT(*) AS complaint_count,
        ROW_NUMBER() OVER (
            PARTITION BY product 
            ORDER BY COUNT(*) DESC
        ) AS rn
    FROM consumer_complaints
    GROUP BY product, issue
) AS RankedIssues
WHERE rn <= 2
ORDER BY complaint_count DESC;
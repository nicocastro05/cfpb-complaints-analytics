SELECT 
    COUNT(*) AS total_complaints,
    SUM(CASE WHEN product IS NULL OR product = '' THEN 1 ELSE 0 END) AS missing_products,
    SUM(CASE WHEN issue IS NULL OR issue = '' THEN 1 ELSE 0 END) AS missing_issues,
    SUM(CASE WHEN state IS NULL OR state = '' THEN 1 ELSE 0 END) AS missing_states,
    SUM(CASE WHEN timely_response IS NULL OR timely_response = '' THEN 1 ELSE 0 END) AS missing_timely_responses,
    SUM(CASE WHEN "consumer_disputed?" IS NULL OR "consumer_disputed?" = '' THEN 1 ELSE 0 END) AS missing_disputes
FROM consumer_complaints;
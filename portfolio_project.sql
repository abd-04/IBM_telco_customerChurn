create database project;
use churnData;
select * from churnData;

-- query 1
SELECT 
    CASE 
        WHEN Age BETWEEN 18 AND 25 THEN '18-25'
        WHEN Age BETWEEN 26 AND 35 THEN '26-35'
        WHEN Age BETWEEN 36 AND 45 THEN '36-45'
        WHEN Age BETWEEN 46 AND 55 THEN '46-55'
        WHEN Age BETWEEN 56 AND 65 THEN '56-65'
        ELSE '66+'
    END AS AgeGroup,
    Gender,
   
    AVG(`Monthly Charge`) AS AvgMonthlyCharges
FROM 
    churnData
WHERE 
    `Churn Label` = 'Yes'
GROUP BY 
    AgeGroup, 
    Gender

ORDER BY 
    AvgMonthlyCharges DESC
LIMIT 5;

-- query 2
SELECT 
    `Customer ID`,
    Age,
    Gender,
    `Internet Type`,
    `Monthly Charge`,
    `Churn Reason`,
	`Churn Category`
FROM 
    churnData
WHERE 
    `Churn Label` = 'Yes' 
    AND `Churn Reason` IS NOT NULL;
    
    -- query 3
    
    SELECT 
    `Payment Method`,
    COUNT(`Customer ID`) AS Total_Customers,
    SUM(CASE WHEN `Churn Label` = 'Yes' THEN 1 ELSE 0 END) AS Churned_Customers,
    (SUM(CASE WHEN `Churn Label` = 'Yes' THEN 1 ELSE 0 END) / COUNT(`Customer ID`)) * 100 AS Churn_Rate
FROM 
    churnData
GROUP BY 
    `Payment Method`
ORDER BY 
    Churn_Rate DESC;

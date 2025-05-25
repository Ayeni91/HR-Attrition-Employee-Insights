select *
from hr_raw_data ;


/* Total Employees & Attrition Count*/
SELECT 
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = '1'  THEN 1 ELSE 0 END) AS Total_Attrition
FROM hr_raw_data;


/* Attrition Rate By Department */
SELECT 
    Department,
    COUNT(*) AS Total,
    SUM(CASE WHEN Attrition = '1' THEN 1 ELSE 0 END) AS Attrition_Count,
    ROUND(100.0 * SUM(CASE WHEN Attrition = '1' THEN 1 ELSE 0 END) / COUNT(*), 2) AS Attrition_Rate
FROM hr_raw_data
GROUP BY Department
ORDER BY Attrition_Rate DESC;


/*Avarage Monthly Income by Job Role */
SELECT 
    JobRole,
    ROUND(AVG(MonthlyIncome), 2) AS Avg_Income
FROM hr_raw_data
GROUP BY JobRole
ORDER BY Avg_Income DESC;


/* Job Satisfaction Vs. Attrition*/
SELECT 
    JobSatisfaction,
    COUNT(*) AS Total,
    SUM(CASE WHEN Attrition = '1' THEN 1 ELSE 0 END) AS Attrition_Count
FROM hr_raw_data
GROUP BY JobSatisfaction
ORDER BY JobSatisfaction;


/*Who Is most likely To Leave */
SELECT 
    JobRole,
    Department,
    Gender,
    AVG(JobSatisfaction) AS Avg_Satisfaction,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = '1' THEN 1 ELSE 0 END) AS Left_Company
FROM hr_raw_data
GROUP BY JobRole, Department, Gender
HAVING AVG(JobSatisfaction) < 3
ORDER BY Left_Company DESC;
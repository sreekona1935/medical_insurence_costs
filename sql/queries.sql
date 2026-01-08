-- Q1: Average charges by smoker
SELECT
    smoker,
    COUNT(*) AS n,
    ROUND(AVG(charges), 2) AS avg_charges
FROM insurance
GROUP BY smoker
ORDER BY avg_charges DESC;

-- Q2 Charges by age group
SELECT
    CASE
        WHEN age BETWEEN 18 AND 29 THEN '18-29'
        WHEN age BETWEEN 30 AND 39 THEN '30-39'
        WHEN age BETWEEN 40 AND 49 THEN '40-49'
        WHEN age BETWEEN 50 AND 59 THEN '50-59'
        ELSE '60+'
    END AS age_group,
    COUNT(*) AS n,
    ROUND(AVG(charges), 2) AS avg_charges
FROM insurance
GROUP BY age_group
ORDER BY age_group;

-- Q3: Charges by region
SELECT
    region,
    COUNT(*) AS n,
    ROUND(AVG(charges), 2) AS avg_charges
FROM insurance
GROUP BY region
ORDER BY avg_charges DESC;


-- Q4 Does BMI matter more for smokers
SELECT
    smoker,
    COUNR(*) ASn,
    ROUND(AVG(bmi), 2) AS avg_bmi,
    ROUND(AVG(bmi_smoker), 2) AS avg_bmi_smoker,
    ROUND(AVG(charges), 2) AS avg_charges
FROM insurance
GROUP BY smoker;

-- Q5 Top 10 highest charges
SELECT
    age, sex, bmi, children, smoker, region, bmi_smoker,
    ROUND(charges, 2) AS charges
FROM insurance
ORDER BY charges DESC
LIMIT 10;

-- Risk segmentation 
SELECT
    CASE
        WHEN smoker = 'yes' AND bmi >= 30 THEN 'High risk: smoker & obese'
        WHEN smoker = 'yes' THEN 'High risk: smoker'
        WHEN bmi >= 30 THEN 'Moderate risk: obese'
        ELSE 'Lower risk'
    END AS risk_segment,
    COUNT(*) AS n,
    ROUND(AVG(charges), 2) AS avg_charges
FROM insurence
GROUP BY risk_segment
ORDER BY avg)charges DESC;
create database Genz;
use Genz;
ALTER TABLE `career aspiration genz` RENAME TO career_aspiration_genz;
SELECT COUNT(*) AS row_count
FROM career_aspiration_genz;
ALTER TABLE
career_aspiration_genz
CHANGE `Product Drivers` `Product_Drivers` TEXT;

select Frustrate_at_work from career_aspiration_genz; 
---- 1. Gender Distribution
select Gender, count(Gender) as Count from career_aspiration_genz where Country = "India" group by Gender;

---- 2. higher education aspiration percentage
SELECT 
   Gender,round((COUNT(Gender) / (SELECT COUNT(*) FROM career_aspiration_genz WHERE Country = 'India') * 100),2) AS PercentageYes 
FROM career_aspiration_genz 
WHERE Country = 'India' 
AND (Higher_Education_Aspirations = 'Yes' or Higher_Education_Aspirations = 'Need a Sponsor')
group by Gender;

---- 3. 
select distinct Influence_Aspirations, count(Influence_Aspirations) as Count from career_aspiration_genz 
group by Influence_Aspirations order by count(Influence_Aspirations) Desc limit 6;

---- 4.
SELECT Influence_Aspirations, Gender, COUNT(*) AS Count
FROM career_aspiration_genz
GROUP BY Influence_Aspirations, Gender
ORDER BY Influence_Aspirations, Gender;

---- 5.
SELECT 3_years_Tenurity, ROUND((COUNT(3_years_Tenurity) * 100 / (SELECT COUNT(*) FROM career_aspiration_genz)), 2) AS Percentage
FROM career_aspiration_genz 
GROUP BY 3_years_Tenurity;

---- 6.
select Mission_Impact, count(*) as Count from career_aspiration_genz
group by Mission_Impact 
order by Mission_Impact;

---- 7.
select Mission_Impact, Gender, count(*) as Count from career_aspiration_genz
group by Mission_Impact, Gender 
order by Mission_Impact, Gender;

---- 8. What is the distribution of minimum expected salary in the first three years among respondents?
select Salary_in_3_Years, count(Salary_in_3_Years) as Count from career_aspiration_genz group by Salary_in_3_Years;

---- 9. What is the expected minimum monthly salary in hand?
select min(Monthly_in_hand_salary) from career_aspiration_genz where Country = 'India';

---- 10. What percentage of respondents prefer remote working?
select Work_Environment, round(count(Work_Environment)*100 / (select count(*) from career_aspiration_genz),2) as Percentage
from career_aspiration_genz where Work_Environment = 'Remote' 
group by Work_Environment;

---- 11. What is the preferred number of daily work hours?
select Work_Hours_Preference, count(Work_Hours_Preference) as Count from career_aspiration_genz group by Work_Hours_Preference;

---- 12. What are the common work frustrations among respondents?
select Frustrate_at_work, round(count(Frustrate_at_work) * 100 / (select count(*) from career_aspiration_genz),2) as Percentage
from career_aspiration_genz group by Frustrate_at_work;

---- 13. 
select Break_Frequency, Gender, count(*) as count from career_aspiration_genz group by Break_Frequency, Gender;

---- 14.How many respondents are willing to work under an abusive manager?
select Abusive_Tolerance, count(Abusive_Tolerance) from career_aspiration_genz where Abusive_Tolerance = 'Yes'
group by Abusive_Tolerance;

---- 15. What is the distribution of minimum expected salary after five years?
select min(Salary_Expectation_after_5_Years) as Salary_Expectation_after_5_Years from career_aspiration_genz;

---- 16. What are the remote working preferences by gender?
select Work_Environment, Gender, count(Work_Environment) as Count from career_aspiration_genz where Work_Environment = 'Remote' 
group by Work_Environment, Gender;

---- 17. What are the top work frustrations for each gender?
select Frustrate_at_work, Gender, count(*) as Count from career_aspiration_genz group by Frustrate_at_work, Gender;

---- 18.What factors boost work happiness and productivity for respondents?
select Product_Drivers, round(count(Product_Drivers) * 100 / (select count(*) from career_aspiration_genz),2) as Percentage 
from career_aspiration_genz group by Product_Drivers; 

---- 19.What percentage of respondents need sponsorship for education abroad?
select Higher_Education_Aspirations, round(count(Higher_Education_Aspirations) * 100/ (select count(*) from career_aspiration_genz),2) as Count
from career_aspiration_genz where Higher_Education_Aspirations = 'Need a Sponsor';














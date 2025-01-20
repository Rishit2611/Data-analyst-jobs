-- Active: 1734554354146@@127.0.0.1@3306@project_1
/*What are the optimal skills to learn
-Identify skills in high demand and associated with high average salaries for data analyst roles
-Concentrated on remote positions with specified salaries
*/
WITH skills_demand as 
(
SELECT sd.skill_id,sd.skills,COUNT(sjd.job_id) from job_posting_facts jpf
INNER JOIN skills_jobs_dim sjd on jpf.job_id = sjd.job_id
INNER JOIN skills_dim sd on sjd.skill_id = sd.skill_id
where jpf.job_title_short ='Data analyst'
and jpf.salary_year_avg is not NULL
and jpf.job_work_from_home ='TRUE'
GROUP BY sd.skill_id, sd.skills
),
avg_salary AS
(
SELECT sd.skill_id, ROUND(AVG(jpf.salary_year_avg),0) as Average_salary FROM job_posting_facts jpf
INNER JOIN skills_jobs_dim sjd on jpf.job_id = sjd.job_id
INNER JOIN skills_dim sd on sjd.skill_id = sd.skill_id
WHERE jpf.job_title_short = 'Data analyst'
and jpf.salary_year_avg is not NULL
GROUP BY sd.skill_id
)
SELECT skills_demand.skill_id,skills_demand.skills,avg_salary.Average_salary from skills_demand
INNER JOIN avg_salary ON skills_demand.skill_id = avg_salary.skill_id
ORDER BY 3 DESC
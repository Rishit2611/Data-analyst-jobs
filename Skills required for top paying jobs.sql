/*What are the skills required for the top-paying data analysts jobs?
- Use the top 10 highest paying jobs from the first query
*/

WITH top_paying_jobs AS (
    SELECT jpf.job_id,jpf.job_title,jpf.job_location,jpf.salary_year_avg,cd.name as company_name from job_posting_facts jpf
    LEFT JOIN company_dim cd ON jpf.company_id=cd.company_id
    where jpf.job_title_short = 'Data Analyst'
    and jpf.job_location = 'Anywhere'
    AND jpf.salary_year_avg is NOT NULL
)
SELECT tps.*,sd.skills FROM top_paying_jobs tps
INNER JOIN skills_jobs_dim sjd on tps.job_id = sjd.job_id
INNER JOIN skills_dim sd on sjd.skill_id = sd.skills
ORDER BY 4 DESC
LIMIT 10
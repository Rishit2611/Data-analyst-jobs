/*
Question: What are the top paying data analysts jobs
-Identify the top 10 highest paying data analyst jobs that are available remotely
-Focuses on the job posting with specified salaries (Remove nulls)
*/
SELECT jpf.job_id,jpf.job_title,jpf.job_location,jpf.salary_year_avg,cd.name as company_name from job_posting_facts jpf
LEFT JOIN company_dim cd ON jpf.company_id=cd.company_id
where jpf.job_title_short = 'Data Analyst'
and jpf.job_location = 'Anywhere'
AND jpf.salary_year_avg is NOT NULL
ORDER BY 4 DESC
LIMIT 10;

SELECT sd.skills, ROUND(AVG(jpf.salary_year_avg),0) as Average_salary FROM job_posting_facts jpf
INNER JOIN skills_jobs_dim sjd on jpf.job_id = sjd.job_id
INNER JOIN skills_dim sd on sjd.skill_id = sd.skill_id
WHERE jpf.job_title_short = 'Data analyst'
and jpf.salary_year_avg is not NULL
GROUP BY sd.skills
ORDER BY Average_salary DESC
LIMIT 10 
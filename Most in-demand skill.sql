-- Active: 1734554354146@@127.0.0.1@3306@project_1
SELECT skills,COUNT(sjd.job_id) from job_posting_facts jpf
INNER JOIN skills_jobs_dim sjd on jpf.job_id = sjd.job_id
INNER JOIN skills_dim sd on sjd.skill_id = sd.skill_id
where jpf.job_title_short = 'Data Analyst'
and jpf.job_work_from_home = 'TRUE'
GROUP BY skills
ORDER BY 2 DESC
LIMIT 5

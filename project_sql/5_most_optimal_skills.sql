SELECT
    skills_dim.skills,
    ROUND (AVG(salary_year_avg), 0) AS avg_salary,
    COUNT(skills_dim.skills) AS counted_skills
FROM
    job_postings_fact
JOIN
    skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
JOIN 
    skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
WHERE 
    job_postings_fact.job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home = TRUE
GROUP BY
    skills_dim.skills
ORDER BY
    counted_skills DESC,
    avg_salary DESC
    ;
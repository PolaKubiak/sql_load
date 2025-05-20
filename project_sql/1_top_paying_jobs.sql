SELECT	
	job_title,
	job_location,
	job_schedule_type,
	AVG(salary_year_avg) as average_salary,
	job_posted_date 
FROM
    job_postings_fact
WHERE
    job_title_short = 'Data Analyst'
    AND
    job_location = 'Anywhere'
    AND 
    salary_year_avg IS NOT NULL
GROUP BY
    job_title,
    job_location,
    job_schedule_type,
    job_posted_date
ORDER BY
    average_salary DESC
LIMIT 10
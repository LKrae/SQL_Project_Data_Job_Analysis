--Test
SELECT
    COUNT (job_id) AS number_of_jobs,
    CASE
        WHEN job_location = 'Anywhere' THEN 'Remote'
        WHEN job_location = 'New York, NY' THEN 'Local'
        ELSE 'Onsite'
    END AS location_category
FROM job_postings_fact
WHERE
    job_title_short = 'Data Analyst'
GROUP BY
    location_category;


--Practice Problem 1
SELECT
    job_id,
    job_title,
    salary_year_avg,
    CASE
        WHEN salary_year_avg > 100000 THEN 'high salary'
        WHEN salary_year_avg BETWEEN 60000 AND  99999 THEN 'standard salary'
        WHEN salary_year_avg < 60000 THEN 'low salary'
        END AS salary_type
FROM job_postings_fact
WHERE job_title_short = 'Data Analyst' AND salary_year_avg IS NOT NULL
ORDER BY salary_year_avg DESC;


--Practice Problem 2
SELECT 
    COUNT(DISTINCT CASE WHEN job_work_from_home = TRUE THEN company_id END) AS wfh_companies,
    COUNT(DISTINCT CASE WHEN job_work_from_home = FALSE THEN company_id END) AS non_wfh_companies
FROM job_postings_fact;

--Practice Problem 3
SELECT
    job_id,
    salary_year_avg,
    CASE
        WHEN job_title ILIKE '%Senior%' THEN 'Senior'
        WHEN job_title ILIKE '%Manager%' THEN 'Manager'
        WHEN job_title ILIKE '%Lead%' THEN 'Lead'
        WHEN job_title ILIKE '%Junior%' THEN 'Junior'
        WHEN job_title ILIKE '%Entry%' THEN 'Entry'
        ELSE 'Not Specified'
        END AS experience_level,
    CASE
        WHEN job_work_from_home THEN 'Yes'
        ELSE 'No'
        END AS remote_option
FROM job_postings_fact
WHERE salary_year_avg IS NOT NULL
ORDER BY job_id;
--What skills are required for the top paying jobs?


WITH top_paying_jobs AS (
    
    SELECT
        job_id,
        job_title,
        job_title_short,
        job_location,
        job_schedule_type,
        salary_year_avg,
        company_dim.name AS company_name
    FROM job_postings_fact
    LEFT JOIN
        company_dim ON job_postings_fact.company_id = company_dim.company_id
    WHERE
        (job_title_short = 'Data Analyst' OR job_title_short = 'Data Scientist')
        AND job_location = 'Anywhere'
        AND salary_year_avg IS NOT NULL
    ORDER BY
        salary_year_avg DESC
    LIMIT 10
)

SELECT
    top_paying_jobs.*,
    skills
FROM
    top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
    salary_year_avg DESC


/*
Resulting JSON

[
  {
    "job_id": 40145,
    "job_title": "Staff Data Scientist/Quant Researcher",
    "job_title_short": "Data Scientist",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "550000.0",
    "company_name": "Selby Jennings",
    "skills": "sql"
  },
  {
    "job_id": 40145,
    "job_title": "Staff Data Scientist/Quant Researcher",
    "job_title_short": "Data Scientist",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "550000.0",
    "company_name": "Selby Jennings",
    "skills": "python"
  },
  {
    "job_id": 1714768,
    "job_title": "Staff Data Scientist - Business Analytics",
    "job_title_short": "Data Scientist",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "525000.0",
    "company_name": "Selby Jennings",
    "skills": "sql"
  },
  {
    "job_id": 1131472,
    "job_title": "Data Scientist",
    "job_title_short": "Data Scientist",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "375000.0",
    "company_name": "Algo Capital Group",
    "skills": "sql"
  },
  {
    "job_id": 1131472,
    "job_title": "Data Scientist",
    "job_title_short": "Data Scientist",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "375000.0",
    "company_name": "Algo Capital Group",
    "skills": "python"
  },
  {
    "job_id": 1131472,
    "job_title": "Data Scientist",
    "job_title_short": "Data Scientist",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "375000.0",
    "company_name": "Algo Capital Group",
    "skills": "java"
  },
  {
    "job_id": 1131472,
    "job_title": "Data Scientist",
    "job_title_short": "Data Scientist",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "375000.0",
    "company_name": "Algo Capital Group",
    "skills": "cassandra"
  },
  {
    "job_id": 1131472,
    "job_title": "Data Scientist",
    "job_title_short": "Data Scientist",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "375000.0",
    "company_name": "Algo Capital Group",
    "skills": "spark"
  },
  {
    "job_id": 1131472,
    "job_title": "Data Scientist",
    "job_title_short": "Data Scientist",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "375000.0",
    "company_name": "Algo Capital Group",
    "skills": "hadoop"
  },
  {
    "job_id": 1131472,
    "job_title": "Data Scientist",
    "job_title_short": "Data Scientist",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "375000.0",
    "company_name": "Algo Capital Group",
    "skills": "tableau"
  },
  {
    "job_id": 126218,
    "job_title": "Director Level - Product Management - Data Science",
    "job_title_short": "Data Scientist",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "320000.0",
    "company_name": "Teramind",
    "skills": "azure"
  },
  {
    "job_id": 126218,
    "job_title": "Director Level - Product Management - Data Science",
    "job_title_short": "Data Scientist",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "320000.0",
    "company_name": "Teramind",
    "skills": "aws"
  },
  {
    "job_id": 126218,
    "job_title": "Director Level - Product Management - Data Science",
    "job_title_short": "Data Scientist",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "320000.0",
    "company_name": "Teramind",
    "skills": "tensorflow"
  },
  {
    "job_id": 126218,
    "job_title": "Director Level - Product Management - Data Science",
    "job_title_short": "Data Scientist",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "320000.0",
    "company_name": "Teramind",
    "skills": "keras"
  },
  {
    "job_id": 126218,
    "job_title": "Director Level - Product Management - Data Science",
    "job_title_short": "Data Scientist",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "320000.0",
    "company_name": "Teramind",
    "skills": "pytorch"
  },
  {
    "job_id": 126218,
    "job_title": "Director Level - Product Management - Data Science",
    "job_title_short": "Data Scientist",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "320000.0",
    "company_name": "Teramind",
    "skills": "scikit-learn"
  },
  {
    "job_id": 126218,
    "job_title": "Director Level - Product Management - Data Science",
    "job_title_short": "Data Scientist",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "320000.0",
    "company_name": "Teramind",
    "skills": "datarobot"
  },
  {
    "job_id": 38905,
    "job_title": "Principal Data Scientist",
    "job_title_short": "Data Scientist",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "300000.0",
    "company_name": "Storm5",
    "skills": "sql"
  },
  {
    "job_id": 38905,
    "job_title": "Principal Data Scientist",
    "job_title_short": "Data Scientist",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "300000.0",
    "company_name": "Storm5",
    "skills": "python"
  },
  {
    "job_id": 38905,
    "job_title": "Principal Data Scientist",
    "job_title_short": "Data Scientist",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "300000.0",
    "company_name": "Storm5",
    "skills": "java"
  },
  {
    "job_id": 38905,
    "job_title": "Principal Data Scientist",
    "job_title_short": "Data Scientist",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "300000.0",
    "company_name": "Storm5",
    "skills": "c"
  },
  {
    "job_id": 38905,
    "job_title": "Principal Data Scientist",
    "job_title_short": "Data Scientist",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "300000.0",
    "company_name": "Storm5",
    "skills": "aws"
  },
  {
    "job_id": 38905,
    "job_title": "Principal Data Scientist",
    "job_title_short": "Data Scientist",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "300000.0",
    "company_name": "Storm5",
    "skills": "gcp"
  }
]


*/
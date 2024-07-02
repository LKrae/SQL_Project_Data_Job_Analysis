

SELECT
    skills,
    ROUND(AVG(salary_year_avg), 0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    (job_postings_fact.job_title_short = 'Data Analyst'
    OR job_postings_fact.job_title_short = 'Data Scientist')
    AND salary_year_avg IS NOT NULL
    AND job_postings_fact.job_work_from_home = TRUE
GROUP BY
    skills
ORDER BY
    avg_salary DESC
LIMIT 25;


/*
Results:

[
  {
    "skills": "gdpr",
    "avg_salary": "217738"
  },
  {
    "skills": "bitbucket",
    "avg_salary": "189155"
  },
  {
    "skills": "golang",
    "avg_salary": "187500"
  },
  {
    "skills": "selenium",
    "avg_salary": "180000"
  },
  {
    "skills": "opencv",
    "avg_salary": "172500"
  },
  {
    "skills": "neo4j",
    "avg_salary": "171655"
  },
  {
    "skills": "dynamodb",
    "avg_salary": "169670"
  },
  {
    "skills": "tidyverse",
    "avg_salary": "165513"
  },
  {
    "skills": "solidity",
    "avg_salary": "165000"
  },
  {
    "skills": "datarobot",
    "avg_salary": "162998"
  },
  {
    "skills": "redis",
    "avg_salary": "162500"
  },
  {
    "skills": "watson",
    "avg_salary": "161471"
  },
  {
    "skills": "elixir",
    "avg_salary": "161250"
  },
  {
    "skills": "cassandra",
    "avg_salary": "160850"
  },
  {
    "skills": "atlassian",
    "avg_salary": "160431"
  },
  {
    "skills": "microstrategy",
    "avg_salary": "158765"
  },
  {
    "skills": "slack",
    "avg_salary": "158333"
  },
  {
    "skills": "hugging face",
    "avg_salary": "156520"
  },
  {
    "skills": "vue",
    "avg_salary": "156107"
  },
  {
    "skills": "aurora",
    "avg_salary": "155000"
  },
  {
    "skills": "dplyr",
    "avg_salary": "155000"
  },
  {
    "skills": "c",
    "avg_salary": "154455"
  },
  {
    "skills": "gcp",
    "avg_salary": "154199"
  },
  {
    "skills": "scala",
    "avg_salary": "154095"
  },
  {
    "skills": "php",
    "avg_salary": "153500"
  }
]


*/



/*

Question: What are the highest-paying skills for data engineers?
- Calculate the median salary for each skill required in data engineer positions
- Focus on remote positions with specified salaries
- Include skill frequency to identify both salary and demand
- Why? Helps identify which skills command the highest compensation while also showing 
    how common those skills are, providing a more complete picture for skill development priorities

*/

SELECT 
    sd.skills,
    COUNT(jpf.*) AS demand_count,
    MEDIAN(jpf.salary_year_avg) AS median_salary
FROM
    job_postings_fact AS jpf
INNER JOIN skills_job_dim AS sjd
ON jpf.job_id = sjd.job_id
INNER JOIN skills_dim AS sd
ON sjd.skill_id = sd.skill_id
WHERE 
    job_country = 'Pakistan' 
    AND 
    job_title_short = 'Data Engineer'
GROUP BY
    sd.skills
HAVING
     COUNT(jpf.*) > 100
ORDER BY
    MEDIAN(jpf.salary_year_avg) DESC
LIMIT 10;


/*

Results

┌────────────┬──────────────┬───────────────┐
│   skills   │ demand_count │ median_salary │
│  varchar   │    int64     │    double     │
├────────────┼──────────────┼───────────────┤
│ docker     │          140 │      180000.0 │
│ databricks │          234 │      147500.0 │
│ kafka      │          276 │      125000.0 │
│ gcp        │          210 │      125000.0 │
│ azure      │          570 │      123000.0 │
│ snowflake  │          225 │      113350.0 │
│ power bi   │          236 │      108750.0 │
│ tableau    │          162 │      108750.0 │
│ hadoop     │          271 │      85099.75 │
│ redshift   │          229 │       79200.0 │
└────────────┴──────────────┴───────────────┘


Key Takeaways
- Docker has the highest median salary at PKR 180,000, but appears in only 140 job postings.
- Databricks ranks second at PKR 147,500, with 234 postings, making it a strong combination of salary and demand.
- Kafka and GCP both have a median salary of PKR 125,000, with Kafka showing higher demand (276 postings) than GCP (210).
- Azure has the highest demand, appearing in 570 postings, while maintaining a strong median salary of PKR 123,000.
- Snowflake offers a good balance with 225 postings and a median salary of PKR 113,350.
- Power BI and Tableau have reasonable demand but lower median salaries compared with Docker, Databricks, Kafka, and cloud technologies.
- Hadoop and Redshift have relatively high demand but lower median salaries.
Overall
If you're prioritizing skills based on both earning potential and demand, the strongest skills from this dataset are:
Azure → Databricks → Kafka → GCP → Snowflake → Docker
However, Azure stands out the most for job opportunities, while Docker and Databricks stand out more for salary potential.

*/
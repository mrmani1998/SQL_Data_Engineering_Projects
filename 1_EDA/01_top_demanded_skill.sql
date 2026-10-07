/*
Question: What are the most in-demand skills for data engineers?
- Join job postings to inner join table similar to query 2
- Identify the top 10 in-demand skills for data engineers
- Focus on specifically Pakistan
- Why? Retrieves the top 10 skills with the highest demand in the remote job market,
    providing insights into the most valuable skills for data engineers seeking remote work

*/

SELECT 
    sd.skills,
    COUNT(jpf.*) AS demand_count
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
ORDER BY
    COUNT(jpf.*) DESC
LIMIT 10;

/*


Result

┌─────────┬──────────────┐
│ skills  │ demand_count │
│ varchar │    int64     │
├─────────┼──────────────┤
│ sql     │         1061 │
│ python  │          924 │
│ aws     │          657 │
│ azure   │          570 │
│ spark   │          451 │
│ airflow │          296 │
│ java    │          290 │
│ kafka   │          276 │
│ hadoop  │          271 │
│ mongodb │          252 │
└─────────┴──────────────┘


Here's the breakdown of the most in-demand skills for data engineers in Pakistan:

SQL leads the demand with 1,061 job postings, followed by Python with 924.
AWS and Azure follow with 657 and 570 postings respectively, while Spark
completes the top 5 with 451 postings.

Key takeaways:
- SQL and Python are the most in-demand skills for data engineers in Pakistan
- Cloud platforms such as AWS and Azure show strong demand
- Big data technology such as Spark is among the top requested skills
- Airflow, Java, Kafka, Hadoop, and MongoDB also appear among the top 10 skills

*/

---------------------------------------------------

/* Question: Now We have to check Top 10 cities of Pakistan Which is offering
Data Engineering Jobs */

SELECT
    job_title_short,
    job_location,
    COUNT(job_title_short)
    
    FROM 
    job_postings_fact
WHERE
    job_title_short = 'Data Engineer'
    AND
    job_country = 'Pakistan'
GROUP BY
    job_location,
    job_title_short
ORDER BY
    COUNT(job_title_short) DESC
LIMIT 10;


/*

Results 

┌─────────────────┬──────────────────────┬────────────────────────┐
│ job_title_short │     job_location     │ count(job_title_short) │
│     varchar     │       varchar        │         int64          │
├─────────────────┼──────────────────────┼────────────────────────┤
│ Data Engineer   │ Lahore, Pakistan     │                    335 │
│ Data Engineer   │ Karachi, Pakistan    │                    333 │
│ Data Engineer   │ Pakistan             │                    270 │
│ Data Engineer   │ Anywhere             │                    236 │
│ Data Engineer   │ Islamabad, Pakistan  │                    216 │
│ Data Engineer   │ Hyderabad, Pakistan  │                     90 │
│ Data Engineer   │ Rawalpindi, Pakistan │                     21 │
│ Data Engineer   │ Faisalabad, Pakistan │                      9 │
│ Data Engineer   │ Sindh, Pakistan      │                      7 │
│ Data Engineer   │ Punjab, Pakistan     │                      7 │
└─────────────────┴──────────────────────┴────────────────────────┘


Here's the breakdown of the top locations offering Data Engineering jobs in Pakistan:

Lahore leads with 335 Data Engineer postings, closely followed by Karachi
with 333. Pakistan-wide and remote/Anywhere postings account for 270 and
236 postings respectively, followed by Islamabad with 216 postings.

Key takeaways:
- Lahore has the highest number of Data Engineer postings in the dataset
- Karachi is very close behind Lahore in job availability
- Islamabad is another major location for Data Engineering opportunities
- Remote/Anywhere positions also represent a significant number of postings


  */
SELECT 
job_id,
job_title_short,
salary_year_avg,
company_id

FROM
job_postings_fact

WHERE
salary_year_avg IS NOT NULL

LIMIT 10;

SELECT
company_id,
name

FROM
company_dim

LIMIT 10;

SELECT *
FROM Information_schema.tables;

SELECT *
FROM Information_schema.columns;

SELECT *
FROM Information_schema.table_constraints;
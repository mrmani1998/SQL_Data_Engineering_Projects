-- LEFT JOIN

SELECT
    jpf.*,
    cd.*

FROM
    job_postings_fact as jpf
LEFT JOIN company_dim as cd
ON cd.company_id = jpf.company_id

LIMIT 10;


SELECT
    jpf.job_id,
    jpf.job_title_short,
    cd.name AS company_name,
    jpf.job_location

FROM
    job_postings_fact as jpf
LEFT JOIN company_dim as cd
ON cd.company_id = jpf.company_id

LIMIT 10;

-- RIGHT JOIN

SELECT
    jpf.job_id,
    jpf.job_title_short,
    cd.name AS company_name,
    jpf.job_location

FROM
    job_postings_fact as jpf
RIGHT JOIN company_dim as cd
ON cd.company_id = jpf.company_id

LIMIT 10;

-- INNER JOIN

SELECT
    jpf.job_id,
    jpf.job_title_short,
    cd.name AS company_name,
    jpf.job_location

FROM
    job_postings_fact as jpf
INNER JOIN company_dim as cd
ON cd.company_id = jpf.company_id

LIMIT 10;

-- FULL OUTRR JOIN

SELECT
    jpf.job_id,
    jpf.job_title_short,
    cd.name AS company_name,
    jpf.job_location

FROM
    job_postings_fact as jpf
FULL OUTER JOIN company_dim as cd
ON cd.company_id = jpf.company_id

LIMIT 10;
WITH project_duration AS (
    SELECT ID AS project_id,
           (YEAR(FINISH_DATE) - YEAR(START_DATE)) * 12 + (MONTH(FINISH_DATE) - MONTH(START_DATE)) AS duration_in_months
    FROM project
    WHERE FINISH_DATE IS NOT NULL
),
     project_salary AS (
         SELECT pw.PROJECT_ID AS project_id,
                SUM(w.SALARY) AS total_salary
         FROM project_worker pw
                  JOIN worker w ON pw.WORKER_ID = w.ID
         GROUP BY pw.PROJECT_ID
     )
SELECT p.ID AS project_id,
       p.CLIENT_ID,
       pd.duration_in_months,
       ps.total_salary,
       (pd.duration_in_months * ps.total_salary) AS price
FROM project p
         JOIN project_duration pd ON p.ID = pd.project_id
         JOIN project_salary ps ON p.ID = ps.project_id
ORDER BY price DESC;

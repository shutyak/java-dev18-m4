WITH project_duration AS (
    SELECT ID, START_DATE, FINISH_DATE,
           (YEAR(FINISH_DATE) - YEAR(START_DATE)) * 12 + (MONTH(FINISH_DATE) - MONTH(START_DATE)) AS duration_in_months
    FROM project
)
SELECT ID as NAME, duration_in_months
FROM project_duration
WHERE duration_in_months = (
    SELECT MAX(duration_in_months) FROM project_duration
    );


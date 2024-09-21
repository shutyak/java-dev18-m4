WITH min_max_dates AS (
    SELECT
        MIN(BIRTHDAY) AS min_birthday,
        MAX(BIRTHDAY) AS max_birthday
    FROM worker
)
SELECT 'YOUNGEST' AS TYPE, NAME, BIRTHDAY
FROM worker w
         JOIN min_max_dates m ON w.BIRTHDAY = m.max_birthday

UNION ALL

SELECT 'OLDEST' AS TYPE, NAME, BIRTHDAY
FROM worker w
         JOIN min_max_dates m ON w.BIRTHDAY = m.min_birthday;

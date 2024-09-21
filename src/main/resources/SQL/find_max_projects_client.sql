SELECT c.NAME, COUNT(p.ID) AS project_count
FROM client c
         JOIN project p ON c.ID = p.CLIENT_ID
GROUP BY c.ID, c.NAME
HAVING COUNT(p.ID) = (
    SELECT COUNT(*)
    FROM project
    GROUP BY CLIENT_ID
    ORDER BY COUNT(*) DESC
    LIMIT 1
    );
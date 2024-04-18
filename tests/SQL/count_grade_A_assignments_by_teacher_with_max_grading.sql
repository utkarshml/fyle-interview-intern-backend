-- Write query to find the number of grade A's given by the teacher who has graded the most assignments

SELECT COUNT(*) 
FROM assignments 
WHERE grade = 'A' AND teacher_id = (
    SELECT teacher_id
    FROM (
        SELECT teacher_id, COUNT(*) AS num_graded_assignments
        FROM assignments
        WHERE state = 'GRADED'
        GROUP BY teacher_id
        ORDER BY num_graded_assignments DESC
        LIMIT 1
    ) AS subquery
);

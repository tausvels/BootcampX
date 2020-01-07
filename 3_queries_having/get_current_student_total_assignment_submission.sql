SELECT students.name as student, count(assignment_submissions) as total_submissions
FROM assignment_submissions
JOIN students ON students.id = student_id
WHERE students.end_date IS NULL
GROUP BY student
ORDER BY total_submissions;

-- STUDENTS WITH ASSIGNMENT SUBMISSION LESS THAN 100
SELECT students.name as student, count(assignment_submissions) as total_submissions
FROM assignment_submissions
JOIN students ON students.id = student_id
WHERE students.end_date IS NULL
GROUP BY student
HAVING (count(assignment_submissions) < 100)
ORDER BY total_submissions;
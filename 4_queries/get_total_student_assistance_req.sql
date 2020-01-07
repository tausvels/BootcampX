SELECT count(*) AS total_assistance, students.name AS name
FROM assistance_requests
JOIN students ON student_id = students.id
WHERE students.name IN ('Elliot Dickinson')
GROUP BY students.name;
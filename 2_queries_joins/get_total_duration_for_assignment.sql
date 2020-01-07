SELECT students.name as student_name, sum(assignment_submissions.duration) as total_duration
FROM students JOIN assignment_submissions ON students.id = student_id
WHERE students.name LIKE '%Ibrahim Schimmel'
GROUP BY students.name;
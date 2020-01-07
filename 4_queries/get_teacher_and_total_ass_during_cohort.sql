SELECT 
  DISTINCT teachers.name AS teacher,
  cohorts.name AS cohort,
  count(assistance_requests) AS total_assistance
FROM 
  teachers
  JOIN assistance_requests ON teacher_id = teachers.id
  JOIN students ON students.id = student_id
  JOIN cohorts ON cohorts.id = cohort_id
WHERE cohorts.name IN ('JUL02')
GROUP BY teacher, cohort
ORDER BY teacher;
const {Pool} = require('pg');

const pool = new Pool({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});
const queryString = `
  SELECT DISTINCT teachers.name as teacher, cohorts.name as cohort
  FROM teachers
    JOIN assistance_requests ON teacher_id = teachers.id
    JOIN students ON students.id = student_id
    JOIN cohorts ON cohorts.id = cohort_id
  WHERE cohorts.name IN ($1)
  GROUP BY teacher, cohort
  ORDER BY teacher;
`;
const cohortName = [process.argv.slice(2)[0]];

pool.query(queryString, cohortName)
  .then(res => {
    res.rows.forEach(row => {
      console.log(`${row.cohort}: ${row.teacher}`)
    })
    pool.end();
  })
  .catch((err) => {console.error(err)})
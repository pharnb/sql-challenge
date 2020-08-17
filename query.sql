SET search_path = sqlchallenge, "$user", public; -- sets schema to sqlchallenge for current session only, StackOverflow

-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.
/*
SELECT e.emp_no AS "Employee Number", e.last_name, e.first_name, e.sex, s.salary
FROM employees e
INNER JOIN salaries s
ON (e.emp_no = s.emp_no)
;
*/
-- 2. List first name, last name, and hire date for employees who were hired in 1986.
/*
SELECT first_name as "First Name", last_name as "Last Name", hire_date as "Hire Date"
FROM employees
WHERE (hire_date >= '1986-01-01' and hire_date < '1987-01-01')
;
*/
-- 3. List the manager of each department with the following information: department number, department name, 
--    the manager's employee number, last name, first name.
/*
SELECT m.dept_no as "Department Number", d.dept_name as "Department Name", e.emp_no AS "Employee Number", 
	e.last_name, e.first_name
FROM employees e
INNER JOIN dept_manager m ON (m.emp_no = e.emp_no)
INNER JOIN departments d ON (d.dept_no = m.dept_no)
;
*/
-- 4. List the department of each employee with the following information: employee number, last name, 
--    first name, and department name.
/*
SELECT e.emp_no AS "Employee Number", e.last_name, e.first_name, d.dept_name as "Department Name"
FROM employees e
INNER JOIN dept_manager m ON (m.emp_no = e.emp_no)
INNER JOIN departments d ON (d.dept_no = m.dept_no)
;
*/
-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names 
--    begin with "B."
/*
SELECT e.first_name, e.last_name, e.sex
FROM employees e
WHERE e.first_name = 'Hercules' and e.last_name LIKE 'B%'
;
*/
-- 6. List all employees in the Sales department, including their employee number, last name, first name, 
--    and department name.
/*
SELECT e.emp_no AS "Employee Number", e.last_name, e.first_name, d.dept_name as "Department Name"
FROM employees e
INNER JOIN dept_manager m ON (m.emp_no = e.emp_no)
INNER JOIN departments d ON (d.dept_no = m.dept_no)
WHERE d.dept_name = 'Sales'
;
*/
-- 7. List all employees in the Sales and Development departments, including their employee number, last 
--    name, first name, and department name.
/*
SELECT e.emp_no AS "Employee Number", e.last_name, e.first_name, d.dept_name as "Department Name"
FROM employees e
INNER JOIN dept_manager m ON (m.emp_no = e.emp_no)
INNER JOIN departments d ON (d.dept_no = m.dept_no)
WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development'
;
*/
-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share 
--    each last name.
/*
SELECT e.last_name, COUNT(e.last_name) 
FROM employees e
GROUP BY e.last_name
ORDER BY COUNT(e.last_name) DESC
;
*/
--List the employee number, last name, first name, sex, and salary of each employee (2 points)
SELECT e.emp_no, first_name, "last_Name", sex, hire_date, s.salary
FROM employees as e
JOIN salaries s
ON e.emp_no = s.emp_no

--List the first name, last name, and hire date for the employees who were hired in 1986 (2 points)
SELECT first_name, "last_Name", hire_date
FROM employees
WHERE hire_date LIKE '%1986'

--List the manager of each department along with their department number, department name, employee number, last name, and first name (2 points)
SELECT dm.dept_no, dm.emp_no, e.first_name, e.last_name, d.dept_name FROM dept_manager dm
JOIN employees e ON dm.emp_no = e.emp_no
JOIN departments d ON d.dept_no = dm.dept_no

--List the department number for each employee along with that employee’s employee number,
-- last name, first name, and department name (2 points)
SELECT de.emp_no,  d.dept_name, e.first_name, e.last_name FROM dept_emp as de
JOIN employees e ON de.emp_no = e.emp_no
JOIN departments d ON d.dept_no = de.dept_no

--List first name, last name, and sex of each employee whose first name is
-- Hercules and whose last name begins with the letter B (2 points)
SELECT first_name, "last_Name", sex 
FROM employees
WHERE first_name = 'Hercules' AND "last_Name" LIKE 'B%'

--List each employee in the Sales department, including their employee number,
-- last name, and first name (2 points)
SELECT e.emp_no, e.first_name, e."last_Name", d.dept_name FROM employees e
JOIN dept_emp de on de.emp_no = e.emp_no
JOIN departments d on d.dept_no = de.dept_no
WHERE d.dept_name = 'Sales'

--List each employee in the Sales and Development departments, including their
-- employee number, last name, first name, and department name (4 points)

SELECT e.emp_no, e.first_name, e."last_Name", d.dept_name FROM employees e
JOIN dept_emp de on de.emp_no = e.emp_no
JOIN departments d on d.dept_no = de.dept_no
WHERE d.dept_name = 'Development' OR d.dept_name = 'Sales'

--List the frequency counts, in descending order, of all the employee last names
-- (that is, how many employees share each last name) (4 points)
SELECT  e."last_Name", count(emp_no) as countOfName FROM employees e
GROUP BY e."last_Name"
order by countOfName desc
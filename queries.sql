--List the employee number, last name, first name, sex, and salary of each employee.

SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary --selecting columns from eployees and salaries tables we want
FROM employees e
JOIN salaries s 
ON e.emp_no = s.emp_no; --adding/joining the salary column data to our data using key that match on both tables

--List the first name, last name, and hire date for the employees who were hired in 1986.

SELECT first_name, last_name, hire_date
FROM employees
WHERE date_part('year',hire_date) = 1986; --PostgreSQL function for date extraction 

--List the manager of each department along with their department number, department name, employee number, last name, and first name.

SELECT d.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name --we need 3 tables for the info
FROM departments d --starting from here makes sure we are capturing all departments
JOIN dept_manager dm 
ON d.dept_no = dm.dept_no --need dept_manager table to access the names in employees table
JOIN employees e 
ON dm.emp_no = e.emp_no; 

--List the department number for each employee along with that employee’s employee number, last name, first name, and department name.

SELECT d.dept_no, d.dept_name, de.emp_no, e.last_name, e.first_name
FROM employees e --starting from here ensures we capture all employees
JOIN dept_emp de 
ON e.emp_no = de.emp_no
JOIN departments d 
ON de.dept_no = d.dept_no;

--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.

SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' 
AND last_name LIKE 'B%';

--List each employee in the Sales department, including their employee number, last name, and first name.

SELECT e.emp_no, e.last_name, e.first_name
FROM employees e
JOIN dept_emp de
ON e.emp_no = de.emp_no
JOIN departments d
ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales';

--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
JOIN dept_emp de
ON e.emp_no = de.emp_no
JOIN departments d
ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales'
OR d.dept_name = 'Development';

--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).

SELECT last_name, COUNT(last_name) AS name_count
FROM employees
GROUP BY last_name
ORDER BY name_count DESC;
------------------Look at the data---

SELECT * FROM "Employees";
SELECT * FROM "Titles";
SELECT * FROM "Salaries";
SELECT * FROM "Departments";
SELECT * FROM "Dept_Employees";
SELECT * FROM "Dept_Managers";


---1. List the employee number, last name, first name, sex, and salary of each employee.

SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM "Employees" AS e
LEFT JOIN "Salaries" AS s
ON e.emp_no = s.emp_no
ORDER BY s.emp_no;

---2. List the first name, last name, and hire date for the employees who were hired in 1986.

SELECT first_name, last_name, hire_date
FROM "Employees" 
WHERE extract(year from hire_date) = 1986;

---3. List the manager of each department along with their department number, department name, employee number, last name, and first name.


SELECT dm.emp_no, dm.dept_no, d.dept_name, e.last_name, e.first_name
FROM "Dept_Managers" AS dm
LEFT JOIN "Departments" AS d
ON d.dept_no = dm.dept_no
LEFT JOIN "Employees" AS e
ON dm.emp_no = e.emp_no;



---4. List the department number for each employee along with that employee’s employee number, last name, first name, and department name.

SELECT de.emp_no, e.last_name, e.first_name, d.dept_name
FROM "Dept_Employees" AS de
LEFT JOIN "Employees" AS e
ON de.emp_no = e.emp_no
LEFT JOIN "Departments" AS d
ON de.dept_no =d.dept_no;


---5. List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.

SELECT e.first_name, e.last_name, e.sex
FROM "Employees" AS e
WHERE e.first_name='Hercules' 
AND e.last_name LIKE 'B%'; 

---6. List each employee in the Sales department, including their employee number, last name, and first name.
--Sales dept 'd007'

SELECT e.emp_no, e.last_name, e.first_name
FROM "Employees" AS e
LEFT JOIN "Dept_Employees" AS de
ON e.emp_no = de.emp_no
LEFT JOIN "Departments" AS d
ON de.dept_no = d.dept_no
WHERE d.dept_no = 'd007';

---7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
---Sales dept 'd007' 
---Develop dept 'd005'


SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM "Employees" AS e
INNER JOIN "Dept_Employees" AS de
ON e.emp_no = de.emp_no
INNER JOIN "Departments" AS d
ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development';




---8. List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).

SELECT last_name, COUNT(last_name) AS "Frequency Count"
FROM "Employees" 
GROUP BY last_name
ORDER BY "Frequency Count" DESC;






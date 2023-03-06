--1-- -- List the employee number, last name, 
--first name, sex, and salary of each employee.

SELECT
ep.emp_no,
ep.last_name,
ep.first_name,
ep.sex,
sal.salary

FROM employees AS ep
JOIN salaries AS sal
on ep.emp_no = sal.emp_no;

--2 -- List the first name, last name, 
-- and hire date for the employees who were hired in 1986.
SELECT
first_name,
last_name,
hire_date

FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

--3-- List the manager of each department along with their department number,
--department name, employee number, last name, and first name.

SELECT 
dept_mngr.dept_no,
dept.dept_name,
dept_mngr.emp_no,
ep.last_name,
ep.first_name

FROM dept_manager as dept_mngr
JOIN departments as Dept on dept_mngr.dept_no=Dept.dept_no
JOIN employees as ep on dept_mngr.emp_no=ep.emp_no;

--4---- List the department number for each employee along with that employee’s employee number, 
--last name, first name, and department name.

SELECT
ep.emp_no,
ep.last_name,
ep.first_name,
Dept.dept_no,
Dept.dept_name

FROM employees as ep 
JOIN dept_emp as dep_emp on ep.emp_no = dep_emp.emp_no
JOIN departments as Dept on dep_emp.dept_no = Dept.dept_no;

--5-- List first name, last name, and sex of each employee 
--whose first name is Hercules and whose last name begins with the letter B.
SELECT 
first_name,
last_name,
sex

FROM employees

WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

--6-- List each employee in the Sales department, 
--including their employee number, last name, and first name.

SELECT

ep.emp_no,
ep.last_name,
ep.first_name,
Dept.dept_name
FROM employees as ep
inner join dept_emp on ep.emp_no= dept_emp.emp_no
inner join departments as Dept on dept_emp.dept_no= dept_emp.dept_no
where Dept.dept_name = 'Sales';

 --7---- List each employee in the Sales and Development departments,
 --including their employee number, last name, first name, and department name.

SELECT

ep.emp_no,
ep.last_name,
ep.first_name,
Dept.dept_name
FROM employees as ep
inner join dept_emp on ep.emp_no= dept_emp.emp_no
inner join departments as Dept on dept_emp.dept_no= Dept.dept_no
where Dept.dept_name in ('Sales', 'Development');


-- 8-- List the frequency counts, in descending order,
--of all the employee last names (that is, how many employees share each last name).

SELECT
last_name,count(last_name)AS Frequency
FROM employees 
group by last_name
order by Frequency DESC;
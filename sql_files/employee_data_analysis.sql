-- Validate Data Import
select * from titles;
select count(*) from employees;
select count(*) from departments;
select count(*) from dept_emp;
select * from dept_manager;
select count(*) from salaries;

/****************************************************
Data Analysis
*****************************************************/
/*
1. List the following details of each employee: 
   employee number, last name, first name, sex, and salary.
*/

SELECT 
	e. emp_no AS "Employee Number",
	last_name AS "Last Name",
	first_name AS "First Name",
	sex AS "Sex",
	salary AS "Salary"
FROM 
	employees e
JOIN 
	salaries on (e.emp_no = salaries.emp_no);

/*
2. List first name, last name, and hire date for employees who were hired in 1986.
*/
SELECT
	first_name,
	last_name,
	hire_date
FROM
	employees
WHERE
	extract (year from hire_date)= 1986;

/*
3. List the manager of each department with the following information: 
   department number, department name, the manager's employee number, last name, first name.
*/

SELECT
	d.dept_no AS "Department_Number",
	d.dept_name AS "Department_Name",
	dm.emp_no As "Manager_Number",
	e.first_name AS "Manager_First_Name",
	e.last_name AS "Manager_Last_Name"
FROM
	departments d
JOIN dept_manager dm on (d.dept_no = dm.dept_no)
JOIN employees e on (dm.emp_no=e.emp_no)

/* 
4. List the department of each employee with the following information: 
employee number, last name, first name, and department name. 
*/
SELECT
	e.emp_no,
	last_name,
	first_name,
	dept_name
FROM
	employees e
JOIN dept_emp de ON e.emp_no = de.emp_no
JOIN departments d on (de.dept_no = d.dept_no)

/*
5. List first name, last name, and sex for employees 
   whose first name is "Hercules" and last names begin with "B."
*/
SELECT
	first_name,
	last_name,
	sex
FROM
	employees
WHERE
	LOWER(first_name) = 'hercules'
	AND last_name LIKE 'B%'

/*
6. List all employees in the Sales department, 
   including their employee number, last name, first name, and department name.
*/
SELECT
	e.emp_no,
	last_name,
	first_name,
	dept_name
FROM
	employees e
JOIN dept_emp de ON e.emp_no = de.emp_no
JOIN departments d on (de.dept_no = d.dept_no)
WHERE LOWER(d.dept_name) = 'sales'

/*
7. List all employees in the Sales and Development departments, 
   including their employee number, last name, first name, and department name.
*/
SELECT
	e.emp_no,
	last_name,
	first_name,
	dept_name
FROM
	employees e
JOIN dept_emp de ON e.emp_no = de.emp_no
JOIN departments d on (de.dept_no = d.dept_no)
WHERE LOWER(d.dept_name) in ('sales','development')

/*
8. In descending order, list the frequency count of employee last names, 
   i.e., how many employees share each last name.
*/
SELECT distinct
	last_name as "Last_Name", 
	count(last_name) as "Frequecy_Count"
FROM
	employees
group by last_name
order by "Frequecy_Count" DESC;

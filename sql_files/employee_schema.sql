-- Create titles table
CREATE TABLE titles
(
	title_id VARCHAR PRIMARY KEY,
	title VARCHAR NOT NULL
);
-- Create employees table
CREATE TABLE employees
(
	emp_no INT PRIMARY KEY,
	emp_title_id VARCHAR NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR NOT NULL,
	last_name VARCHAR,
	sex VARCHAR,
	hire_date DATE,
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
)

-- Create departments table
CREATE TABLE departments
(
	dept_no VARCHAR PRIMARY KEY,
	dept_name VARCHAR
);

-- Create dept_emp table. Composite Primary Key
CREATE TABLE dept_emp
(
	emp_no INT NOT NULL,
	dept_no VARCHAR NOT NULL,
	PRIMARY KEY(emp_no, dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

-- Create dept_manager table. Composite Primary Key
CREATE TABLE dept_manager(
	dept_no VARCHAR NOT NULL,
	emp_no INT NOT NULL,
	PRIMARY KEY (dept_no, emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

-- Create salaries table. Composite Primary Key
CREATE TABLE salaries
(
	emp_no INT NOT NULL,
	salary INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);
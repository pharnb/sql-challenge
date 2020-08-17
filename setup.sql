SET search_path = sqlchallenge, "$user", public; -- sets schema to sqlchallenge for current session only, StackOverflow

CREATE TABLE departments (
	dept_no VARCHAR(4) PRIMARY KEY,
	dept_name VARCHAR(30)
);

CREATE TABLE titles (
	title_id VARCHAR(5) PRIMARY KEY,
	title VARCHAR(30)
);

CREATE TABLE employees (
	emp_no VARCHAR(9) PRIMARY KEY,
	emp_title_id VARCHAR(5),
	birth_date DATE,
	first_name VARCHAR(20),
	last_name VARCHAR(20),
	sex VARCHAR(1),
	hire_date DATE,
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);

CREATE TABLE dept_emp (
	emp_no VARCHAR(9),
	dept_no VARCHAR(4),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

CREATE TABLE dept_manager (
	dept_no VARCHAR(4),
	emp_no VARCHAR(9),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)	
);

CREATE TABLE salaries (
	emp_no VARCHAR(9),
	salary INT,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);
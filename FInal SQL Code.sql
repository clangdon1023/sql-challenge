CREATE TABLE titles(
	title_id VARCHAR NOT NULL,
	title VARCHAR NOT NULL,
	PRIMARY KEY (title_id)
);
 
 CREATE TABLE departments(
	dept_no VARCHAR NOT NULL,
	dept_name VARCHAR NOT NULL,
	PRIMARY KEY (dept_no),
	UNIQUE (dept_name)
);

CREATE TABLE employees(
	emp_no INT NOT NULL,
	emp_title VARCHAR NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR NOT NULL,
	last_name VARCHAR NOT NULL,
	sex VARCHAR NOT NULL,
	hire_date DATE NOT NULL,
	Foreign Key (emp_title) REFERENCES titles(title_id),
	PRIMARY KEY (emp_no)
);

CREATE TABLE dept_manager(
dept_no VARCHAR NOT NULL,
	emp_no INT NOT NULL,
FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
	PRIMARY KEY (emp_no, dept_no)
);

CREATE TABLE salaries(
	emp_no INT NOT NULL,
	salary INT NOT NULL, 
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	PRIMARY KEY (emp_no)
);

CREATE TABLE dept_emp(
emp_no INT NOT NULL,
	dept_no VARCHAR NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
    PRIMARY KEY (emp_no, dept_no)
);

SELECT * FROM departments;
SELECT * FROM employees;
SELECT * FROM dept_manager;
SELECT * FROM salaries;
SELECT * FROM titles;
SELECT * FROM dept_emp;

Select e.emp_no, e.last_name, e.first_name, e.sex, s.salary
From employees e
Left Join salaries s
	On e.emp_no = s.emp_no

Select e.first_name, e.last_name, e. hire_date
From employees e
Where hire_date Between '1986-01-01' AND '1986-12-31'

Select dm.dept_no, d.dept_name, e.emp_no, e.last_name, e.first_name
From dept_manager dm
Join departments d
	On dm.dept_no = d.dept_no
Join employees e
	On e.emp_no = dm.emp_no

Select e.first_name, e.last_name, e.sex
From employees e
Where e.first_name = 'Hercules'
AND e.last_name Like 'B%'

Select e.emp_no, e.last_name, e.first_name
From employees e
Join dept_manager d
	on d.emp_no = e.emp_no
Join departments n
	on n.dept_no = d.dept_no
Where dept_name = 'Sales'

Select e.emp_no, e.last_name, e.first_name, n.dept_name
From employees e
Join dept_manager d
	on d.emp_no = e.emp_no
Join departments n
	on n.dept_no = d.dept_no
Where dept_name = 'Sales' OR dept_name = 'Development'

Select *
From employees

 SELECT last_name, count(last_name)
  FROM employees 
  GROUP BY last_name


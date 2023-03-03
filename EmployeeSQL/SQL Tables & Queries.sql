---Departments Table
CREATE TABLE departments(
	dept_no VARCHAR(30) NOT NULL PRIMARY KEY, 
	dept_name VARCHAR(30)
);

CREATE TABLE titles(
	title_id VARCHAR(5) NOT NULL PRIMARY KEY,
	title VARCHAR(30) NOT NULL
);

---Salaries Table
CREATE TABLE salaries(
	emp_no INT NOT NULL PRIMARY KEY,
	salary INT
);

---Employees Table
CREATE TABLE employees(
	emp_no INT NOT NULL PRIMARY KEY,
	emp_title VARCHAR(30) NOT NULL,
	birth_date DATE,
	first_name VARCHAR(30) NOT NULL,
	last_name VARCHAR(30) NOT NULL,
	sex VARCHAR(2) NOT NULL,
	hire_date DATE,
	FOREIGN KEY(emp_no) REFERENCES salaries(emp_no),
	FOREIGN KEY (emp_title) REFERENCES titles(title_id)
);


---Dept_Manager Table
CREATE TABLE dept_manager(
	dept_no VARCHAR(5) NOT NULL,
	emp_no INT NOT NULL,
	PRIMARY KEY(dept_no, emp_no)
);
	
---Dept Emp Table
CREATE TABLE dept_emp(
	emp_no INT NOT null,
	dept_no VARCHAR(30) NOT NULL,
	PRIMARY KEY (emp_no, dept_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);
	
--Data Queries --
SELECT * FROM departments
SELECT * FROM dept_emp
SELECT * FROM dept_manager
SELECT * FROM employees
SELECT * FROM salaries
SELECT * FROM titles

--1. List the employee number, last name, first name, sex, and salary of each employee.
SELECT a.emp_no, a.last_name, a.first_name, a.sex, b.salary
FROM employees a inner join salaries b
on a.emp_no = b.emp_no

--2.List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date >= '1986-01-01' and hire_date <= '1986-12-31'
ORDER BY hire_date ASC;

--3.List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT a.emp_no, a.last_name, a.first_name, c.dept_name
FROM employees a inner join dept_emp b on a.emp_no = b.emp_no
INNER JOIN departments C on b.dept_no = c.dept_no
ORDER BY emp_no ASC;

--4.List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT a.emp_no, a.last_name, a.first_name, c.dept_name
FROM employees a INNER JOIN dept_emp b on a.emp_no = b.emp_no
INNER JOIN departments c on b.dept_no = c.dept_no
ORDER BY emp_no ASC;

--5.List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%'
ORDER BY last_name ASC;

--6.List each employee in the Sales department, including their employee number, last name, and first name.
SELECT a.emp_no, a.last_name, a.first_name
FROM employees a INNER JOIN dept_emp b ON a.emp_no = b.emp_no
INNER JOIN departments c on b.dept_no = c.dept_no
WHERE c.dept_name = 'Sales'

--7.List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT
FROM

WHERE

--.8List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT last_name, COUNT(*) as "times_count"
FROM employees
GROUP BY last_name ORDER BY "times_count" DESC;

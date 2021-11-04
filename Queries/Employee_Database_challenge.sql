--Module 7 Challenge

-- Joining Employees and titles tables
SELECT Employees.emp_no,
     Employees.first_name,
     Employees.last_name,
     titles.title,
     titles.from_date,
     titles.to_date
INTO retirement_titles
FROM Employees
INNER JOIN titles
ON Employees.emp_no = titles.emp_no
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY Employees.emp_no

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no, to_date DESC;

-- Retrieve the number of about to retire employees by job title
SELECT COUNT(emp_no), title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY COUNT DESC;

-- Deliverable 2

SELECT DISTINCT ON (Employees.emp_no) Employees.emp_no,
     Employees.first_name,
     Employees.last_name,
     Employees.birth_date,
     dept_emp.from_date,
     dept_emp.to_date,
     titles.title
INTO mentorship_eligibility
FROM Employees
INNER JOIN titles
ON (Employees.emp_no = titles.emp_no)
INNER JOIN dept_emp
ON (Employees.emp_no = dept_emp.emp_no)
WHERE (birth_date BETWEEN '1965-01-01' AND '1965-12-31')
	AND (dept_emp.to_date = '9999-01-01')
ORDER BY Employees.emp_no
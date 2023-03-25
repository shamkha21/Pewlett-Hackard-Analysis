CREATE TABLE departments (
     dept_no VARCHAR(4) NOT NULL,
     dept_name VARCHAR(40) NOT NULL,
     PRIMARY KEY (dept_no),
     UNIQUE (dept_name)
);
CREATE TABLE employees ( 
	 emp_no INT NOT NULL,
     birth_date DATE NOT NULL,
     first_name VARCHAR NOT NULL,
     last_name VARCHAR NOT NULL,
     gender VARCHAR NOT NULL,
     hire_date DATE NOT NULL,
     PRIMARY KEY (emp_no)
); 
CREATE TABLE dept_manager (
dept_no VARCHAR(4) NOT NULL,
    emp_no INT NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL,
FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
    PRIMARY KEY (emp_no, dept_no)
);   
CREATE TABLE salaries (
  emp_no INT NOT NULL,
  salary INT NOT NULL,
  from_date DATE NOT NULL,
  to_date DATE NOT NULL,
  FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
  PRIMARY KEY (emp_no)
); 
Create Table titles ( 		 
	emp_no  INT NOT NULL,
	title   VARCHAR NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL, 
  	FOREIGN KEY (emp_no) REFERENCES employees (emp_no), 
	PRIMARY KEY (emp_no)
)  
Create Table titles ( 		 
	emp_no  INT NOT NULL,
	title   VARCHAR NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL, 
  	FOREIGN KEY (emp_no) REFERENCES employees (emp_no), 
	PRIMARY KEY (emp_no)
)  
CREATE TABLE Dept_Emp (
	dept_no varchar not null,
	emp_no int not null,
	from_date date not null, 
	to_date date not null, 
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no), 
	PRIMARY KEY (dept_no) 
) 
SELECT e.emp_no, 
		e.last_name, 
		e.first_name, 
		tit.title,  
		tit.from_date,  
		 tit.to_date  
INTO retirement_titles
FROM employees as e  
INNER JOIN titles as tit 
ON (e.emp_no)=(tit.emp_no) 
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-01-01')  
 
 SELECT DISTINCT ON (ret.emp_no) ret.emp_no,
        ret.last_name,
        ret.first_name,
        ret.title 
INTO unique_titles
FROM retirement_titles as ret
WHERE to_date = '9999-01-01'
ORDER BY ret.emp_no ASC; 
 
SELECT COUNT(title), title
INTO retiring_titles
FROM unique_titles 
GROUP BY title 
ORDER BY title DESC  
 
SELECT DISTINCT ON (em.emp_no) em.emp_no, em.first_name, em.last_name, em.birth_date, 
dem.from_date, dem.to_date, ti.title 
INTO mentorship_eligibilty
FROM employees as em 
INNER JOIN dept_emp as dem 
ON em.emp_no = dem.emp_no 
INNER JOIN titles as ti 
ON em.emp_no = ti.emp_no 
WHERE (ti.to_date = '9999-01-01' ) AND  
(em.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY emp_no 


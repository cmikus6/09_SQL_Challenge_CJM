--List the following details of each employee: employee number, last name, first name, sex, and salary.

select emp.emp_no as "employee number",
	emp.last_name as "last name",
	emp.first_name as "first name",
	emp.sex as "sex",
	cast(sal.salaries as money) as "salary"
from employees emp
	inner join salaries sal
		on sal.emp_no = emp.emp_no;


--List first name, last name, and hire date for employees who were hired in 1986.

select emp.first_name as "first name",
	emp.last_name as "last name",
	emp.hire_date as "date hired"
from employees emp
where extract(year from cast(emp.hire_date as date)) = '1986';

--List the manager of each department with the following information: department number, department name, 
--the manager's employee number, last name, first name.

select man.dept_no as "department number",
	dep.dept_name as "department name",
	emp.emp_no as "employee number",
	emp.last_name as "last name",
	emp.first_name as "first name"
from dept_manager man
	inner join departments dep
		on dep.dept_no = man.dept_no
	inner join employees emp
		on emp.emp_no = man.emp_no; 
	
--List the department of each employee with the following information: employee number, last name, 
--first name, and department name.

select emp.emp_no as "employee number",
	emp.last_name as "last name",
	emp.first_name as "first name",
	dn.dept_name as "department name"
from employees emp
	inner join dept_emp dep
		on dep.emp_no = emp.emp_no
	inner join departments dn
		on dn.dept_no = dep.dept_no;
		
--List first name, last name, and sex for employees whose first name is "Hercules" 
--and last names begin with "B."

select emp.first_name as "first name",
	emp.last_name as "last name",
	emp.sex as "sex"
from employees emp
where emp.first_name = 'Hercules'
	and upper(emp.last_name) like 'B%';

--List all employees in the Sales department, including their employee number, last name, 
--first name, and department name.

select emp.emp_no as "employee number",
	emp.last_name as "last name",
	emp.first_name as "first name",
	dn.dept_name as "department name"
from employees emp
	inner join dept_emp dep
		on dep.emp_no = emp.emp_no
	inner join departments dn
		on dn.dept_no = dep.dept_no
where dn.dept_name = 'Sales';
	
--List all employees in the Sales and Development departments, including their employee number, 
--last name, first name, and department name.

select emp.emp_no as "employee number",
	emp.last_name as "last name",
	emp.first_name as "first name",
	dn.dept_name as "department name"
from employees emp
	inner join dept_emp dep
		on dep.emp_no = emp.emp_no
	inner join departments dn
		on dn.dept_no = dep.dept_no
where dn.dept_name in ('Sales', 'Development');

--In descending order, list the frequency count of employee last names, 
--i.e., how many employees share each last name.

select last_name as "last name",
	count(last_name) as "name count"
from employees
group by last_name
order by count(last_name) desc;
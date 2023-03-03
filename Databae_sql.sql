1.Find the N th Salary from the Employee Table.
===============================================
use test;
select salary from employee order by salary desc;

//using MAX() Function
//2 nd Highest Salary
select MAX(salary) from employee where salary <(select MAX(salary) from employee); 
//3 rd Highest Salary
select MAX(salary) from employee where salary < (select MAX(salary) from employee where 
salary < (select MAX(salary) from employee));

//using limit clause
//2 nd Highest Salary
select distinct(salary) from employee order by salary desc 
limit 1,1;
//3 rd Highest Salary
select distinct(salary) from employee order by salary desc 
limit 2,1;

//using self-join
//3 rd highest salary
select Distinct(salary) from employee e1
Where 3-1=(select count(Distinct salary) from employee e2
where e1.salary > e2.salary);

//2.Understanding the Group By Clause with example.
====================================================
Where -> Group By -> Having -> Order By
a.Find the Sum of the salary of each department from employee_info table ?

select SUM(salary) , department from employee_info group by department;

 b.Find the SUM of salary of each department from employee_info table and also arrange the result in 
    ascending order according to the department.
select SUM(salary) , department from employee_info 
group by department order by department asc;
c.Find the sum of salary of each department from employee_info table where sum of salary more than 17000.
select department,SUM(salary) from employee_info 
group by department having sum(salary) > 17000;
 d. Find the sum of salary of each department except 'Admin' from employee_info table where sum of
     salary more than 17000 ?  
select department,SUM(salary) from employee_info
where department!='Admin' group by department 
having SUM(salary) > 17000;    
e.Find the number of same subject in same semister ? 
select subject, semester ,count(*) from student
group by subject,semester;

//3.Write a sql query to find the duplicate row in the table ?
==============================================================

select * , count(department) from employee_info 
group by department having count(department)>1;

//4.Write a query to find the even and odd record from the table ?
==================================================================

//Even records
select * from employee_info where mod(id,2)=0;

//Odd records
select * from employee_info where MOD(id,2)=1;

//5.Write a query to display first and last record from the table ? 

//First record
select * from employee_info where id=(select MIN(id) from employee_info);

//Last record
select * from employee_info where id=(select MAX(id) from employee_info);

//6.Write a query to retrive list of employee working on the same departments ? 

select e1.id,e1.name,e1.email from employee_info e1 , employee_info e2
where e1.department=e2.department AND e1.id!=e2.id;

//7.Write a query to fetch details of employees whoes EmpLname ends with an alphabets 'a' and contains five alphabets ?
select * from employee_info where name LIKE 'a%';


select * from employee_info;

select * from employee_info where name LIKE '%R__';


-- Q-1. Write an SQL query to fetch “FIRST_NAME” from Worker table using the alias name as <WORKER_NAME>.
SELECT FIRST_NAME AS WORKER_NAME FROM WORKER;

-- Q-2. Write an SQL query to fetch “FIRST_NAME” from Worker table in upper case.
SELECT UPPER(FIRST_NAME) FROM WORKER;

-- Q-3. Write an SQL query to fetch unique values of DEPARTMENT from Worker table.
SELECT DISTINCT DEPARTMENT FROM WORKER;
-- GROUP BY
SELECT DEPARTMENT FROM WORKER GROUP BY DEPARTMENT;

-- Q-4. Write an SQL query to print the first three characters of  FIRST_NAME from Worker table.
SELECT substring(FIRST_NAME, 1, 3) FROM WORKER;

-- Q-5. Write an SQL query to find the position of the alphabet (‘b’) in the first name column ‘Amitabh’ from Worker table.
SELECT INSTR(FIRST_NAME, 'B') FROM WORKER WHERE FIRST_NAME = 'AMITABH';

-- Q-6. Write an SQL query to print the FIRST_NAME from Worker table after removing white spaces from the right side.
SELECT rtrim(FIRST_NAME) FROM WORKER;

-- Q-7. Write an SQL query to print the DEPARTMENT from Worker table after removing white spaces from the left side.
SELECT ltrim(FIRST_NAME) FROM WORKER;

-- Q-8. Write an SQL query that fetches the unique values of DEPARTMENT from Worker table and prints its length.
SELECT DISTINCT DEPARTMENT, LENGTH(DEPARTMENT) FROM WORKER;

-- Q-9. Write an SQL query to print the FIRST_NAME from Worker table after replacing ‘a’ with ‘A’.
SELECT REPLACE(FIRST_NAME, 'a', 'A') FROM WORKER;

-- Q-10. Write an SQL query to print the FIRST_NAME and LAST_NAME from Worker table into a single column COMPLETE_NAME.
-- A space char should separate them.
SELECT concat(FIRST_NAME, ' ' , LAST_NAME) AS COMPLETE_NAME FROM WORKER;

-- Q-11. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending.
SELECT * FROM WORKER order by FIRST_NAME;

-- Q-12. Write an SQL query to print all Worker details from the Worker table order by 
-- FIRST_NAME Ascending and DEPARTMENT Descending.
SELECT * FROM WORKER ORDER BY FIRST_NAME ASC, DEPARTMENT DESC;

-- Q-13. Write an SQL query to print details for Workers with the first name as “Vipul” and “Satish” from Worker table.
SELECT * FROM WORKER WHERE FIRST_NAME = 'Vipul' or first_name = 'Satish';
-- method 2
SELECT * FROM WORKER WHERE FIRST_NAME IN ('Satish', 'Vipul');

-- Q-14. Write an SQL query to print details of workers excluding first names, “Vipul” and “Satish” from Worker table.
SELECT * FROM WORKER WHERE FIRST_NAME NOT IN ('Satish', 'Vipul');

-- Q-15. Write an SQL query to print details of Workers with DEPARTMENT name as “Admin*”.
Select * from worker where department = 'Admin';

-- Q-16. Write an SQL query to print details of the Workers whose FIRST_NAME contains ‘a’.
select * from worker where FIRST_NAME like '%a%';

-- Q-17. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘a’.
select * from worker where FIRST_NAME like '%a';

-- Q-18. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and contains six alphabets.
select * from worker where FIRST_NAME like '_____h';

-- Q-19. Write an SQL query to print details of the Workers whose SALARY lies between 100000 and 500000.
select * from worker where salary between 100000 AND 500000;

-- Q-20. Write an SQL query to print details of the Workers who have joined in Feb’2014.
SELECT * FROM WORKER WHERE year(joining_date) = 2014 and month(joining_date) = 02;

-- Q-21. Write an SQL query to fetch the count of employees working in the department ‘Admin’.
select count(worker_id), department from worker where department = 'Admin';
-- 2nd method
select department, count(*) from worker where department = 'Admin';

-- Q-22. Write an SQL query to fetch worker full names with salaries >= 50000 and <= 100000.
select concat(first_name, ' ', last_name) as full_name, salary from worker where salary between 500000 and 1000000;

-- Q-23. Write an SQL query to fetch the no. of workers for each department in the descending order.
SELECT DEPARTMENT, COUNT(worker_id) from worker group by department order by count(worker_id) desc;

-- Q-24. Write an SQL query to print details of the Workers who are also Managers.
SELECT w.* from worker as w inner join title as t on w.worker_id = t.WORKER_REF_ID where t.worker_title = 'Manager';

-- Q-25. Write an SQL query to fetch number (more than 1) of same titles in the ORG of different types.
SELECT WORKER_TITLE, count(*) from title group by worker_title having count(*) > 1;

-- Q-26. Write an SQL query to show only odd rows from a table.
select * from worker where MOD (WORKER_ID, 2) != 0; 

-- Q-27. Write an SQL query to show only even rows from a table. 
select * from worker where MOD (WORKER_ID, 2) = 0; 

-- Q-28. Write an SQL query to clone a new table from another table.
create table worker_clone like worker;
insert into worker_clone select * from worker;

-- Q-29. Write an SQL query to fetch intersecting records of two tables.
select * from worker inner join worker_clone using (worker_id);

-- Q-30. Write an SQL query to show records from one table that another table does not have.
-- MINUS
select * from worker left join worker_clone using (worker_id) where worker_id is null;

-- Q-31. Write an SQL query to show the current date and time.
-- DUAL
select current_date();
select now();

-- Q-32. Write an SQL query to show the top n (say 5) records of a table order by descending salary.
select * from worker order by salary desc limit 5;

-- Q-33. Write an SQL query to determine the nth (say n=5) highest salary from a table.
-- limit 5, 1 gives the 6th highest salary
select * from worker order by salary desc limit 5, 1;

-- Q-34. Write an SQL query to determine the 5th highest salary without using LIMIT keyword.
select * from worker w1 where 4 = ( select count(distinct (w2.salary))
from worker w2
where w2.salary = w1.SALARY);

-- Q-35. Write an SQL query to fetch the list of employees with the same salary.
select * from worker w1, worker w2 where w1.salary=w2.salary and w1.worker_id != w2.worker_id;

-- Q-36. Write an SQL query to show the second highest salary from a table using sub-query.
select max(salary) from worker
where salary not in(select max(SALARY) from worker);

-- Q-37. Write an SQL query to show one row twice in results from a table.
select * from worker
union all
select * from worker order by worker_id;

-- Q-38. Write an SQL query to list worker_id who does not get bonus.
select worker_id from worker where worker_id not in (select worker_ref_id from bonus);


-- Q-39. Write an SQL query to fetch the first 50% records from a table.
select * from worker where worker_id<=(select count(WORKER_ID)/2 from worker);

-- Q-40. Write an SQL query to fetch the departments that have less than 4 people in it.
select department, count(department) as depcount from worker group by DEPARTMENT having depcount<4;

-- Q-41. Write an SQL query to show all departments along with the number of people in there.
select department, count(department) as depcount from worker group by DEPARTMENT;

-- Q-42. Write an SQL query to show the last record from a table.
select * from worker where WORKER_ID = (select max(WORKER_ID) from worker);

-- Q-43. Write an SQL query to fetch the first row of a table.
select * from worker where WORKER_ID = (select min(WORKER_ID) from worker);

-- Q-44. Write an SQL query to fetch the last five records from a table.
(select * from worker order by WORKER_ID desc limit 5 ) order by worker_id;

-- Q-45. Write an SQL query to print the name of employees having the highest salary in each department.
SELECT w.DEPARTMENT, w.FIRST_NAME, w.salary
FROM (SELECT MAX(salary) AS maxsal, department FROM worker GROUP BY DEPARTMENT) temp
INNER JOIN worker w ON temp.department = w.department AND temp.maxsal = w.salary;

-- Q-46. Write an SQL query to fetch three max salaries from a table using co-related subquery
select distinct salary from worker w1
where 3>= (select count(distinct salary) from worker w2 where w1.salary <=w2.salary) order by w1.SALARY desc;

-- Q-47. Write an SQL query to fetch three min salaries from a table using co-related subquery
select distinct salary from worker w1
where 3>= (select count(distinct salary) from worker w2 where w1.salary >=w2.salary) order by w1.SALARY desc;

-- Q-48. Write an SQL query to fetch nth max salaries from a table.
select distinct salary from worker w1
where n>= (select count(distinct salary) from worker w2 where w1.salary <=w2.salary) order by w1.SALARY desc;

-- Q-49. Write an SQL query to fetch departments along with the total salaries paid for each of them.
select department, sum(salary) as depsal from worker group by department order by depsal desc;

-- Q-50. Write an SQL query to fetch the names of workers who earn the highest salary.
select first_name, salary from worker where salary = (select max(SALARY) from worker);

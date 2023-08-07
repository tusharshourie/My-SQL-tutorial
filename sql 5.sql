USE temp;
CREATE TABLE DEPT1(
empid INT PRIMARY KEY NOT NULL,
name VARCHAR(255),
role VARCHAR(255));

CREATE TABLE DEPT2(
empid INT PRIMARY KEY NOT NULL,
name VARCHAR(255),
role VARCHAR(255));

INSERT INTO DEPT1 
VALUES(1, 'A', 'engineer'),
	  (2, 'B', 'salesman'),
      (3, 'C', 'manager'),
      (4, 'D', 'salesman'),
      (5, 'E', 'engineer');

INSERT INTO DEPT2
VALUES(3, 'C', 'manager'),
      (6, 'F', 'marketing'),
      (7, 'E', 'salesman');
      
SELECT * FROM DEPT1;
SELECT * FROM DEPT2;

-- SET OPERATIONS

-- List out all the employees in the company
SELECT * FROM DEPT1
UNION 
SELECT * FROM DEPT2;

-- List out all the employees from all the dept who work as salesman
 SELECT * FROM DEPT1 WHERE role ='salesman'
 UNION
 SELECT * FROM DEPT2 WHERE role ='salesman';
 
 -- INTEERSECT
 -- list out all the employees who work for both the departments
 SELECT * FROM DEPT1 INNER JOIN DEPT2 USING (empid);
 
 -- list out the emp who work in dept1 but not in dept2
 -- MINUS
 SELECT * FROM DEPT1 LEFT JOIN DEPT2 USING (empid)
 WHERE DEPT2.empid is null;
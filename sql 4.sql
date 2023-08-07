USE temp;
CREATE TABLE EMPLOYEE(
ID INT PRIMARY KEY NOT NULL,
FNAME VARCHAR(255),
LNAME VARCHAR(255),
AGE INT,
EMAILID VARCHAR(255),
PHONENO INT,
CITY VARCHAR(255));

INSERT INTO EMPLOYEE
VALUES(1, 'AMAN', 'PROTO', 32, 'aman@gmail.com', 898, 'DELHI'),
(2, 'YAGYA', 'NARAYAN', 44, 'yagya@gmail.com', 222, 'PALAM'),
(3, 'RAHUL', 'BD', 22, 'rahul@gmail.com', 444, 'KOLKATA'),
(4, 'JATIN', 'HERMIT', 31, 'jatin@gmail.com', 666, 'RAIPUR'),
(5, 'PK', 'PANDEY', 21, 'pk@gmail.com', 555, 'JAIPUR');


CREATE TABLE CLIENT(
ID INT PRIMARY KEY NOT NULL,
F_NAME VARCHAR(255),
L_NAME VARCHAR(255),
AGE INT,
EMAILID VARCHAR(255),
PHONENO INT,
CITY VARCHAR(255),
empID INT,
FOREIGN KEY (empID) REFERENCES EMPLOYEE(ID) on delete CASCADE
);

INSERT INTO CLIENT
VALUES(1, 'MAC', 'ROGERS', 47, 'mac@gmail.com', 333, 'KOLKATA', 3),
(2, 'MAX', 'POIRIER', 27, 'max@gmail.com', 221, 'KOLKATA', 3),
(3, 'PETER', 'JAIN', 24, 'peter@gmail.com', 111, 'DELHI', 1),
(4, 'SUSHANT', 'AGARWAL', 23, 'sushant@gmail.com', 45454, 'HYDERABAD', 5),
(5, 'PRADEEP', 'SHARMA', 39, 'p@gmail.com', 77767, 'MUMBAI', 2);


CREATE TABLE PROJECT(
ID INT PRIMARY KEY not null,
empID int,
NAME CHAR (2),
STARTDATE DATE,
ClientID int,
FOREIGN KEY (ClientID) REFERENCES CLIENT(ID) ON DELETE CASCADE,
FOREIGN KEY (empID) REFERENCES EMPLOYEE(ID) ON DELETE CASCADE);

INSERT INTO PROJECT VALUES
(1, 1, 'A', '2021-04-21', 3),
(2, 2, 'B', '2021-04-21', 1),
(3, 3, 'C', '2021-01-16', 5),
(4, 3, 'D', '2021-04-27', 2),
(5, 5, 'E', '2021-05-01', 4);

SELECT * FROM EMPLOYEE;
SELECT * FROM CLIENT;
SELECT * FROM PROJECT;


-- INNER JOIN
-- ENLIST ALL THE EMPLOYEES ID NAME ALONG WITH PROJECT ALLOCATED TO THEM
SELECT e.ID, e.FNAME, e.LNAME, p.ID, p.NAME FROM EMPLOYEE AS e
INNER JOIN PROJECT AS p  on e.ID=P.empID;

-- fetch out all the emp ids and their contact details who have been working
-- from jaipur with clients name wotking in hyderabad
SELECT e.ID, e.PHONENO, e.EMAILID, c.F_NAME, c.L_NAME FROM EMPLOYEE AS e
INNER JOIN CLIENT as c on e.ID = c.empID WHERE e.CITY ='JAIPUR' AND c.CITY = 'HYDERABAD';

-- LEFT JOIN
-- FETCH OUT EACH PROJECT ALLOCATED TO EACH EMPLOYEE
SELECT * FROM EMPLOYEE AS e LEFT JOIN PROJECT AS p on e.id=p.empID;

-- RIGHT JOIN
-- LIST OUT ALL THE PROJECTS ALONG WITH EMPLOYEES NAME AND THEIR RESPECTIVE ALLOCATED EMAIL IDS
SELECT P.id, p.NAME, p.STARTDATE, e.FNAME, e.LNAME, e.EMAILID FROM PROJECT AS p
RIGHT JOIN EMPLOYEE AS e on p.empID = e.ID;

-- CROSS JOIN
-- LIST OUT ALL THE COMBINATIONS POSSIBLE FOR THE EMP NAME AND PROJECTS THAT CAN EXIT
SELECT e.FNAME, e.LNAME, p.ID, p.NAME, p.STARTDATE FROM EMPLOYEE AS e
CROSS JOIN PROJECT AS p;

-- JOIN WITHOUT USING THE JOIN KEYWORD
SELECT * FROM EMPLOYEE AS e, PROJECT AS p WHERE e.id=p.empID;


-- SUB QUERIES
-- WHERE CLAUSE
-- emp with age > 30
SELECT * FROM EMPLOYEE WHERE AGE IN (SELECT AGE FROM EMPLOYEE WHERE AGE>30);

-- WHERE CLAUSE DIFF TABLE
-- Emp details working in more than 1 project
SELECT * FROM EMPLOYEE WHERE ID IN ( SELECT empID FROM PROJECT GROUP BY empID HAVING COUNT(empID)>1);

-- single value subquery
-- emp with age > avg age
select * from employee where age > (select avg(age) from employee)

-- from clause
-- select max age person whose first name has a
SELECT MAX(age) FROM (SELECT * FROM employee WHERE fname LIKE '%a%') AS subquery;

-- corelated subquery
-- find 3rd oldest employee
select * from employee e1 where 3 = (
select count(e2.age) from employee e2
where e2.age >= e1.age);

-- VIEW
SELECT * FROM EMPLOYEE;

-- CREATING A VIEW
CREATE VIEW CUSTOM_VIEW AS SELECT FNAME, AGE FROM EMPLOYEE;

-- VIEWING FROM VIEW
SELECT * FROM CUSTOM_VIEW;

-- ALTERING A VIEW
ALTER VIEW CUSTOM_VIEW AS SELECT FNAME, LNAME, AGE FROM EMPLOYEE;

-- DROPPING A VIEW
DROP VIEW IF EXISTS CUSTOM_VIEW;
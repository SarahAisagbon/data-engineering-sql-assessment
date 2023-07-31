"""
CREATE DATABASE SCRIPT FOR MYHOMES DATABASE
"""

DROP DATABASE IF EXISTS myhomes;
CREATE DATABASE IF NOT EXISTS myhomes;
USE myhomes;
SELECT 'CREATING DATABASE STRUCTURE' as 'INFO'; DROP TABLE IF EXISTS 
employees,
teams,
supervisors,
areas,
emp_areas,
properties,
customers,
regulations,
property_reg;

CREATE TABLE employees (
  emp_no INT NOT NULL,
  birth_date DATE NOT NULL,
  first_name VARCHAR(14) NOT NULL,
  last_name VARCHAR(16) NOT NULL,
  gender ENUM ('M','F') NOT NULL,
  hire_date DATE NOT NULL,
  PRIMARY KEY (emp_no)
);

CREATE TABLE teams (
  team_id CHAR(4),
  emp_no INT NOT NULL,
  PRIMARY KEY (team_id, emp_no)
);

CREATE TABLE supervisors (
  super_id CHAR(4), 
  super_emp_no INT NOT NULL, 
  team_id CHAR(4) NOT NULL,
  from_date DATE NOT NULL, 
  to_date DATE NOT NULL, 
  PRIMARY KEY (super_id, super_emp_no, team_id)
);

CREATE TABLE areas (
  area_id CHAR(4) NOT NULL,
  area_name VARCHAR(14) NOT NULL,
  chief_emp_no INT NOT NULL,
  performance INT NOT NULL,
  target INT NOT NULL,
  PRIMARY KEY (area_id, chief_emp_no)
);

CREATE Table emp_areas (
  area_id CHAR(4),
  emp_no INT,
  PRIMARY KEY (area_id, emp_no)
);

CREATE TABLE properties (
  property_id CHAR(4) NOT NULL,
  type VARCHAR(20),
  address VARCHAR(120) NOT NULL,
  area_id CHAR(4) NOT NULL,
  salesrep_no INT NOT NULL,
  price INT,
  PRIMARY KEY (property_id, salesrep_no, area_id),
  UNIQUE KEY (address)
);

CREATE TABLE customers (
  customer_id CHAR(6) NOT NULL,
  first_name VARCHAR(14) NOT NULL,
  last_name VARCHAR(16) NOT NULL,
  gender ENUM ('M','F') NOT NULL,
  price INT,
  salesrep_no INT NOT NULL,
  service VARCHAR(5) NOT NULL,
  PRIMARY KEY (customer_id, salesrep_no)
);

CREATE TABLE regulations (
  reg_id VARCHAR(6) NOT NULL,
  reg_name VARCHAR(50) NOT NULL,
  PRIMARY KEY (reg_id),
  UNIQUE KEY (reg_name) 
);

CREATE TABLE property_reg (
  property_id CHAR(4),
  reg_id VARCHAR(6),
  PRIMARY KEY (property_id, reg_id)
);

ALTER TABLE teams ADD FOREIGN KEY (emp_no) REFERENCES employees (emp_no);

ALTER TABLE supervisors ADD FOREIGN KEY (team_id) REFERENCES teams (team_id);

ALTER TABLE supervisors ADD FOREIGN KEY (super_emp_no) REFERENCES employees (emp_no);

ALTER TABLE areas ADD FOREIGN KEY (chief_emp_no) REFERENCES employees (emp_no);

ALTER TABLE emp_areas ADD FOREIGN KEY (area_id) REFERENCES areas (area_id);

ALTER TABLE emp_areas ADD FOREIGN KEY (emp_no) REFERENCES employees (emp_no);

ALTER TABLE properties ADD FOREIGN KEY (area_id) REFERENCES areas (area_id);

ALTER TABLE properties ADD FOREIGN KEY (salesrep_no) REFERENCES employees (emp_no);

ALTER TABLE customers ADD FOREIGN KEY (salesrep_no) REFERENCES employees (emp_no);

ALTER TABLE property_reg ADD FOREIGN KEY (property_id) REFERENCES properties (property_id);

ALTER TABLE property_reg ADD FOREIGN KEY (reg_id) REFERENCES regulations (reg_id);

"""
INSERT INTO SCRIPT FOR MYHOMES DATABASE
"""

INSERT INTO employees VALUES (10001, '1988-06-28', 'Oscar', 'Smith', 'M', '2008-01-02'), 
(10002, '1990-10-10', 'Angela', 'James', 'F', '2018-12-01'),
(10003, '1983-06-06', 'Aidah', 'McMit', 'F', '1998-12-01'),
(10004, '1998-07-01', 'Sarah', 'Williams', 'F', '2019-09-21'),
(10005, '1992-05-12', 'Emma', 'Khan', 'F', '2013-10-04'),
(10006, '1989-01-08', 'Paul', 'Waters', 'M', '2004-09-16'),
(10007, '1991-09-14', 'Teddy', 'Do', 'F', '2009-06-28'), 
(10008, '1997-07-08', 'Carlos', 'Santana', 'M', '2016-09-12'),
(10009, '1985-11-11', 'Salvatore', 'Gotti', 'M', '2000-03-10'),
(10010, '1999-02-14', 'Daire', "O'Conner", 'F', '2020-09-16');

INSERT INTO teams VALUES ('t001', 10001),
('t001', 10004),
('t002', 10005), 
('t002', 10007),
('t002', 10008),
('t003', 10002),
('t003', 10010);

INSERT INTO supervisors VALUES ('s001', 10003, 't001', '2011-12-01', '9999-01-01'),
('s002', 10006, 't002', '2012-12-10', '2015-10-10'), 
('s003', 10009, 't003', '2009-07-01', '2022-12-10');

INSERT INTO areas VALUES ('a001', 'Rotherhithe', 10003, 5000000, 6000000),
('a002', 'Peckham', 10001, 2500000, 2000000),
('a003', 'Deptford', 10004, 2000000, 3500000), 
('a004', 'Lewisham', 10007, 3500000, 2000000),
('a005', 'Bermondsey', 10010, 500000, 300000),
('a006', 'Surrey Quays', 10005, 6000000, 6000000),
('a007', 'New Cross', 10008, 4550000, 6000000),
('a008', 'East Dulwich', 10002, 6000000, 4000000);

INSERT INTO emp_areas VALUES ('a001', 10002),
('a001', 10003),
('a002', 10001),
('a003', 10004),
('a004', 10007),
('a004', 10010),
('a005', 10010),
('a005', 10006),
('a005', 10002),
('a006', 10005),
('a007', 10009),
('a007', 10008),
('a008', 10002);

INSERT INTO properties VALUES ('p001', 'house', 'Eleanor Close, SE16 7JE','a001', 10002, 550000),
('p002', 'flat', 'Flat 12 Amber House, SE16 4RT', 'a005', 10010, 450000),
('p003', 'bunglow', 'Silvester Road, SE22 9PF', 'a008', 10002, 700000),
('p004', 'land', '70-72 Pentonville Road, SE14 5AG', 'a007', 10009, 1500000),
('p005', 'commercial_property','Unit 6, Elizabeth Industrial Estate, SE14 5RW' , 'a006', 10005, 1000000),
('p006', 'house', 'Pepys Road, SE14 5SE', 'a007', 10009, 650000),
('p007', 'flat', 'Elm Grove, SE15 5DE', 'a002', 10001, 475000),
('p008', 'commercial_property', '901-903 Upland Road, SE22 0DP' , 'a008', 10002, 1200000);

INSERT INTO customers VALUES 
('c0001', 'Beyonce', 'Knowles', 'F', 450000, 10002, 'buy'),
('c0002', 'Rihanna', 'Fenty', 'F', NULL, 10006, 'sell'),
('c0003', 'Lebron', 'James', 'M', NULL, 10004, 'sell'),
('c0004', 'Cristiano', 'Ronaldo', 'M', 1000000, 10008, 'buy'),
('c0005', 'Kylian', 'Mbappe', 'F', 3000000, 10005, 'buy'), 
('c0006', 'Bukayo', 'Saka', 'M', NULL, 10010, 'sell'),
('c0007', 'Ed', 'Sheeran', 'M', NULL, 10007, 'sell'),
('c0008', 'Zayn', 'Malik', 'F', NULL, 10009, 'sell');

INSERT INTO regulations VALUES ('BS22', 'Building Safety Act'),
('FS22', 'Fire Safety Act'),
('WS', 'Water Safety'),
('ES', 'Electrical Safety'),
('GSIU', 'Gas Safety (Installation & Use) Regulation 1998'),
('MEES', 'Minimum Energy Efficiency Standard'),
('RRFS', 'Regulatory Reform (Fire Safety) Order 2005');

INSERT INTO property_reg VALUES ('p001', 'BS22'),
('p001', 'FS22'),
('p002', 'FS22'),
('p002', 'WS'),
('p002', 'ES'),
('p003', 'BS22'),
('p003', 'FS22'),
('p003', 'WS'),
('p005', 'ES'),
('p005', 'MEES'),
('p005', 'RRFS'),
('p005', 'GSIU'),
('p007', 'BS22'),
('p007', 'GSIU'),
('p007', 'ES'),
('p008', 'MEES'),
('p008', 'RRFS'),
('p008', 'GSIU');

"""
1. Display names of representatives, details of the properties they represent, and names of their supervisors.
"""

WITH emp_prop AS
(SELECT CONCAT(e.first_name, ' ', e.last_name) AS full_name, p.*
FROM employees e
LEFT JOIN properties p ON p.salesrep_no = e.emp_no),
super_name AS
(SELECT s.super_id, CONCAT(e.first_name, ' ', e.last_name) AS full_name, s.team_id
FROM supervisors s
INNER JOIN employees e ON e.emp_no = s.super_emp_no),
team_details AS
(SELECT sn.super_id, sn.full_name AS supervisor_name, CONCAT(e.first_name, ' ', e.last_name) AS team_full_name
FROM super_name sn
INNER JOIN teams t ON t.team_id= sn.team_id
INNER JOIN employees e ON e.emp_no = t.emp_no)

SELECT ep.*, td.supervisor_name FROM emp_prop ep
LEFT JOIN team_details td ON td.team_full_name = ep.full_name
ORDER BY full_name;

"""
2. Display details of customers together with details of their areas and names of the managers of their areas.
"""

WITH area_info AS
(SELECT c.*, a.*
FROM customers c 
LEFT JOIN employees e ON e.emp_no = c.salesrep_no
INNER JOIN emp_areas ea ON ea.emp_no = e.emp_no
INNER JOIN areas a ON a.area_id = ea.area_id)

SELECT ai.*, CONCAT(e.first_name, ' ', e.last_name) AS chief_full_name 
FROM area_info ai
INNER JOIN employees e ON e.emp_no = ai.chief_emp_no;
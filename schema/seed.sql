DROP DATABASE IF EXISTS company_db;
CREATE DATABASE company_db;
USE company_db;

CREATE TABLE department (
  id int NOT NULL AUTO_INCREMENT,
  name varchar(64) NOT NULL,
  PRIMARY KEY (id)
);
CREATE TABLE employee_role (
  id int NOT NULL AUTO_INCREMENT,
  title varchar(64),
  department_id int,
  PRIMARY KEY (id)
);
CREATE TABLE employee (
  id int NOT NULL AUTO_INCREMENT,
  first_name varchar(32) NOT NULL,
  last_name varchar(32) NOT NULL,
  role_id int,
  manager_id int,
  PRIMARY KEY (id)
);
INSERT INTO department (id, name) values 
	(1, 'Aviation'),
    (2, 'Aeronautics'),
    (3, 'Deep-Sea Exploration'),
    (4, 'Space Exploration'),
    (5, 'DNA Sequencing'),
    (6, 'Biology'),
    (7, 'Security');

insert into employee_role (id, title, department_id) VALUES
(1, 'Director of Aviation', 1),
(2, 'Assistant Director of Airport Operations', 1),
(3, 'Line Tech Operator', 1),
(4, 'Pilot', 1),
(5, 'Director of Aeronautics', 2),
(6, 'Plane Engineer', 2),
(7, 'Space Shuttle Engineer', 2),
(8, 'Scuba Diver', 3),
(9, 'Director of Scuba', 3),
(10, 'Astronaut', 4),
(11, 'Director of Space Missions', 4),
(12, 'DNA Specialist', 5),
(13, 'Director of Research', 5),
(14, 'Primatologist', 6),
(15, 'Biological Researcher', 6),
(16, 'Director of Biological Research', 6),
(17, 'Security Guard', 7),
(18, 'Security Manager', 7);

insert into employee (id, first_name, last_name, role_id) VALUES
(1, 'Bill', 'Rogers', 1),
(2, 'Maureen', 'Joyce', 2),
(3, 'Patrick', 'Dalton', 14),
(4, 'Jim', 'Johnson', 3),
(5, 'Catherine', 'Wohl', 11),
(6, 'Michael', 'Wohl', 10),
(7, 'Arthur', 'Thompson', 4),
(8, 'Wilbur', 'Witherspoon', 5),
(9, 'Daniel', 'Butkus', 6),
(10, 'Thomas','Janesson', 6),
(11, 'Arthur', 'Wayne', 7),
(12, 'Tim','Wilson', 7),
(13, 'Tony','Albertson', 8),
(14, 'Deep', 'Waters', 9), 
(15, 'Tony', 'Froggerson', 10), 
(16, 'Neil', 'Armstrong', 10), 
(17, 'Alfred', 'Hollywood', 11), 
(18, 'Dink', 'Smallwood', 12), 
(19, 'Aliotta', 'Haynes', 12), 
(20, 'Chia', 'Petterson', 13), 
(21, 'Tiki', 'Torchwood', 15),
(22, 'Wink', 'Wilson', 16), 
(23, 'Buff', 'Chunkson', 17), 
(24, 'Roll', 'Fizzlebeef', 17), 
(25, 'Rock', 'Johnson', 17), 
(26, 'John', 'Johnson', 15), 
(27, 'Anthony', 'Williams', 4), 
(28, 'Brian', 'Guy', 7), 
(29, 'Beef', 'McHardbody', 17),
(30, 'Chad', 'Jones', 8), 
(31, 'Dennis', 'Woods', 8), 
(32, 'Chunk', 'Hornwood', 18),
(33, 'Dwayne', 'Holly', 3),
(34, 'Ned', 'Gondry', 10);

UPDATE employee 
join employee_role on employee_role.id = employee.role_id
SET manager_id = 1 where department_id = 1;

UPDATE employee 
join employee_role on employee_role.id = employee.role_id
SET manager_id = 8 where department_id = 2;

UPDATE employee 
join employee_role on employee_role.id = employee.role_id
SET manager_id = 14 where department_id = 3;

UPDATE employee 
join employee_role on employee_role.id = employee.role_id
SET manager_id = 17 where department_id = 4;

UPDATE employee 
join employee_role on employee_role.id = employee.role_id
SET manager_id = 32 where department_id = 7;

UPDATE employee 
join employee_role on employee_role.id = employee.role_id
SET manager_id = 22 where department_id = 6;

select * from employee
join employee_role on employee_role.id = employee.role_id
join department on department_id = department.id
order by department_id asc;

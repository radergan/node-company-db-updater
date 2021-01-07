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
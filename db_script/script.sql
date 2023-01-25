DROP DATABASE IF EXISTS `ssisdb`;
CREATE DATABASE IF NOT EXISTS `ssisdb`;
USE `ssisdb`;

CREATE TABLE `admin`(
username VARCHAR(20) NOT NULL,
password VARCHAR(100) NOT NULL,
PRIMARY KEY(username)
);

INSERT INTO `admin`(`username`, `password`)
VALUES ('eden', 'sha256$ULUS96W3djTrRi7e$233ff68eb2b2c3593440e1d6c0dabaaea17a9f246328db4ab1f09d05f5929568');

CREATE TABLE `course`(
code VARCHAR(10) NOT NULL,
name VARCHAR(50) NOT NULL,
colleges VARCHAR(45) NOT NULL,
PRIMARY KEY(code)
);

CREATE TABLE `colleges`(
code VARCHAR(10) NOT NULL,
name VARCHAR(50) NOT NULL,
PRIMARY KEY(code)
);

CREATE TABLE `students`(
id VARCHAR(9) NOT NULL,
firstname VARCHAR(50) NOT NULL,
middlename VARCHAR(20) NOT NULL,
lastname VARCHAR(20) NOT NULL,
year INT(1) NOT NULL,
gender VARCHAR(10) NOT NULL,
coursecode VARCHAR(10) NOT NULL,
collegescode VARCHAR(10),
photo VARCHAR(500),
PRIMARY KEY(id),
FOREIGN KEY(coursecode) REFERENCES course(code),
FOREIGN KEY(collegescode) REFERENCES colleges(code)
);

INSERT INTO `colleges`(`code`, `name`)
VALUES ('CCS', 'colleges of Computer Studies'),
	   ('CSM', 'colleges of Science and Mathematics'),
       ('CASS', 'colleges of Arts and Social Sciences'),
       ('COET', 'colleges of Engineering and Technology'),
       ('CED', 'colleges of Education'),
       ('CON', 'colleges of Nursing');

INSERT INTO `course`(`code`, `name`, `colleges`)
VALUES ('BSCS', 'Bachelor of Science in Computer Science', 'CCS'),
	   ('BSIT', 'Bachelor of Science in Information Technology', 'CCS'),
       ('BSIS', 'Bachelor of Science in Information System', 'CCS'),
       ('BSCE', 'Bachelor of Science in Civil Engineering', 'COET'),
       ('BSChemEng', 'Bachelor of Science in Chemical Engineering', 'CCS');

ALTER SESSION SET current_schema = DT2112A1;

--DROP TABLES
Drop TABLE CLASSROOM;
DROP TABLE TEACHER;
DROP TABLE STUDENT;
drop TABLE SUBJECT;
DROP TABLE EXAM;
DROP TABLE QUESTION;
DROP TABLE REPORT;

/*
-- SOMEONES USED OUR SCEMA DROPS SAID TABLES
select * FROM all_tables where owner = 'DT2112A1';
drop table AUTOMATED_EXAM;
DROP TABLE LOG_IN;
DROP TABLE MEMBER;
DROP TABLE ACTUAL_EXAM;
*/

--CREATE TABLE
--report table 
CREATE TABLE REPORT(
Total_score NUMBER(5,2) NOT NULL,
Teacher_signature VARCHAR(50) not null,
Headmistress_signature VARCHAR(50) not null,
Subject_name VARCHAR(30),
STUDENT_NAME varchar(30) PRIMARY KEY
);

--QUESTION
CREATE TABLE QUESTION(
TYPE_OF_QUESTION VARCHAR(30)
CHECK(TYPE_OF_QUESTION IN('MULTIPLE CHOICE','FILL IN THE BLANK','STANDARD QUESTION')),
SCORE NUMBER(1),
QUES VARCHAR(300) NOT NULL,
ANS VARCHAR(300) NOT NULL,
FLAGGED CHAR
CHECK(FLAGGED IN('COMPULSORY','OPTIONAL')),
GRAPHICS CHAR
CHECK(GRAPHICS IN ('YES','NO')),
AUDIO CHAR
CHECK(AUDIO IN ('YES','NO')),
QUESTION_NUM NUMBER(2) PRIMARY KEY
);

--EXAM
CREATE TABLE EXAM(
QUESTION_NUM NUMBER(2) NOT NULL,
FOREIGN KEY(QUESTION_NUM) REFERENCES QUESTION(QUESTION_NUM),
EXAM_SESSION CHAR 
CHECK(EXAM_SESSION IN ('WINTER','SUMMER','Winter','Summer','winter','summer')),
EXAM_DATE DATE NOT NULL,
START_TIME NUMBER(4,2) NOT NULL,
EXAM_DURATION NUMBER(4,2) NOT NULL,
TOTAL_SCORE NUMBER(5,2),
EXAM_ID NUMBER(8) PRIMARY KEY
);

--SUBJECT
CREATE TABLE SUBJECT(
EXAM_ID NUMBER(8) NOT NULL,
FOREIGN KEY(EXAM_ID) REFERENCES EXAM(EXAM_ID),
TEACHER_NAME VARCHAR(50) NOT NULL,
EXAM_NOTIFICATION CHAR 
CHECK(EXAM_NOTIFICATION IN ('YES','NO','Yes','No','yes','no')) NOT NULL,
SUBJECT_NAME VARCHAR(30) PRIMARY KEY
);

--TEACHER 
create table TEACHER(
TEACHER_NAME VARCHAR(50) NOT NULL,
SUBJECT_NAME VARCHAR(30) NOT NULL,
FOREIGN KEY(SUBJECT_NAME) REFERENCES SUBJECT(SUBJECT_NAME),
TEACHER_ID varchar(20) PRIMARY KEY
);

--student 
CREATE TABLE STUDENT(
SCORE NUMBER(5,2) not null,
STUDENT_ID varchar(20) PRIMARY KEY,
STUDENT_NAME varchar(30) NOT NULL,
FOREIGN KEY(STUDENT_NAME) REFERENCES REPORT(STUDENT_NAME)
);



--CLASSROOM
CREATE TABLE CLASSROOM(
TEACHER_ID varchar(20) NOT NULL,
foreign key(TEACHER_ID) references TEACHER(TEACHER_ID),
STUDENT_ID varchar(20) NOT NULL,
FOREIGN KEY(STUDENT_ID) REFERENCES STUDENT(STUDENT_ID)
);


--INSERTS
--REPORT TABLE
INSERT INTO REPORT(STUDENT_NAME, SUBJECT_NAME, HEADMISTRESS_SIGNATURE, TEACHER_SIGNATURE, TOTAL_SCORE) VALUES ('JACK DOYLE', 'MATHS', 'BUTCHITA', 'JACK DUGGAN', '3.22' );
INSERT INTO REPORT(STUDENT_NAME, SUBJECT_NAME, HEADMISTRESS_SIGNATURE, TEACHER_SIGNATURE, TOTAL_SCORE) VALUES ('MEG', 'ENGLISH', 'BUTCHITA', 'CONNOR SWIFT', '70' );
INSERT INTO REPORT(STUDENT_NAME, SUBJECT_NAME, HEADMISTRESS_SIGNATURE, TEACHER_SIGNATURE, TOTAL_SCORE) VALUES ('CASEY', 'MATHS', 'BUTCHITA', 'JACK DUGGAN', '40.7' );

--STUDENT TABLE
INSERT INTO STUDENT(SCORE, STUDENT_ID, STUDENT_NAME) VALUES ('44', 'C163', 'MEG');
INSERT INTO STUDENT(SCORE, STUDENT_ID, STUDENT_NAME) VALUES ('49', 'C164', 'CASEY');
INSERT INTO STUDENT(SCORE, STUDENT_ID, STUDENT_NAME) VALUES ('23', 'C165', 'JACK DOYLE');

--SELECTS
SELECT * FROM CLASSROOM;
SELECT * FROM STUDENT;
SELECT * FROM REPORT;
SELECT * FROM TEACHER;
SELECT * FROM SUBJECT;
SELECT * FROM EXAM;
SELECT * FROM QUESTION;

/*
--CLASSROOM TABLE
INSERT INTO CLASSROOM (STUDENT_ID, TEACHER_ID) VALUES ('C163','400');

--TEACHER TABLE
INSERT INTO TEACHER (TEACHER_NAME, SUBJECT_NAME, TEACHER_ID) VALUES ('JACK DUGGAN', 'MATHS', '400');

--QUESTION TABLE
INSERT INTO QUESTION(TYPE_OF_QUESTION, SCORE, QUES, ANS, FLAGGED, QUESTION_NUM) VALUES ('MULTIPLE CHOICE','4','HOW U DOING PET?','ALIVE','Y',3);

--EXAM TABLE
INSERT INTO EXAM(QUESTION_NUM, EXAM_SESSION, EXAM_DATE, START_TIME, EXAM_DURATION, TOTAL_SCORE, EXAM_ID) 
VALUES ('4','A','22 MAR 18','5','1.30','100','6700');

--SUBJECT TABLE
INSERT INTO SUBJECT(EXAM_ID, TEACHER_NAME, EXAM_NOTIFICATION, SUBJECT_NAME)
VALUES ('6700', 'JACK DUGGAN', 'Y', 'MATHS');
*/
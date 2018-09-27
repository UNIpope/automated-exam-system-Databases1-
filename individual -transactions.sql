Alter session set current_schema = JDUGGAN; 
 
SELECT * FROM DT2112A1.STUDENT; 
SELECT * FROM DT2112A1.teacher; 
SELECT * FROM DT2112A1.classroom; 
--------------------------------------------------------------
-- POPULATE 2
INSERT INTO DT2112A1.STUDENT(STUDENT_NAME, SCORE, STUDENT_ID) VALUES ('IAN RYAN', '60.60', 'D163'); 

INSERT INTO DT2112A1.STUDENT(STUDENT_NAME, SCORE, STUDENT_ID) VALUES ('JEN JOHN', '50.60', 'D164');  -- populating into tables

INSERT INTO DT2112A1.STUDENT(STUDENT_NAME, SCORE, STUDENT_ID) VALUES ('J NICKELSON', '20.60', 'D165'); 

INSERT INTO DT2112A1.STUDENT(STUDENT_NAME, SCORE, STUDENT_ID) VALUES ('sive wilcockson', '.9', 'D967'); 
----------------------------------------------------------------
-- INSERT 3
INSERT INTO DT2112A1.STUDENT VALUES ('&STUDENT_NAME', '&SCORE', '&STUDENT_ID'); -- insert transactions

INSERT INTO DT2112A1.STUDENT VALUES ('&STUDENT_NAME', '&SCORE', '&STUDENT_ID'); 
----------------------------------------------------------------
-- UPDATE
UPDATE dt2112a1.STUDENT SET SCORE = &&Score WHERE STUDENT_NAME = '&STUDENT_NAME'; 
UNDEFINE Score; 																		-- update score of student and then free up score

UPDATE dt2112a1.STUDENT SET SCORE = &&Score WHERE STUDENT_NAME = '&STUDENT_NAME'; 
UNDEFINE Score; 

-----------------------------------------------------------------
-- DELETE
DELETE dt2112a1.STUDENT WHERE STUDENT_NAME = '&STUDENT_NAME'; 
UNDEFINE STUDENT_NAME; 																	-- delete student based on name submitted

DELETE dt2112a1.STUDENT WHERE STUDENT_NAME = '&STUDENT_NAME'; 
UNDEFINE STUDENT_NAME; 
-----------------------------------------------------------------

--commit to schema
--COMMIT; 

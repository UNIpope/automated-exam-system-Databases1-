Alter session set current_schema = JDUGGAN; 
 
-- show all from tables
SELECT * FROM DT2112A1.STUDENT; 
SELECT * FROM DT2112A1.teacher; 
SELECT * FROM DT2112A1.classroom; 
--------------------------------------------------------------

-- QURIES 4
SELECT STUDENT_NAME,SCORE FROM dt2112a1.STUDENT WHERE SCORE > 60 ORDER BY SCORE; -- orders by score/ score bigger than 60 / shows name of stu and score
 -----------------------------------------------------------------b
SELECT length(STUDENT_NAME) FROM dt2112a1.STUDENT WHERE SCORE > 60;  -- Non agraate/ leanth of the names / score over 60
-----------------------------------------------------------------c
SELECT SCORE FROM dt2112a1.STUDENT WHERE SCORE IS NULL;                -- test if any scores are null
-----------------------------------------------------------------d
SELECT Count(SCORE),STUDENT_NAME FROM dt2112a1.STUDENT group by STUDENT_NAME; -- agrate  (preform cal) counts the number of scores a student has
-----------------------------------------------------------------
SELECT STUDENT_NAME,SCORE FROM dt2112a1.STUDENT WHERE SCORE > 10 
INTERSECT 																	-- shows scores that intersect bigger than ten and less than 30
SELECT STUDENT_NAME,SCORE FROM dt2112a1.STUDENT WHERE SCORE < 30; 
-----------------------------------------------------------------
SELECT COUNT(SCORE),STUDENT_NAME FROM dt2112a1.STUDENT 						
group by STUDENT_NAME HAVING MIN(SCORE) < 20; 
----------------------------------------------------------------- e
SELECT * FROM DT2112A1.STUDENT WHERE SCORE < 40
INTERSECT																	-- cross over between the 2 statements
SELECT * FROM DT2112A1.STUDENT WHERE STUDENT_ID = '&ID'; 

SELECT * FROM DT2112A1.STUDENT WHERE SCORE < 40
UNION																		-- combines the results 
SELECT * FROM DT2112A1.STUDENT WHERE SCORE > 70; 

SELECT * FROM DT2112A1.STUDENT WHERE SCORE < 40
MINUS																		-- every thing less than 40 take away < 20
SELECT * FROM DT2112A1.STUDENT WHERE SCORE < 20; 
------------------------------------------------------------------ f
SELECT STUDENT_ID, SCORE FROM DT2112A1.STUDENT 								-- join tables by student id
JOIN DT2112A1.classroom 
USING (STUDENT_ID); 

SELECT STUDENT.STUDENT_ID, STUDENT.SCORE FROM DT2112A1.STUDENT
INNER JOIN DT2112A1.classroom 												-- join using on
ON classroom.STUDENT_ID = STUDENT.STUDENT_ID; 

SELECT STUDENT.STUDENT_ID, STUDENT.SCORE FROM DT2112A1.STUDENT, DT2112A1.classroom  -- join using where
where classroom.STUDENT_ID = STUDENT.STUDENT_ID; 

------------------------------------------------------------------- g
SELECT STUDENT.STUDENT_ID, STUDENT.SCORE FROM DT2112A1.STUDENT
left join DT2112A1.classroom 												-- everything in student + crossover with classroom
ON classroom.STUDENT_ID = STUDENT.STUDENT_ID; 

SELECT STUDENT.STUDENT_ID, STUDENT.SCORE FROM DT2112A1.STUDENT
right join DT2112A1.classroom 												-- everything in classroom + crossover with student
ON classroom.STUDENT_ID = STUDENT.STUDENT_ID; 

------------------------------------------------------------------- h
SELECT * FROM DT2112A1.STUDENT
WHERE STUDENT.STUDENT_ID IN (SELECT * FROM DT2112A1.STUDENT WHERE SCORE < 40) -- sub quirey not tested on redwood
;

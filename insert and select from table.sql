/*Using the ‘insert’ statements, add at least 3 rows to each table. 	*/

INSERT INTO college VALUES('ENG', 'English', 'Prof. Fahad');

INSERT INTO college VALUES('DTA', 'Database', 'Prof. Salim');

INSERT INTO college VALUES('MTH', 'Math', 'Dr. Hilal');


INSERT INTO department VALUES('BIL','Biology','Dr. Ahmed','ENG');

INSERT INTO department VALUES('HISY','History','Dr. Salim','ENG');

INSERT INTO department VALUES('CHY', 'Chemistry', 'Dr. Ali', 'MTH');



INSERT INTO borrower VALUES (56923,'Ahmed','CHY', NULL, 'Barka','102','S');

INSERT INTO borrower VALUES (23453,'Muhra','CHY', NULL, 'Barka','102','E');

INSERT INTO borrower VALUES (23123,'Mohammed','FINA', 99023677, 'Seeb','100','E');


INSERT INTO student VALUES(3000,'COMP',2012);

INSERT INTO student VALUES(23453,'CHY',2015);

INSERT INTO student VALUES(56623,'FINA',2015);


INSERT INTO employee VALUES(23453,'10',1401);

INSERT INTO employee VALUES(10021,'15',2221);

INSERT INTO employee VALUES(56923,'11',1401);



INSERT INTO book VALUES(3110,'Math',5,490,155,65);

INSERT INTO book VALUES(2002,'English',7,301,190,180);

INSERT INTO book VALUES(2301,'Intro. to IT',8,450,711,210);


INSERT INTO bookTopic VALUES (2301,'Sequence');

INSERT INTO bookTopic VALUES (3001,'Index');

INSERT INTO bookTopic VALUES (2002,'View');



INSERT INTO course VALUES('COMP765', 'Chemistry', 3, 1,'CHY');

INSERT INTO course VALUES('COMP998', 'Finance', 3, 2,'FINA');

INSERT INTO course VALUES('BIOL1234', 'History', 3, 5,'HIST');



INSERT INTO CBlink VALUES('COMP765',2002,'T','NULL');

INSERT INTO CBlink VALUES('COMP998',3110,'T','NULL');

INSERT INTO CBlink VALUES('BIOL1234',2301,'R','NULL');



INSERT INTO regist VALUES(10023,'COMP998','FL2015',32);

INSERT INTO regist VALUES(23123,'COMP998','FL2015',35);

INSERT INTO regist VALUES(56923,'BIOL1234','FL2015',38);


INSERT INTO issuing VALUES(92120, 1002, '05-Feb-2015', '01-Jan-2016');

INSERT INTO issuing VALUES(92120, 3002, '12-Mar-2016', NULL);

INSERT INTO issuing VALUES(10021, 3002, '22-Dec-2014', NULL);


/*Write SQL queries to answer the queries from ‘a-d’ and either ‘e’ or ‘f’:  
(a)	Retrieve full information stored in one table. 	*/

SELECT * FROM college;

/*(b)Retrieve from any table the records which satisfy certain criteria. */	

SELECT tp_bkid FROM bookTopic WHERE (tp_desc = 'SQL');

/*(c)Using any table which contains a numeric field, 
retrieve the record which has the maximum value for that field. */	

SELECT MAX(re_serial#) AS re_serial FROM regist;

/*(d)List related information from two tables. 
The list must contain at least one field from each table. */	

SELECT dp_code, cr_title, cr_code FROM department, course WHERE department.dp_code=course.cr_dept AND (cr_code='COMP4201');


/*(e)Produce a statistical list (Query) of two columns only, 
which aggregates the records within a table based on the values stored in one textual-field (the 1st column) 
while the 2nd column lists aggregated information using one of these functions: ‘COUNT’, ‘SUM’, or ‘AVERAGE’. */	

SELECT COUNT(br_mobile#) AS Mobile, dp_name AS Name
FROM department, borrower
WHERE department.dp_code=borrower.br_dept
GROUP BY dp_name;

/*(f)Produce a calculated list (Query) based on a single table. The list must have at least two columns, 
one of them is textual column while the 2nd column is calculated (e.g., summed-up) from other fields. */

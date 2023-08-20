--Add a new column named ‘re_serial#’ of type Integer.
ALTER TABLE regist
ADD re_serial# INT;

--Create a sequence (named seq_regist_serial#) that generates unique serial’s. The sequence starts generating numbers from 1, every time increases by 2, and reuses the generated numbers if necessary.

CREATE SEQUENCE seq_regist_serial#
 START WITH 1
 INCREMENT BY 2
 CYCLE;

--Update the ‘regist’ table to fill the re_serial# column from the created sequence.
UPDATE regist
SET re_serial# = NEXT VALUE FOR seq_regist_serial#;


--Insert at least two new records into the table ‘regist’; keeping in mind that the table is now having the new column ‘re_serial#’, which it has to be filled from the sequence seq_regist_serial#.

INSERT INTO regist(re_brID, re_crCode,re_semester, re_serial#)
VALUES (10021, 'BIOL1000','FL2015', NEXT VALUE FOR seq_regist_serial#);

INSERT INTO regist(re_brID, re_crCode,re_semester, re_serial#)
VALUES (92120, 'COMP4201','FL2015', NEXT VALUE FOR seq_regist_serial#);




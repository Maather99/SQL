/*Add a new column named ‘re_serial#’ of type Integer. */
ALTER TABLE regist
ADD re_serial# INT;

/*Create a sequence (named seq_regist_serial#) that generates unique serial’s. The
sequence starts generating numbers from 1, every time increases by 2, and reuses the generated numbers if necessary.
 */

CREATE SEQUENCE seq_regist_serial#
 START WITH 1
 INCREMENT BY 2
 CYCLE;

/*Update the ‘regist’ table to fill the re_serial# column from the created sequence. */

UPDATE regist
SET re_serial# = NEXT VALUE FOR seq_regist_serial#;


/* Insert at least two new records into the table ‘regist’; keeping in mind that the
table is now having the new column ‘re_serial#’, which it has to be filled from
the sequence seq_regist_serial#.
*/

INSERT INTO regist(re_brID, re_crCode,re_semester, re_serial#)
VALUES (10021, 'BIOL1000','FL2015', NEXT VALUE FOR seq_regist_serial#);

INSERT INTO regist(re_brID, re_crCode,re_semester, re_serial#)
VALUES (92120, 'COMP4201','FL2015', NEXT VALUE FOR seq_regist_serial#);

SELECT * FROM regist; 
/*Add a new column named li_key of type character and size 8 */

ALTER TABLE CBlink 
ADD li_key CHAR(8);


/*Create a sequence (named seq_CBlink_key) that generates unique keys (integers).
The sequence starts generating the numbers from 0, every time increases by 1,
and the generated number can recur when the last generated number reached
9999. */


CREATE SEQUENCE seq_CBlink_key
start with 0
increment by 1
minvalue 0
maxvalue 9999
cycle;



/* Update the ‘CBlink’ table to fill the li_key column using a textual value that
consists of the 1st four characters from the Course Code (i.e., li_crCode) and the
next integer from the sequence seq_CBlink_key. The length of the composed
textual value MUST be 8 characters, which means that the generated integers
from the sequence must be left-padded with ZEROS before they are
concatenated with the first part; for example: ‘COMP0000’, ‘COMP0001’,
‘BIOL0002. */

UPDATE CBlink
SET li_key = LEFT(li_crCode, 4)+ RIGHT('0000'+ CAST(NEXT VALUE FOR seq_CBlink_key AS NVARCHAR(5)),4);


/*Insert at least two new records into the table ‘CBlink’ keeping in mind that the table
is now having the new column ‘li_key’, which it must be filled from the sequence
seq_CBlink_key as described in (c).
*/

INSERT INTO CBlink VALUES('COMP765',2002,'T',LEFT('COMP'+ RIGHT('0000'+ CAST(NEXT VALUE FOR seq_CBlink_key AS NVARCHAR(5)),4),8));

INSERT INTO CBlink VALUES('COMP998',3110,'T',LEFT('COMP'+ RIGHT('0000'+ CAST(NEXT VALUE FOR seq_CBlink_key AS NVARCHAR(5)),4),8));





/* For the table ‘Book’, create a UNIQUE index on the book title. 
Choose a suitable name for the created index.*/


CREATE UNIQUE INDEX idx_unique_BookTitle ON Book(bk_title);



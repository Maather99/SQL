/*Display the title of the book (from the BOOK table) and the title of the course (from the COURSE table) 
for all books that are assigned to any course. */

SELECT bk_title AS BookTitle, cr_title AS CourseTitle 
FROM "book","course" 
WHERE book.bk_title=course.cr_title
GROUP BY bk_title, cr_title;



/* Write a T-SQL query to fetch book names 
having total copies greater than 50 and less than or equal to 100. */

SELECT bk_title AS BookTitle FROM book WHERE (bk_totalCopies >50) and (bk_totalCopies<= 100) ORDER BY BookTitle ;





/*  Based on the borrower table select the unique department code values 
that represented for the borrower from Seeb city 
and order by the result in descending order by department code.    */

SELECT br_city AS BorrowerCity, dp_code AS DepartmentCode 
FROM "borrower","department" 
WHERE borrower.br_dept= department.dp_code AND (br_city='seeb') 
ORDER BY dp_code DESC;


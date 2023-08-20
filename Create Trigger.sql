CREATE TRIGGER EmpSalCheck
ON Employees
FOR UPDATE
AS 
BEGIN
 DECLARE @old_salary decimal (18,2);
 DECLARE @new_salary decimal (18,2);
 select @old_salary = Salary FROM deleted;
 select @new_salary = Salary FROM inserted;
 IF @old_salary > @new_salary
  BEGIN
   PRINT ' NEW SALARY CANNOT BE LESS THAN OLD SALARY'
   ROLLBACK;
  END
END
UPDATE Employees SET Salary =Salary-500;


CREATE OR ALTER TRIGGER EmpSalCheck
ON Employees
FOR DELETE
AS 
BEGIN
 DECLARE @count INT;
 select @count = COUNT(*) FROM deleted;
 IF @count > 1
  BEGIN
   PRINT ' CANNOT DELETE MORE THAN ONE RECORD AT A TIME';
   ROLLBACK;
  END
END


CREATE OR ALTER TRIGGER CityTRIGGER
ON Customer
FOR UPDATE
AS 
BEGIN
 DECLARE @City1 NVARCHAR(20);
 DECLARE @City2 NVARCHAR(20);
 SELECT @City1 = City FROM deleted ;
 SELECT @City2 = City FROM inserted;

 IF 
  BEGIN
   PRINT ' CANNOT DELETE MORE THAN ONE RECORD AT A TIME';
   ROLLBACK;
  END
END


CREATE OR ALTER VIEW EmpView AS 
SELECT e.EmployeeId, e.DepartmentId, e.FirstName, e.Salary, d.DepartmentName
FROM Employees e, Department d
WHERE d.DepartmentId =e.DepartmentId;

CREATE OR ALTER TRIGGER trig_EmpView ON EmpView INSTEAD OF INSERT AS 
BEGIN
 DECLARE @empid INT;
 DECLARE @name NVARCHAR(50);
 DECLARE @Sal DECIMAL(18,2);
 DECLARE @depid INT;
 SELECT @empid= EmployeeId, @name=FirstName, @Sal=Salary, @depid=d.DepartmentId
 FROM Department d, inserted
 WHERE d.DepartmentName= inserted.DepartmentName;
 IF @depid IS NULL
  BEGIN
   PRINT 'Invalid Department';
   ROLLBACK;
  
  END;

INSERT INTO Employees (EmployeeId,FirstName, Salary, DepartmentId) 
VALUES(@empid, @name, @Sal, @depid);
END;
INSERT INTO EmpView VALUES(12, 20,'JOHN', 60000, 'HR');

SELECT * FROM EmpView;

SELECT * FROM Employees;

CREATE OR ALTER  VIEW CusView AS 
SELECT c.Id, c.FirstName, c.LastName, o.OrderNumber
FROM Customer c, Order o
WHERE Customer.Id= Order.CustomerId

 create Database miniproject

 --------------------------------------------------------------------------------------------------------------------------------------------

 use miniproject

 --------------------------------------------------------------------------------------------------------------------------------------------

 create table employee
(
EmployeesID INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
EmpName VARCHAR(20) NOT NULL,
Phone BIGINT NOT NULL,
Email  varchar(50),
Designation varchar(50),
LevelId int,
Username varchar(50),
Passwordd varchar(50)
)


INSERT INTO employee (EmpName, Phone, Email, Designation, LevelId, Username, Passwordd)
VALUES
    ('Praveen singh',9716861278,'praveen@gmail.com','.Net developer',4,'praveen','pass123'),


CREATE PROCEDURE ManageEmployee
    @Operation VARCHAR(10), -- Possible values: 'INSERT', 'UPDATE', 'DELETE'
    @EmployeeID INT = NULL,
    @EmpName VARCHAR(20) = NULL,
    @Phone BIGINT = NULL,
    @Email VARCHAR(50) = NULL,
    @Designation VARCHAR(50) = NULL,
    @LevelId INT = NULL,
    @Username VARCHAR(50) = NULL,
    @Passwordd VARCHAR(50) = NULL
AS
BEGIN
    IF @Operation = 'INSERT'
    BEGIN
        INSERT INTO employee (EmpName, Phone, Email, Designation, LevelId, Username, Passwordd)
        VALUES (@EmpName, @Phone, @Email, @Designation, @LevelId, @Username, @Passwordd);
    END;
    
    IF @Operation = 'UPDATE'
    BEGIN
        UPDATE employee 
        SET EmpName = ISNULL(@EmpName, EmpName), 
            Phone = ISNULL(@Phone, Phone), 
            Email = ISNULL(@Email, Email), 
            Designation = ISNULL(@Designation, Designation), 
            LevelId = ISNULL(@LevelId, LevelId), 
            Username = ISNULL(@Username, Username), 
            Passwordd = ISNULL(@Passwordd, Passwordd)
        WHERE EmployeesID = @EmployeeID;
    END;

    IF @Operation = 'DELETE'
    BEGIN
        DELETE FROM employee WHERE EmployeesID = @EmployeeID;
    END;
END;


----------------------------------------------------------------------------------------------------------------------------------------------

create table level
(
levelId int primary key ,
basicsalary decimal(18,2),
)

drop table level

INSERT INTO level (levelId, basicsalary)
VALUES
    (1, 10000.00), -- Level 1
    (2, 20000.00), -- Level 2
    (3, 30000.00), -- Level 3
    (4, 40000.00), -- Level 4
	(5, 50000.00), -- Level 5
	(6, 60000.00), -- Level 6
    (7, 70000.00), -- Level 7
    (8, 80000.00), -- Level 8
    (9, 90000.00); -- Level 9
	

-----------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE payslipss
(
    PaySlipID INT IDENTITY(1,1) PRIMARY KEY,
    EmployeesID INT Not Null,
    Month INT NOT NULL,
    MonthName VARCHAR(50) NOT NULL,
    Year INT NOT NULL,
    GeneratedOn Varchar(100),
    BasicSalary DECIMAL(18, 2) NOT NULL,
    NoOfLeaves INT NOT NULL,
    SalaryPerDay DECIMAL(18, 2) NOT NULL,
    DeductionforLeaves DECIMAL(18, 2) NOT NULL,
    NetSalary DECIMAL(18, 2) NOT NULL
);

select * from payslipss
-----------------------------------------------------------------------------------------------------------------------------------------------
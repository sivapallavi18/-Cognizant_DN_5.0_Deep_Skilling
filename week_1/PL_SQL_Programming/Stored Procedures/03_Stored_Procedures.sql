SET SERVEROUTPUT ON;

-- CREATE CUSTOMERS TABLE

CREATE TABLE CUSTOMERS (
    CustomerID NUMBER PRIMARY KEY,
    CustomerName VARCHAR2(50),
    Age NUMBER,
    InterestRate NUMBER(5,2),
    Balance NUMBER(10,2),
    IsVIP VARCHAR2(5),
    AccountType VARCHAR2(20)     
);

-- CREATE LOANS TABLE
CREATE TABLE LOANS (
    LoanID NUMBER PRIMARY KEY,
    CustomerID NUMBER,
    DueDate DATE,
    CONSTRAINT FK_CUSTOMER
        FOREIGN KEY (CustomerID)
        REFERENCES CUSTOMERS(CustomerID)
);

-- CREATE EMPLOYEES TABLE
CREATE TABLE EMPLOYEES (
    EmployeeID NUMBER PRIMARY KEY,
    EmployeeName VARCHAR2(50),
    Department VARCHAR2(30),
    Salary NUMBER(10,2)
);

-- INSERT CUSTOMER DATA
INSERT INTO CUSTOMERS VALUES(101,'Pallavi',65,10.5,15000,'FALSE','SAVINGS');
INSERT INTO CUSTOMERS VALUES(102,'Sunanda',45,9.5,12000,'FALSE','SAVINGS');
INSERT INTO CUSTOMERS VALUES(103,'Hyndhavi',70,11.0,8000,'FALSE','SAVINGS');
INSERT INTO CUSTOMERS VALUES(104,'Harsha',35,8.5,20000,'FALSE','CURRENT');
INSERT INTO CUSTOMERS VALUES(105,'Harshit',62,10.0,18000,'FALSE','SAVINGS');
INSERT INTO CUSTOMERS VALUES(106,'Siva',28,9.0,9000,'FALSE','CURRENT');

-- INSERT LOAN DATA
INSERT INTO LOANS VALUES (201,101,SYSDATE+10);
INSERT INTO LOANS VALUES (202,102,SYSDATE+40);
INSERT INTO LOANS VALUES (203,103,SYSDATE+20);
INSERT INTO LOANS VALUES (204,104,SYSDATE+5);
INSERT INTO LOANS VALUES (205,105,SYSDATE+15);
INSERT INTO LOANS VALUES (206,106,SYSDATE+25);

-- INSERT EMPLOYEE DATA
INSERT INTO EMPLOYEES VALUES (1,'Ravi','IT',50000);
INSERT INTO EMPLOYEES VALUES (2,'Priya','HR',40000);
INSERT INTO EMPLOYEES VALUES (3,'Kiran','IT',60000);
INSERT INTO EMPLOYEES VALUES (4,'Anil','Finance',45000);

COMMIT;

-- DISPLAY TABLE DATA
SELECT * FROM CUSTOMERS;
SELECT * FROM LOANS;
SELECT * FROM EMPLOYEES;


-- SCENARIO 1
-- PROCESS MONTHLY INTEREST
-- Add 1% interest to all Savings Accounts
CREATE OR REPLACE PROCEDURE ProcessMonthlyInterest
IS
BEGIN

   UPDATE CUSTOMERS
   SET Balance = Balance + (Balance * 0.01)
   WHERE AccountType = 'SAVINGS';
   COMMIT;
   DBMS_OUTPUT.PUT_LINE('Monthly Interest Applied Successfully');
END;
/

-- EXECUTE SCENARIO 1
BEGIN
   ProcessMonthlyInterest;
END;
/

-- output
SELECT * FROM CUSTOMERS;


-- SCENARIO 2
-- UPDATE EMPLOYEE BONUS
-- Add Bonus Percentage to Employees

CREATE OR REPLACE PROCEDURE UpdateEmployeeBonus
(
   p_department IN VARCHAR2,
   p_bonus_percent IN NUMBER
)
IS
BEGIN

   UPDATE EMPLOYEES
   SET Salary = Salary + (Salary * p_bonus_percent / 100)
   WHERE Department = p_department;

   COMMIT;

   DBMS_OUTPUT.PUT_LINE('Bonus Updated Successfully');

END;
/

-- Give 10% Bonus to IT Employees

BEGIN
   UpdateEmployeeBonus('IT',10);
END;
/
--output
SELECT * FROM EMPLOYEES;


-- SCENARIO 3
-- TRANSFER FUNDS
-- Transfer money between customers

CREATE OR REPLACE PROCEDURE TransferFunds
(
   p_source_customer IN NUMBER,
   p_target_customer IN NUMBER,
   p_amount IN NUMBER
)
IS
   v_balance NUMBER;
BEGIN

   -- Get source customer balance
   SELECT Balance
   INTO v_balance
   FROM CUSTOMERS
   WHERE CustomerID = p_source_customer;

-- Check sufficient balance
   IF v_balance >= p_amount THEN

      -- Deduct amount from source customer
      UPDATE CUSTOMERS
      SET Balance = Balance - p_amount
      WHERE CustomerID = p_source_customer;

-- Add amount to target customer
      UPDATE CUSTOMERS
      SET Balance = Balance + p_amount
      WHERE CustomerID = p_target_customer;

      COMMIT;

      DBMS_OUTPUT.PUT_LINE('Transfer Successful');

   ELSE

      DBMS_OUTPUT.PUT_LINE('Insufficient Balance');

   END IF;

END;
/

-- Transfer Rs.5000 from Customer 101 to Customer 102
BEGIN
   TransferFunds(101,102,5000);
END;
/
---output
SELECT CustomerID,CustomerName,Balance FROM CUSTOMERS;
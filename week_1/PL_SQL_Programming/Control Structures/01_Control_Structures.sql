SET SERVEROUTPUT ON;

-- Create Customers Table
CREATE TABLE CUSTOMERS (
    CustomerID NUMBER PRIMARY KEY,
    CustomerName VARCHAR2(50),
    Age NUMBER,
    InterestRate NUMBER(5,2),
    Balance NUMBER(10,2),
    IsVIP VARCHAR2(5)
);

-- Create Loans Table
CREATE TABLE LOANS (
    LoanID NUMBER PRIMARY KEY,
    CustomerID NUMBER,
    DueDate DATE,
    CONSTRAINT FK_CUSTOMER
        FOREIGN KEY (CustomerID)
        REFERENCES CUSTOMERS(CustomerID)
);

-- Sample Customers
INSERT INTO CUSTOMERS VALUES(101, 'Pallavi', 65, 10.5, 15000, 'FALSE');
INSERT INTO CUSTOMERS VALUES(102, 'sunanda', 45, 9.5, 12000, 'FALSE');
INSERT INTO CUSTOMERS VALUES(103, 'hyndhavi', 70, 11.0, 8000, 'FALSE');
INSERT INTO CUSTOMERS VALUES(104, 'harsha', 35, 8.5, 20000, 'FALSE');
INSERT INTO CUSTOMERS VALUES (105, 'harshit', 62, 10.0, 18000, 'FALSE');
INSERT INTO CUSTOMERS VALUES (106, 'siva', 28, 9.0, 9000, 'FALSE');

-- Sample Customers
INSERT INTO LOANS VALUES (201, 101, SYSDATE + 10);
INSERT INTO LOANS VALUES (202, 102, SYSDATE + 40);
INSERT INTO LOANS VALUES (203, 103, SYSDATE + 20);
INSERT INTO LOANS VALUES (204, 104, SYSDATE + 5);
INSERT INTO LOANS VALUES (205, 105, SYSDATE + 15);
INSERT INTO LOANS VALUES (206, 106, SYSDATE + 25);

COMMIT;

--display Tables
SELECT * FROM CUSTOMERS;
SELECT * FROM LOANS;



--Scenario 1

BEGIN
   FOR C IN (SELECT CustomerID, Age FROM CUSTOMERS)
   LOOP
      IF C.Age > 60 THEN
         UPDATE CUSTOMERS
         SET InterestRate = InterestRate - 1
         WHERE CustomerID = C.CustomerID;

         DBMS_OUTPUT.PUT_LINE('Discount applied to Customer ID: ' || C.CustomerID);
      END IF;
   END LOOP;

   COMMIT;
END;
/

--output
SELECT  * FROM CUSTOMERS;


--Scenario 2

BEGIN
   FOR C IN (SELECT CustomerID, Balance FROM CUSTOMERS)
   LOOP
      IF C.Balance > 10000 THEN
         UPDATE CUSTOMERS
         SET IsVIP = 'TRUE'
         WHERE CustomerID = C.CustomerID;

         DBMS_OUTPUT.PUT_LINE('VIP Status Granted to Customer ID: ' || C.CustomerID);
      END IF;
   END LOOP;

   COMMIT;
END;
/

--output
SELECT * FROM CUSTOMERS;



--Scenario 3

BEGIN
   FOR L IN (
      SELECT CustomerID,
             LoanID,
             DueDate
      FROM LOANS
      WHERE DueDate BETWEEN SYSDATE AND SYSDATE + 30
   )
   LOOP
      DBMS_OUTPUT.PUT_LINE(
         ' Reminder: Loan ' || L.LoanID ||
         ' for Customer ' || L.CustomerID ||
         ' is due on ' || TO_CHAR(L.DueDate,'DD-MON-YYYY')
      );
   END LOOP;
END;
/

--output

SELECT * FROM LOANS WHERE DueDate BETWEEN SYSDATE AND SYSDATE + 30;
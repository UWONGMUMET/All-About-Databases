CREATE DATABASE HR_DATA;
USE HR_DATA;

CREATE TABLE salesman (
    salesman_id INT PRIMARY KEY,
    name VARCHAR(50),
    city VARCHAR(50),
    commission DECIMAL(3, 2)
);

INSERT INTO salesman (salesman_id, name, city, commission) VALUES
(5001, 'James Hoog', 'New York', 0.15),
(5002, 'Nail Knite', 'Paris', 0.13),
(5005, 'Pit Alex', 'London', 0.11),
(5006, 'Mc Lyon', 'Paris', 0.14),
(5007, 'Paul Adam', 'Rome', 0.13),
(5003, 'Lauson Hen', 'San Jose', 0.12);

CREATE TABLE customer (
    customer_id INT PRIMARY KEY,
    cust_name VARCHAR(50),
    city VARCHAR(50),
    grade INT,
    salesman_id INT,
    FOREIGN KEY (salesman_id) REFERENCES salesman(salesman_id)
);

INSERT INTO customer (customer_id, cust_name, city, grade, salesman_id) VALUES
(3002, 'Nick Rimando', 'New York', 100, 5001),
(3007, 'Brad Davis', 'New York', 200, 5001),
(3005, 'Graham Zusi', 'California', 200, 5002),
(3008, 'Julian Green', 'London', 300, 5002),
(3004, 'Fabian Johnson', 'Paris', 300, 5006),
(3009, 'Geoff Cameron', 'Berlin', 100, 5003),
(3003, 'Jozy Altidor', 'Moscow', 200, 5007),
(3001, 'Brad Guzan', 'London', NULL, 5005);

CREATE TABLE orders (
    ord_no INT PRIMARY KEY,
    purch_amt DECIMAL(10, 2),
    ord_date DATE,
    customer_id INT,
    salesman_id INT,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (salesman_id) REFERENCES salesman(salesman_id)
);

INSERT INTO orders (ord_no, purch_amt, ord_date, customer_id, salesman_id) VALUES
(70001, 150.5, '2012-10-05', 3005, 5002),
(70009, 270.65, '2012-09-10', 3001, 5005),
(70002, 65.26, '2012-10-05', 3002, 5001),
(70004, 110.5, '2012-08-17', 3009, 5003),
(70007, 948.5, '2012-09-10', 3005, 5002),
(70005, 2400.6, '2012-07-27', 3007, 5001),
(70008, 5760, '2012-09-10', 3002, 5001),
(70010, 1983.43, '2012-10-10', 3004, 5006),
(70003, 2480.4, '2012-10-10', 3009, 5003),
(70012, 250.45, '2012-06-27', 3008, 5002),
(70011, 75.29, '2012-08-17', 3003, 5007),
(70013, 3045.6, '2012-04-25', 3002, 5001);

CREATE TABLE company_mast (
    COM_ID INT PRIMARY KEY,
    COM_NAME VARCHAR(255)
);

CREATE TABLE item_mast (
    PRO_ID INT PRIMARY KEY,
    PRO_NAME VARCHAR(255),
    PRO_PRICE DECIMAL(10, 2),
    PRO_COM INT,
    FOREIGN KEY (PRO_COM) REFERENCES company_mast(COM_ID)
);

INSERT INTO company_mast (COM_ID, COM_NAME) VALUES (11, 'Samsung');
INSERT INTO company_mast (COM_ID, COM_NAME) VALUES (12, 'iBall');
INSERT INTO company_mast (COM_ID, COM_NAME) VALUES (13, 'Epsion');
INSERT INTO company_mast (COM_ID, COM_NAME) VALUES (14, 'Zebronics');
INSERT INTO company_mast (COM_ID, COM_NAME) VALUES (15, 'Asus');
INSERT INTO company_mast (COM_ID, COM_NAME) VALUES (16, 'Frontech');

INSERT INTO item_mast (PRO_ID, PRO_NAME, PRO_PRICE, PRO_COM) VALUES (101, 'Mother Board', 3200.00, 15);
INSERT INTO item_mast (PRO_ID, PRO_NAME, PRO_PRICE, PRO_COM) VALUES (102, 'Key Board', 450.00, 16);
INSERT INTO item_mast (PRO_ID, PRO_NAME, PRO_PRICE, PRO_COM) VALUES (103, 'ZIP drive', 250.00, 14);
INSERT INTO item_mast (PRO_ID, PRO_NAME, PRO_PRICE, PRO_COM) VALUES (104, 'Speaker', 550.00, 16);
INSERT INTO item_mast (PRO_ID, PRO_NAME, PRO_PRICE, PRO_COM) VALUES (105, 'Monitor', 5000.00, 11);
INSERT INTO item_mast (PRO_ID, PRO_NAME, PRO_PRICE, PRO_COM) VALUES (106, 'DVD drive', 900.00, 12);
INSERT INTO item_mast (PRO_ID, PRO_NAME, PRO_PRICE, PRO_COM) VALUES (107, 'CD drive', 800.00, 12);
INSERT INTO item_mast (PRO_ID, PRO_NAME, PRO_PRICE, PRO_COM) VALUES (108, 'Printer', 2600.00, 13);
INSERT INTO item_mast (PRO_ID, PRO_NAME, PRO_PRICE, PRO_COM) VALUES (109, 'Refill cartridge', 350.00, 13);
INSERT INTO item_mast (PRO_ID, PRO_NAME, PRO_PRICE, PRO_COM) VALUES (110, 'Mouse', 250.00, 12);

CREATE TABLE emp_department (
    DPT_CODE INT PRIMARY KEY,
    DPT_NAME VARCHAR(255),
    DPT_ALLOTMENT DECIMAL(10, 2)
);

CREATE TABLE emp_details (
    EMP_IDNO INT PRIMARY KEY,
    EMP_FNAME VARCHAR(255),
    EMP_LNAME VARCHAR(255),
    EMP_DEPT INT,
    FOREIGN KEY (EMP_DEPT) REFERENCES emp_department(DPT_CODE)
);

INSERT INTO emp_department (DPT_CODE, DPT_NAME, DPT_ALLOTMENT) VALUES (57, 'IT', 65000);
INSERT INTO emp_department (DPT_CODE, DPT_NAME, DPT_ALLOTMENT) VALUES (63, 'Finance', 15000);
INSERT INTO emp_department (DPT_CODE, DPT_NAME, DPT_ALLOTMENT) VALUES (47, 'HR', 240000);
INSERT INTO emp_department (DPT_CODE, DPT_NAME, DPT_ALLOTMENT) VALUES (27, 'RD', 55000);
INSERT INTO emp_department (DPT_CODE, DPT_NAME, DPT_ALLOTMENT) VALUES (89, 'QC', 75000);

INSERT INTO emp_details (EMP_IDNO, EMP_FNAME, EMP_LNAME, EMP_DEPT) VALUES (127323, 'Michale', 'Robbin', 57);
INSERT INTO emp_details (EMP_IDNO, EMP_FNAME, EMP_LNAME, EMP_DEPT) VALUES (526689, 'Carlos', 'Snares', 63);
INSERT INTO emp_details (EMP_IDNO, EMP_FNAME, EMP_LNAME, EMP_DEPT) VALUES (843795, 'Enric', 'Dosio', 57);
INSERT INTO emp_details (EMP_IDNO, EMP_FNAME, EMP_LNAME, EMP_DEPT) VALUES (328717, 'Jhon', 'Snares', 63);
INSERT INTO emp_details (EMP_IDNO, EMP_FNAME, EMP_LNAME, EMP_DEPT) VALUES (444527, 'Joseph', 'Dosni', 47);
INSERT INTO emp_details (EMP_IDNO, EMP_FNAME, EMP_LNAME, EMP_DEPT) VALUES (659831, 'Zanifer', 'Emily', 47);
INSERT INTO emp_details (EMP_IDNO, EMP_FNAME, EMP_LNAME, EMP_DEPT) VALUES (847674, 'Kuleswar', 'Sitaraman', 57);
INSERT INTO emp_details (EMP_IDNO, EMP_FNAME, EMP_LNAME, EMP_DEPT) VALUES (748681, 'Henrey', 'Gabriel', 47);
INSERT INTO emp_details (EMP_IDNO, EMP_FNAME, EMP_LNAME, EMP_DEPT) VALUES (555935, 'Alex', 'Manuel', 57);
INSERT INTO emp_details (EMP_IDNO, EMP_FNAME, EMP_LNAME, EMP_DEPT) VALUES (539569, 'George', 'Mardy', 27);
INSERT INTO emp_details (EMP_IDNO, EMP_FNAME, EMP_LNAME, EMP_DEPT) VALUES (733843, 'Mario', 'Saule', 63);
INSERT INTO emp_details (EMP_IDNO, EMP_FNAME, EMP_LNAME, EMP_DEPT) VALUES (631548, 'Alan', 'Snappy', 27);
INSERT INTO emp_details (EMP_IDNO, EMP_FNAME, EMP_LNAME, EMP_DEPT) VALUES (839139, 'Maria', 'Foster', 57);



 -- Create a Table
 CREATE TABLE "Employees" ( 
 "FullName" TEXT, 
 "Salary" INT, 
 "JobPosition" TEXT, 
 "PhoneExtension" INT, 
 "IsPartTime" BOOL 
 );    
 -- Create Employees
INSERT INTO "Employees" ("FullName","Salary","JobPosition","PhoneExtension","IsPartTime") 
VALUES ('Alec Jones','20000','Coffee Courier','222','true');

INSERT INTO "Employees" ("FullName","Salary","JobPosition","PhoneExtension","IsPartTime") 
VALUES ('Isaac Rendon','100000','CFO','111','false');

INSERT INTO "Employees" ("FullName","Salary","JobPosition","PhoneExtension","IsPartTime") 
VALUES ('David Williams','150000','CTO','333','false');

INSERT INTO "Employees" ("FullName","Salary","JobPosition","PhoneExtension","IsPartTime") 
VALUES ('Lazy Larry','25000','Son of the boss','444','true');

INSERT INTO "Employees" ("FullName","Salary","JobPosition","PhoneExtension","IsPartTime") 
VALUES ('Alex Rickard','70000','PR Manager','555','false');

INSERT INTO "Employees" ("FullName","Salary","JobPosition","PhoneExtension","IsPartTime") 
VALUES ('Andrew Betts','70000','Cook','666','false');

-- Select all columns for all employees.
CompanyDatabase> SELECT * FROM "Employees";                                                                                                                                                                 
+----------------+----------+-----------------+------------------+--------------+
| FullName       | Salary   | JobPosition     | PhoneExtension   | IsPartTime   |
|----------------+----------+-----------------+------------------+--------------|
| Alec Jones     | 25000    | Janitor         | 222              | True         |
| Isaac Rendon   | 100000   | CFO             | 111              | False        |
| David Williams | 150000   | CTO             | 333              | False        |
| Lazy Larry     | 25000    | Son of the boss | 444              | True         |
| Alex Rickard   | 70000    | PR Manager      | 555              | False        |
| Andrew Betts   | 70000    | Cook            | 666              | False        |
+----------------+----------+-----------------+------------------+--------------+

-- Select only the full names and phone extensions for only full-time employees.
SELECT "FullName", "PhoneExtension" FROM "Employees" WHERE "IsPartTime" = 'false';
+----------------+------------------+
| FullName       | PhoneExtension   |
|----------------+------------------|
| Isaac Rendon   | 111              |
| David Williams | 333              |
| Alex Rickard   | 555              |
| Andrew Betts   | 666              |
+----------------+------------------+

-- Insert a new part-time employee, as a software developer, with a salary of 450. Make up values for the other columns.
INSERT INTO "Employees" ("FullName","Salary","JobPosition","PhoneExtension","IsPartTime") 
VALUES ('Jake Liota','450000','Senior Developer','777','true');

-- Update all employees that are cooks to have a salary of 500.
UPDATE "Employees" SET "Salary" = '500000' WHERE "JobPosition" = 'Cook';

-- Delete all employees that have the full name of "Lazy Larry".
DELETE FROM "Employees" WHERE "FullName" = 'Lazy Larry';

--Add a column to the table: ParkingSpot as textual information that can store up to 10 characters.
ALTER TABLE "Employees" ADD COLUMN "ParkingSpot" VARCHAR(10);

-- In your CompanyDatabase, add a table named Departments with the following columns:
CREATE TABLE "Departments" ( 
 "Id" SERIAL PRIMARY KEY, 
 "DepartmentName" TEXT, 
 "Building" TEXT
 );

 -- Add a Foreign key DepartmentId to your Employees
 ALTER TABLE "Employees" ADD COLUMN "DepartmentId" INTEGER NULL REFERENCES "Departments" ("Id");

 -- Add tables named Products and Orders
 CREATE TABLE "Products" ( 
 "Id" SERIAL PRIMARY KEY, 
 "Price" FLOAT, 
 "Name" TEXT, 
 "Description" TEXT, 
 "QuantityInStock" INT
 );

 CREATE TABLE "Orders" ( 
 "Id" SERIAL PRIMARY KEY, 
 "OrderNumber" TEXT, 
 "DatePlaced" TIMESTAMP, 
 "Email" TEXT
 );

 -- In our company, one Order can have many Products and one Product can have many Orders. This will be a Many-to-Many relationship. 
 --Create the necessary table ProductOrders, foreign keys, and the OrderQuantity field needed for this to happen.
 CREATE TABLE "ProductOrders" ( 
 "OrderId" INTEGER NULL REFERENCES "Orders" ("Id"),
 "ProductId" INTEGER NULL REFERENCES "Products" ("Id"),
 "OrderQuantity" INT
 );

 --Insert the following Departments
 INSERT INTO "Departments" ("DepartmentName","Building")
 VALUES ('Development','Main');

 INSERT INTO "Departments" ("DepartmentName","Building")
 VALUES ('Marketing','North');

 -- Insert the following Employees
INSERT INTO "Employees" ("FullName","Salary","JobPosition","PhoneExtension","IsPartTime","DepartmentId") 
VALUES ('Tim Smith','40000','Programmer','123','false','1');

INSERT INTO "Employees" ("FullName","Salary","JobPosition","PhoneExtension","IsPartTime","DepartmentId") 
VALUES ('Barbara Ramsey','80000','Manager','234','false','1');

INSERT INTO "Employees" ("FullName","Salary","JobPosition","PhoneExtension","IsPartTime","DepartmentId") 
VALUES ('Tom Jones','32000','Admin','456','true','2');

-- Insert the following Products
INSERT INTO "Products" ("Price","Name","Description","QuantityInStock")
VALUES ('12.45','Widget','The Original Widget','100');

INSERT INTO "Products" ("Price","Name","Description","QuantityInStock")
VALUES ('99.99','Flowbee','Perfect for haircuts','3');

--  Insert a new order with order number X529, placed on Jan 1st, 2020 at 4:55PM, by someone with the email address "person@example.com"
INSERT INTO "Orders" ("OrderNumber","DatePlaced","Email")
VALUES ('X529','2020-01-01 16:55:00','person@exmaple.com');

-- Add an order quantity of 3 for the product named Widget to the order X529
INSERT INTO "ProductOrders" ("OrderId","ProductId","OrderQuantity")
VALUES ('1','1','3');

-- Add an order quantity of 2 for the product named Flowbee to the order X529
INSERT INTO "ProductOrders" ("OrderId","ProductId","OrderQuantity")
VALUES ('1','2','2');

-- Given a department id, return all employees in the department.
SELECT "FullName" FROM "Employees" WHERE "DepartmentId" = '1';

--Given a department name, return all the phone extensions.
SELECT "PhoneExtension" FROM "Employees" WHERE "DepartmentId" = '1';

-- Find all orders that contain the product id of 2.
SELECT "OrderId" FROM "ProductOrders" WHERE "ProductId" = '2';

--Remove the Flowbee product from order with order number X529.
DELETE FROM "ProductOrders" WHERE "ProductId" = '2';

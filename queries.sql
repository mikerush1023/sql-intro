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
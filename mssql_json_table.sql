--environment initialization
DROP TABLE IF EXISTS demo_customers;

CREATE TABLE demo_customers
(
    cid    int identity,
    name   nvarchar(50)  not null,
    age    int           not null,
    salary numeric(7, 2) not null,
    dob    date          not null
);

INSERT INTO dbo.demo_customers (name, age, salary, dob)
VALUES (N'James Lee', 57, 88000.00, N'1963-04-16');
INSERT INTO dbo.demo_customers (name, age, salary, dob)
VALUES (N'Nikki Wong', 42, 67640.00, N'1977-03-17');
INSERT INTO dbo.demo_customers (name, age, salary, dob)
VALUES (N'Nance Brady', 38, 96800.00, N'1981-03-11');
INSERT INTO dbo.demo_customers (name, age, salary, dob)
VALUES (N'Jacky Smith', 30, 96800.00, N'1991-03-11');

--convert table to JSON (simple)
SELECT cid    AS [Customer.cid],
       name   AS [Customer.name],
       age    AS [Customer.age],
       salary AS [Customer.salary],
       dob    AS [Customer.dob]
FROM dbo.demo_customers
FOR JSON PATH, ROOT ('Customer');

--convert table to JSON (nest with age group)
/*
 1.nest is a subset of json
 2.all brunch need to be together
 */
SELECT cid                    AS [Customer.cid],
       name                   AS [Customer.name],
       age                    AS [Customer.demographics.age],
       CASE
           WHEN age >= 30 AND age < 40 THEN '30-40'
           WHEN age <= 40 THEN '41-50'
           ELSE 'Over 50' END AS [Customer.demographics.agroup],
       dob                    AS [Customer.demographics.dob],
       salary                 AS [Customer.salary]
FROM dbo.demo_customers
FOR JSON PATH, ROOT ('Customer');

--convert JSON to table
DECLARE @json Nvarchar(MAX);
/*initial JSON parameter*/
SET @json = N'{"Customer":[{"Customer":{"cid":1,"name":"James Lee","age":57,"salary":88000.00,"dob":"1963-04-16"}},{"Customer":{"cid":2,"name":"Nikki Wong","age":42,"salary":67640.00,"dob":"1977-03-17"}},{"Customer":{"cid":3,"name":"Nance Brady","age":38,"salary":96800.00,"dob":"1981-03-11"}},{"Customer":{"cid":4,"name":"Jacky Smith","age":30,"salary":96800.00,"dob":"1991-03-11"}}]}';

SELECT *
FROM OPENJSON(@json,'$.Customer')
WITH (
    customer_id int '$.Customer.cid',
    customer_name nvarchar(50) '$.Customer.name',
    age int '$.Customer.age',
    salary numeric(7, 2) '$.Customer.salary',
    dob date '$.Customer.dob'
    );




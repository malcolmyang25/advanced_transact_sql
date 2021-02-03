create table sales
(
	trans_id nvarchar(10),
	sales_name nvarchar(20),
	team_name nvarchar(20),
	sales_amount int
)
go

INSERT INTO sales values ('0001','Amy','team1',100);
INSERT INTO sales values ('0002','Jame','team1',50);
INSERT INTO sales values ('0003','Amy','team1',40);
INSERT INTO sales values ('0004','Jack','team2',80);
INSERT INTO sales values ('0005','Jason','team2',180);
INSERT INTO sales values ('0006','Jack','team2',90);
INSERT INTO sales values ('0007','Naomi','team1',140);

--
--ROLLUP SUM UP
--1 Dimension
SELECT team_name,SUM(sales_amount) AS [total_sales] FROM sales
GROUP BY team_name WITH ROLLUP;

--2 Dimensions
SELECT sales_name,team_name,SUM(sales_amount) AS [total_sales] FROM sales
GROUP BY sales_name,team_name WITH ROLLUP;

--
--CUBE SUM UP
SELECT sales_name,team_name,SUM(sales_amount) AS [total_sales] FROM sales
GROUP BY sales_name,team_name WITH CUBE;
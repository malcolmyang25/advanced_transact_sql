
**SQL Server Cursor Example**
===
  
A database cursor is an object that enables traversal over the rows of a result set. It allows you to process individual row returned by a query. This script is mainly used to select the continue value in column and link together.   

This source list daily records, and this script will pick the cotinue period for each staff.
  

---  
Source Table
|staff_id|start_date|end_date  |
|--------|----------|----------|
|1       |2016-01-01|2016-01-02|
|1       |2016-01-02|2016-01-03|
|1       |2016-01-03|2016-01-04|
|1       |2016-01-04|2016-01-05|
|1       |2016-01-05|2016-01-06|
|1       |2016-01-09|2016-01-10|
|1       |2016-01-10|2016-01-11|
|1       |2016-01-11|2016-01-12|
|2       |2017-01-01|2017-01-02|
|2       |2017-01-02|2017-01-03|
|2       |2017-01-03|2017-01-04|
|2       |2017-01-04|2017-01-05|


---
Result:
|staff_id|start_date|end_date  |
|--------|----------|----------|
|1       |2016-01-01|2016-01-06|
|1       |2016-01-09|2016-01-12|
|2       |2017-01-01|2016-01-05|




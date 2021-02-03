# SQL Scripts for Microsoft SQL Server
This section includes some SQL Scripts for Microsoft SQL Server.

1.columns to row xml: using xml function to grouply combine string value in columns into single row.

2.Extract numebr only functions: extract only number from a string value.

3.interval time cursor: this is answer for a sql challenge. This script is mainly used to select the continue value in column and link together. 
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

Result:

|staff_id|start_date|end_date  |
|--------|----------|----------|
|1       |2016-01-01|2016-01-06|
|1       |2016-01-09|2016-01-12|
|2       |2017-01-01|2016-01-05|


4.date mapping: date mapping table is commonly used in Data Warehouse. This script is used to generate the date mapping tables.
Table format listed below:
| CalendarDate | CalendarYear | CalendarMonth | MonthStart | MonthEnd | CalendarQuarter | QuarterStart | QuarterEnd | FiscalYear | FiscalQuarter |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| 2021-01-02 | 2021 | Jan | 2021-01-01 | 2021-01-31 | Q1 | 2021-01-01 | 2021-03-31 | FY22 | Q3 |
| 2021-01-03 | 2021 | Jan | 2021-01-01 | 2021-01-31 | Q1 | 2021-01-01 | 2021-03-31 | FY22 | Q3 |


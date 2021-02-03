# ms_sql_script
This section includes some SQL Scripts for Microsoft SQL Server.

1.columns to row xml: using xml function to grouply combine string value in columns into single row.

2.Extract numebr only functions: extract only number from a string value.

3.interval time cursor: this is answer for a sql challenge. This script is mainly used to select the continue value in column and link together. (Sample value attached)

4.date mapping: date mapping table is commonly used in Data Warehouse. This script is used to generate the date mapping tables.
Table format listed below:
| CalendarDate | CalendarYear | CalendarMonth | MonthStart | MonthEnd | CalendarQuarter | QuarterStart | QuarterEnd | FiscalYear | FiscalQuarter |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| 2021-01-02 | 2021 | Jan | 2021-01-01 | 2021-01-31 | Q1 | 2021-01-01 | 2021-03-31 | FY22 | Q3 |
| 2021-01-03 | 2021 | Jan | 2021-01-01 | 2021-01-31 | Q1 | 2021-01-01 | 2021-03-31 | FY22 | Q3 |


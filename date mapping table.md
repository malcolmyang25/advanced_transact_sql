Date Mapping Table 
---


Date mapping table is commonly used in Data Warehouse. This script is used to generate the date mapping tables.  
[Click to view code](https://github.com/malcolmyang25/advanced_transact_sql/blob/main/date%20mapping%20table%20script.sql)

---
Table format listed below:
| CalendarDate | CalendarYear | CalendarMonth | MonthStart | MonthEnd | CalendarQuarter | QuarterStart | QuarterEnd | FiscalYear | FiscalQuarter |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| 2021-01-02 | 2021 | Jan | 2021-01-01 | 2021-01-31 | Q1 | 2021-01-01 | 2021-03-31 | FY22 | Q3 |
| 2021-01-03 | 2021 | Jan | 2021-01-01 | 2021-01-31 | Q1 | 2021-01-01 | 2021-03-31 | FY22 | Q3 |

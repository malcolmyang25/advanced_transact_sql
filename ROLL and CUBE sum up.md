ROLL and CUBE sum up
===
[Click to view code](https://github.com/malcolmyang25/ms_sql_script/blob/main/ROLLUP%20and%20CUBE%20sum%20up.sql)
ROLLUP and CUBE are simple extensions to the SELECT statement's GROUP BY clause.  
ROLLUP creates subtotals at any level of aggregation needed, from the most detailed up to a grand total.  
CUBE is an extension similar to ROLLUP , enabling a single statement to calculate all possible combinations of subtotals.

---
Example 1: 1 dimension ROLLUP
| team\_name | total\_sales |
| :--- | :--- |
| team1 | 330 |
| team2 | 350 |
| NULL | 680 |

---
Example 2: 2 dimension ROLLUP
| team\_name | sales\_name | total\_sales |
| :--- | :--- | :--- |
| team1 | Amy | 140 |
| team1 | Jame | 50 |
| team1 | Naomi | 140 |
| team1 | NULL | 330 |
| team2 | Jack | 170 |
| team2 | Jason | 180 |
| team2 | NULL | 350 |
| NULL | NULL | 680 |

--
Example 3: 2 dimension CUBE
| team\_name | sales\_name | total\_sales |
| :--- | :--- | :--- |
| team1 | Amy | 140 |
| NULL | Amy | 140 |
| team2 | Jack | 170 |
| NULL | Jack | 170 |
| team1 | Jame | 50 |
| NULL | Jame | 50 |
| team2 | Jason | 180 |
| NULL | Jason | 180 |
| team1 | Naomi | 140 |
| NULL | Naomi | 140 |
| NULL | NULL | 680 |
| team1 | NULL | 330 |
| team2 | NULL | 350 |

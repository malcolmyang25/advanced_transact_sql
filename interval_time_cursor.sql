DECLARE @result TABLE
(
emp_id            INT,
start_date        DATE,
end_date         DATE,
nth_chain        INT
--PRIMARY KEY (emp_id)
);

DECLARE 
@emp_id                  AS INT,
@current_emp_id    AS INT,
@start_date 	AS DATE,
@end_date              AS DATE,
@nth_chain  	AS INT,
@nth_start_date    AS DATE,
@last_end_date      AS DATE;

DECLARE mycursor CURSOR FAST_FORWARD FOR
SELECT emp_id, timesheet_start_date, timesheet_end_date
FROM test_db.dbo.TIMESHEET2
--WHERE emp_id=1
ORDER BY emp_id, timesheet_start_date;

OPEN mycursor;

FETCH NEXT FROM mycursor INTO @emp_id, @start_date, @end_date;
SET @nth_chain=1;
SET @nth_start_date=@start_date;
SET @last_end_date=@end_date;
SET @current_emp_id=@emp_id;

WHILE @@FETCH_STATUS=0
BEGIN
   	 FETCH NEXT FROM mycursor INTO @emp_id, @start_date, @end_date;
  	 IF @current_emp_id=@emp_id
		BEGIN
			  IF @last_end_date = @start_date
				  BEGIN
						SET @nth_chain=@nth_chain+1;
						SET @last_end_date=@end_date;
						CONTINUE;
				   END
			   ELSE
				   BEGIN
						INSERT INTO @result (emp_id,start_date,end_date,nth_chain) VALUES (@current_emp_id, @nth_start_date, @last_end_date,@nth_chain);
						SET @nth_chain=1;
						SET @nth_start_date=@start_date;
						SET @last_end_date=@end_date;
				   END
        END
     ELSE
        BEGIN   
			   INSERT INTO @result (emp_id,start_date,end_date,nth_chain) VALUES (@current_emp_id, @nth_start_date, @last_end_date,@nth_chain);
		       SET @nth_chain=1;
               SET @nth_start_date=@start_date;
               SET @last_end_date=@end_date;
               SET @current_emp_id=@emp_id;
		END
	END

CLOSE mycursor;        
DEALLOCATE mycursor;    

select emp_id,
start_date,end_date,
--CONVERT(VARCHAR(10),start_date,120) AS start_date,
--CONVERT(VARCHAR(10),end_date,120) AS end_date,
nth_chain FROM @result 
ORDER BY emp_id, start_date

	
     






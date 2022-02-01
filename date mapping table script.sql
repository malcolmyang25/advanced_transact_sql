create table Calendar_Test
    (
        CalendarDate    date ,
        CalendarYear    varchar(4),
        CalendarMonth   varchar(3),
        MonthStart      date,
        MonthEnd        date,
        CalendarQuarter varchar(2),
        QuarterStart    date,
        QuarterEnd      date,
        FiscalYear      varchar(4),
        FiscalQuarter   varchar(2)
    )
go

SELECT * FROM Calendar_Test;
go

DECLARE @loop_startdate date,
        @loop_enddate date,
        @next_calendar_date date,
        @next_calendar_year int,
        @next_calendar_month varchar(4),
        @next_monthstart date,
        @next_monthend date,
        @next_calendarquarter varchar(3),
        @next_quarterstart date,
        @next_quarterend date,
        @next_fiscalyear varchar(4),
        @next_fiscalquarter varchar(2)

/*
set up the loop start date and end date to define the table range
 */

SET @loop_startdate = convert(date,'2021-1-1')
SET @loop_enddate = getdate()

WHILE @loop_startdate<@loop_enddate
BEGIN
    SET @next_calendar_date= @loop_startdate
    SET @next_calendar_year = YEAR(@next_calendar_date)
    SET @next_calendar_month = FORMAT(@next_calendar_date,'MMM')
    SET @next_monthstart = DATEADD(DAY,1,EOMONTH(@next_calendar_date,-1))
    SET @next_monthend = EOMONTH(@next_calendar_date)
    SET @next_calendarquarter = 'Q'+convert(varchar(1),DATEPART(q,@next_calendar_date))
    SET @next_quarterstart = DATEADD(q,DATEDIFF(q,0,@next_calendar_date),0)
    SET @next_quarterend = DATEADD(d,-1,DATEADD(q,DATEDIFF(q,0,@next_calendar_date)+1,0))
    SET @next_fiscalyear = 'FY'+FORMAT(DATEADD(year,1,@next_calendar_date),'yy')
    SET @next_fiscalquarter = CASE WHEN MONTH(@next_calendar_date)<4 THEN 'Q3'
                                     WHEN MONTH(@next_calendar_date)<7 THEN 'Q4'
                                     WHEN MONTH(@next_calendar_date)<10 THEN 'Q1'
                                     ELSE 'Q2' END
    INSERT INTO Calendar_Test (CalendarDate, CalendarYear, CalendarMonth, MonthStart, MonthEnd,
                               CalendarQuarter, QuarterStart, QuarterEnd, FiscalYear, FiscalQuarter)
    values (@next_calendar_date,@next_calendar_year,@next_calendar_month,@next_monthstart,@next_monthend,
                                        @next_calendarquarter,@next_quarterstart,@next_quarterend,
                                      @next_fiscalyear,@next_fiscalquarter);
    SET @loop_startdate = DATEADD(day,1,@loop_startdate);
END
GO

SELECT * FROM Calendar_Test;
go


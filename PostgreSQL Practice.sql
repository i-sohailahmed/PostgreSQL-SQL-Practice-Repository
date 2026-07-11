create table new1
(
 "ID" numeric primary key,
 "Name" varchar(20) not null,
 "Age" int not null,
 "City" varchar(30), 
 "Salary" numeric

);

Select * from new1

INSERT INTO new1
("ID", "Name", "Age", "City", "Salary")
VALUES
(1, 'Sam', 25, 'Delhi', 5000),
(2, 'Pam', 26, 'Jaipur', 9000),
(3, 'Ram', 27, 'Mumbai', 8000),
(4, 'Tam', 29, 'Goa', 10000);


Update new1
set "Name" = 'Xam', "Age" = 32
Where "ID" = 4;

Delete from new1
Where "ID" = 4;

Alter table new1
Add column "Pin code" numeric ;

Alter table new1
Drop column "Pin code";

Alter table new1
rename column "Pin code" TO "Zip code";

Alter table new1
Alter column "Zip code" Type Varchar(50) ;

Truncate table new1

Drop table new1

Select "ID" from new1
Select * from new1

Update new1
set "Salary" = '9000'
Where "ID" = 3;

Select Distinct "Salary" from new1

Select "Salary" from new1
Where "Salary" <= 8000;

Select "Salary" from new1
Where "Salary" >= 8000 and "City" = 'Jaipur' ;

Select * from new1
Where "Salary" >= 8000 and "City" = 'Jaipur' ;

Select * from new1
Order by "Name" ASC
Limit 3


Select UPPER("Name") from new1
Select LOWER("Name") from new1
Select length("Name"), "Name" from new1
Select Substring("Name", 1, 2), "Name" from new1
Select Concat("Name", "Salary"), "Name" from new1
Select Substring("Name", 1, 2), "Name" from new1
Select Replace("Name", 'Sam', 'Marry'), "Name" from new1


Select COUNT(*) from new1
Select COUNT("Salary") from new1
Select SUM("Salary") from new1
Select MAX("Salary") from new1
Select MIN("Salary") from new1
Select AVG("Salary") from new1
Select ROUND(AVG("Salary"), 2) from new1

Alter table new1
Add column "Payment mode" varchar ;
Select * from new1
order by "ID" ASC 
Update new1
set "Payment mode" = 'Card'
Where "ID" = 3;

Select "Payment mode", SUM("Salary") AS "Total"
From new1
Group by "Payment mode"
Order by "Total" ASC

Select "Payment mode", SUM("Salary") AS "Total"
From new1
Group by "Payment mode"
Having SUM("Salary") = 9000

Select "Payment mode", Count("Salary") AS "Total"
From new1
Group by "Payment mode", "City"
Having Count("Salary") = 1 and "City" = 'Jaipur'

Select * from new1
Show TIMEZONE
Select NOW()
Select timeofday()
Select CURRENT_TIME
Select CURRENT_DATE

Select * from new1
Alter table new1
Add column "Payment Date" varchar ;
order by "ID" ASC 
Update new1
set "Payment Date" = '06/06/2000'
Where "ID" = 4;

ALTER TABLE new1
ALTER COLUMN "Payment Date" TYPE DATE
USING TO_DATE("Payment Date", 'DD/MM/YYYY');

Select Extract(Month from "Payment Date" ) AS "Payment month", "Payment Date" from new1
Select Extract(Year from "Payment Date" ) AS "Payment year", "Payment Date" from new1
Select Extract(DOW from "Payment Date" ) AS "Payment DOB", "Payment Date" from new1
Select Extract(DAY from "Payment Date" ) AS "Payment DAY", "Payment Date" from new1
Select Extract(QUARTER from "Payment Date" ) AS "Payment Quarter", "Payment Date" from new1


Select * from new2

create table new2
(
 "ID" numeric primary key,
 "Name" varchar(20) not null,
 "Age" int not null,
 "Area" varchar(30), 
 "Payment" numeric

);


INSERT INTO new2
("ID", "Name", "Age", "Area", "Payment")
VALUES
(1, 'Aam', 35, 'Surat', 15000),
(2, 'Bam', 36, 'Udaipur', 29000),
(3, 'Cam', 37, 'Pune', 38000),
(4, 'Dam', 39, 'Shimla', 40000);


SELECT
    C."ID"
FROM new1 AS C
INNER JOIN new2 AS P
    ON C."ID" = P."ID"
GROUP BY C."ID"
HAVING C."ID" <= 3
ORDER BY C."ID" DESC;

Select C."Name", P."Payment", P."Area"
From new1 as C
Inner join new2 as P
ON C."ID" = P."ID"

Select *
From new1 as C
Left join new2 as P
ON C."ID" = P."ID"

Select *
From new1 as C
Right join new2 as P
ON C."ID" = P."ID"

Select *
From new1 as C
Full outer join new2 as P
ON C."ID" = P."ID"

Select T1."Name" as Emp_name, T2."Name" as Manager_name
from new1 as T1
Join new1 as T2
on T2."ID" = T1."Manager ID"

Select "ID" from new1
Union
Select "ID" from new2

Select "ID" from new1
Union all
Select "ID" from new2

Sub query ----

Select * from new2
Select Avg("Payment")from new2

Select * from new2
Where "Payment" > (Select Avg("Payment")from new2
)

Select "ID", "Name", "Payment mode" from new1
where "ID" in (Select "ID" from new1)

Select "ID", "Payment" from new2
Where  "Payment" > 30000

Select "Name", "ID" from new1 as C
Where EXISTS (Select "ID", "Payment" from new2 as P
Where P."ID" = C."ID" and "Payment" > 30000
)

Select * from new1

select "Salary", "ID",
Sum("Salary") OVER (PARTITION by "ID" ORDER by "Salary") as "Total",
AVG("Salary") OVER (PARTITION by "ID" ORDER by "Salary") as "Average",
Count("Salary") OVER (PARTITION by "ID" ORDER by "Salary") as "Count",
Min("Salary") OVER (PARTITION by "ID" ORDER by "Salary") as "Min",
Max("Salary") OVER (PARTITION by "ID" ORDER by "Salary") as "Max"
From new1


select "Salary", "ID",
Sum("Salary") OVER (Order by "Salary" ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING ) as "Total",
AVG("Salary") OVER (Order by "Salary" ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING ) as "Average",
Count("Salary") OVER (Order by "Salary" ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING ) as "Count",
Min("Salary") OVER (Order by "Salary" ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING ) as "Min",
Max("Salary") OVER (Order by "Salary" ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING ) as "Max"
From new1

select "Salary", "ID",
ROW_NUMBER() OVER (Order by "Salary") as "Row number",
RANK() OVER (Order by "Salary") as "Rank",
DENSE_RANK() OVER (Order by "Salary") as "DENSE_RANK",
Percent_RANK() OVER (Order by "Salary") as "Percent_RANK"
From new1

select "Salary", "ID",
FIRST_VALUE("Salary") OVER(Order by "Salary") AS "First_Value",
LAST_VALUE("Salary") OVER(Order by "Salary") AS "Last_Value",
LEAD("Salary") OVER(Order by "Salary") AS "Lead",
LAG("Salary") OVER(Order by "Salary") AS "LAG"
From new1

select "Salary", "ID",
LEAD("Salary", 2) OVER(Order by "Salary") AS "Lead",
LAG("Salary", 2) OVER(Order by "Salary") AS "LAG"
From new1
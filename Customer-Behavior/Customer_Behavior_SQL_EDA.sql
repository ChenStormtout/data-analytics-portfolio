
--ambil semua data
select * from customer_behavior_cleaned cbc ;

--ambil beberapa kolom
select "Customer ID", "City","Membership Type","Total Spend"
from customer_behavior_cleaned cbc ;

--Filter Pelanggan Gold

select * 
from customer_behavior_cleaned cbc 
where cbc."Membership Type" = 'Gold';

--Pelanggan usia >35
select * 
from customer_behavior_cleaned cbc 
where cbc."Age" > 35 ;

--Pelanggan dengan diskon

SELECT *
FROM customer_behavior_cleaned cbc 
where cbc."Discount Applied" = true;

--Total revenue

select sum ("Total Spend") as Total_Revenue
from customer_behavior_cleaned cbc ;

--avg spend

select avg ("Total Spend") as Average_Spend
from customer_behavior_cleaned cbc ;

--min max
select Min("Total Spend") as Min_Spend,
 max("Total Spend") as Max_Spend
from customer_behavior_cleaned cbc ;

--Jumlah customer per membership

select cbc."Membership Type" , count(*) as total_customer
from customer_behavior_cleaned cbc 
group by "Membership Type" ;


select cbc."Membership Type" , avg(cbc."Total Spend" ) as avg_spend
from customer_behavior_cleaned cbc 
group by "Membership Type" ;

--City dengan rata-rata spending > 15.000
select cbc."City",avg("Total Spend") as avg_spend
from customer_behavior_cleaned cbc 
group by cbc."City" 
having avg("Total Spend") > 15000;


select cbc."Membership Type" , sum(cbc."Total Spend" ) as revenue
from customer_behavior_cleaned cbc 
group by "Membership Type" 
order by revenue desc;


--Segmentasi umur
select "Customer ID",
"Age",
case
	when "Age" > 30 then 'young'
	when "Age" between 30 and 50 then 'adult'
	else 'Elder'
end as age_segment
from customer_behavior_cleaned cbc ;

--Segmentasi customer value
select "Customer ID",
"Total Spend",
case
	when "Total Spend" >=50000 then 'High Value'
	when "Total Spend" >= 15000 then 'Mid Value'
	else 'Low Value'
end as Customer_Value
from customer_behavior_cleaned cbc ;

-- Cek data aneh / unknown
select * from customer_behavior_cleaned cbc 
where "Satisfaction Level" not in ('Satisfied','Neutral','Unsatisfied');

--Cek pelanggan tidak aktif (churn candidate)
SELECT *
FROM customer_behavior_cleaned cbc 
WHERE cbc."Days Since Last Purchase"  > 45;

--Ranking customer berdasarkan spending
select "Customer ID", 
"Total Spend", 
dense_rank() over(order by "Total Spend" desc) as spend_rank
from customer_behavior_cleaned cbc 

--Top spender per city
SELECT *
FROM (
    SELECT "Customer ID",
           "City",
           "Total Spend",
           RANK() OVER (PARTITION BY "City" ORDER BY "Total Spend" DESC) AS rnk
    FROM customer_behavior_cleaned cbc 
) t
WHERE rnk = 1;


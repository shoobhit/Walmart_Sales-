-- Q1  What are the different payment methods, and how many transactions and items were sold with each method?

select DISTINCT payment_method as Payment_mode, SUM(quantity) as no_qty_sold,
COUNT(payment_method) Transaction_Count
from walmart
group by payment_method
order by transaction_count desc;


-- Q2 Which category received the highest average rating in each branch?

with high_avg as (
select  branch, category, avg(rating) as avg_rating,
rank() over(partition by branch order by avg(rating) desc) as rnk
from walmart
group by branch, category
)

select * 
from high_avg
where high_avg.rnk =1;



-- Q3 What is the busiest day of the week for each branch based on transaction volume?

select branch, 
TO_char(to_date(date, 'DD/MM/YY'), 'Day') as day,
count(*) as no_of_transaction
from walmart
group by branch, day
order by branch, 3 desc;

-- Q4 How many items were sold through each payment method?

select * from walmart;
select payment_method,
sum(quantity) as item_sold
from walmart
group by 1;


-- Q5 What are the average, minimum, and maximum ratings for each category in each city?

select city, category, 
min(rating) min_rating,
max(rating) max_rating,
avg(rating) avg_rating
from walmart
group by 1,2
;


-- Q6 What is the total profit for each category, ranked from highest to lowest?

select * from walmart;


select category, sum(total*profit_margin) as total_profit,
rank() over(partition by category order by sum(total*profit_margin) desc) rnk
from walmart
group by 1;


-- Q7  What is the most frequently used payment method in each branch?

with branch_cte as(
select branch, payment_method, count(payment_method) as total_trans,
rank() over(partition by branch order by count(payment_method) desc) as rnk
from walmart
group by 1,2
)

select *
from branch_cte
where rnk = 1
;

-- Q8 How many transactions occur in each shift (Morning, Afternoon, Evening)  across branches?
select branch,
CASE 
	WHEN EXTRACT(HOUR FROM (time::time)) < 12 THEN 'Morning'
	WHEN EXTRACT(HOUR FROM (time::time)) BETWEEN 12 AND 17 THEN 'Afternoon'
	ELSE 'Evening'
	END Shift,
	count(*) as no_of_transaction

from walmart
group by 1,2
order by 1,3 desc
;

-- Q9 Identify 5 branch with highest decrease ratio in revenue compare to last year (current year 2023 and last was 2022)


select * from walmart;

with revenue_2022 as(
	select 
		branch,
		sum(total) as revenue,
		extract(year from to_date(date, 'DD/MM/YY')) AS year
	from walmart
	where extract(year from to_date(date, 'DD/MM/YY')) = 2022
	group by 1,3

),

revenue_2023 as (
select 
branch,
sum(total) as revenue,
extract(year from to_date(date, 'DD/MM/YY')) AS year
from walmart
where extract(year from to_date(date, 'DD/MM/YY')) = 2023
group by 1,3

)

select 
	ls.branch, 
	ls.revenue as last_year_revenue, 
	cs.revenue as current_year_revenue, 
	round(((ls.revenue-cs.revenue)::numeric/ls.revenue::numeric)*100,2)
	as revenue_ratio
from revenue_2022 as ls
join revenue_2023 as cs
on ls.branch = cs.branch
where cs.revenue < ls.revenue 
order by 4 desc
limit 5


;


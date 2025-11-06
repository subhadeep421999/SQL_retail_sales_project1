use project1;
select * from retail_sales;

-- Check null values are present or not in column
select count(*) as null_count from retail_sales where total_sale is null;
select year(sale_date) from retail_sales;
select sale_date from retail_sales;
DESC retail_sales;

-- Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05

select * from retail_sales where sale_date = '05-11-2022';



-- Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 4 in the month of Nov-2022

select * from retail_sales where category='Clothing' and year(sale_date)=2022 
and month(sale_date)=11 and quantity >=4;



-- Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.

select category, sum(total_sale) as net_sale, count(*) as total_orders 
from retail_sales group by category;



-- Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.

select round(avg(age),2) as avg_age from retail_sales
where category= 'Beauty';



-- Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000.

select * from retail_sales where total_sale >1000;



-- Q.6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.

select category, gender, count(*) as total_transaction from retail_sales
group by category, gender order by total_transaction desc;



-- Q.7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year

select *, rank() over (partition by year order by avg_sale desc) as rank_in_year from 
(select year(sale_date) as year, month(sale_date) as month, avg(total_sale) as avg_sale
from retail_sales group by year,month) as monthly_avg;



-- Q.8 Write a SQL query to find the top 5 customers based on the highest total sales 

select customer_id, sum(total_sale) as net_sale from retail_sales
group by customer_id order by net_sale desc limit 5;



-- Q.9 Write a SQL query to find the number of unique customers who purchased items from each category.

select category, count(distinct customer_id) as count_of_distinct_customer
from retail_sales group by category;



-- Q.10 Write a SQL query to create each shift and number of orders (Example Morning <12, Afternoon Between 12 & 17, Evening >17)

select 
Case when hour(sale_time) < 12 then 'Morning'
     when hour(sale_time) between 12 and 17 then 'Afternoon'
     else 'Evening'
     end as shift,
count(*) as num_orders
from retail_sales group by shift;








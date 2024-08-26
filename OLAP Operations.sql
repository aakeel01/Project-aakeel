/*1. Database Creation
Create a database to store the sales data (Redshift or PostgreSQL).
Create a table named "sales_sample" with the specified columns:
Product_Id (Integer)
Region (varchar(50))-like East ,West etc
Date (Date)
Sales_Amount (int/numeric)*/

create table sales_sample
(Product_Id int,
Region varchar (50),
Date date,
Sales_Amount int)
/*2. Data Creation
Insert 10 sample records into the "sales_sample" table, representing sales data.*/

insert into sales_sample values
(301,'east','2024-09-01',1000.00),
(302,'west','2024-09-02',1100.00),
(303,'north','2024-09-03',1200.00),
(304,'south','2024-09-04',1300.00),
(305,'east','2024-09-05',1400.00),
(306,'west','2024-09-06',1500.00),
(307,'north','2024-09-07',1600.00),
(308,'south','2024-09-08',1700.00),
(309,'east','2024-09-09',1800.00),
(310,'west','2024-09-10',1000.00);

select *
from sales_sample;

/*a) Drill Down-Analyze sales data at a more detailed level. Write a query to perform drill down
from region to product level to understand sales performance.*/

WITH RegionalSales AS (
    SELECT
        Region,
        SUM(sales_amount) AS total_sales
    FROM
        sales_sample
    GROUP BY Region),
ProductSales AS (
    SELECT
        region,
        Product_Id,
        SUM(sales_amount) AS total_sales
    FROM
        sales_sample
    GROUP BY
           region, product_id
)

-- Choose a region to drill down into
SELECT
    rs.region,
    ps.product_Id,
    ps.total_sales AS product_sales
FROM
    RegionalSales rs
JOIN
    ProductSales ps
ON
    rs.region = ps.region
WHERE
    rs.region = 'east'  -- Replace with the desired region_id
ORDER BY
    ps.total_sales DESC;

/*b) Rollup- To summarize sales data at different levels of granularity. Write a query to perform
roll up from product to region level to view total sales by region*/

select region, product_Id,sum(Sales_Amount) as total_sales
from sales_sample
group by rollup (region,product_Id)
order by product_Id;

/*c) Cube - To analyze sales data from multiple dimensions simultaneously. Write a query to
Explore sales data from different perspectives, such as product, region, and date.*/

SELECT
    product_id,
    region,
    date,
    SUM(sales_amount) AS total_sales
FROM
    sales_sample
GROUP BY
    CUBE (product_id, region, date)
ORDER BY
    product_id,
    region,
    date;

/*d) Slice- To extract a subset of data based on specific criteria. Write a query to slice the data to
view sales for a particular region or date range.*/

SELECT
    product_id,
    SUM(sales_amount) AS total_sales
FROM
    sales_sample
WHERE
    region = 'north'
    AND date BETWEEN '2024-09-01' AND '2024-09-09'
GROUP BY
    product_Id
ORDER BY
    product_Id;


/*e) Dice - To extract data based on multiple criteria. Write a query to view sales for specific
combinations of product, region, and date*/

SELECT
    product_Id,
    region,
    date,
    SUM(sales_amount) AS total_sales
FROM
    sales_sample
WHERE
    product_id IN (301, 303)
    AND region IN ('east','north')
    AND date IN ('2024-09-01', '2024-09-08')
GROUP BY
    product_Id,
    region,
    date
ORDER BY
    product_Id,
    region,
    date;








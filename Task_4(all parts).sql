Task 4

1) Database Creation
   --- create database
   
Create database sales_analysis;

-- Create the sales_sample table

CREATE TABLE sales_sample (
    Product_Id INTEGER,
    Region VARCHAR(50),
    Date DATE,
    Sales_Amount NUMERIC
);

 


2) Data Creation
-- Insert sample data into sales_sample table

INSERT INTO sales_sample (Product_Id, Region, Date, Sales_Amount) VALUES
(1, 'East', '2023-01-01', 500),
(2, 'West', '2023-01-02', 700),
(3, 'North', '2023-01-03', 800),
(4, 'South', '2023-01-04', 600),
(1, 'East', '2023-02-01', 550),
(2, 'West', '2023-02-02', 750),
(3, 'North', '2023-02-03', 850),
(4, 'South', '2023-02-04', 650),
(1, 'East', '2023-03-01', 600),
(2, 'West', '2023-03-02', 800);
 


3) --Perform OLAP operations
 a) DRILL DOWN

-- Drill Down from region to product level

SELECT 
    Region,
    Product_Id,
    SUM(Sales_Amount) AS Total_Sales
FROM  sales_sample
GROUP BY 1,2
ORDER BY 
    Region, Product_Id;




b)	ROLLUP
-- Rollup from product to region level
SELECT 
    Region,
    SUM(Sales_Amount) AS Total_Sales
FROM 
    sales_sample
GROUP BY 
    ROLLUP (Region)
ORDER BY 
    Region;




c)	CUBE
-- Cube to analyze sales data from different perspectives
--here, have used COALESCE to convert the data into text and handle NULL values , wherever null is present in the
--table, replacing it with some text for better readability
SELECT 
    COALESCE(Product_Id::TEXT, 'All Products') AS Product,
    COALESCE(Region, 'All Regions') AS Region,
    COALESCE(Date::TEXT, 'All Dates') AS Date,
    SUM(Sales_Amount) AS Total_Sales
FROM 
    sales_sample
GROUP BY 
    CUBE (Product_Id, Region, Date)
ORDER BY 
    Product, Region, Date;




d)	SLICE
-- Slice to view sales for a particular region
SELECT 
    Product_Id,
    Region,
    Date,
    Sales_Amount
FROM 
    sales_sample
WHERE 
    Region = 'East';

-- Slice to view sales for a particular date range
SELECT 
    Product_Id,
    Region,
    Date,
    Sales_Amount
FROM 
    sales_sample
WHERE 
    Date BETWEEN '2023-01-01' AND '2023-02-01';




e)	DICE

-- Dice to view sales for specific combinations of product, region, and date
SELECT 
    Product_Id,
    Region,
    Date,
    Sales_Amount
FROM 
    sales_sample
WHERE 
    Product_Id IN (1, 2)
    AND Region IN ('East', 'West')
    AND Date BETWEEN '2023-01-01' AND '2023-03-01';

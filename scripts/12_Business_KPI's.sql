-- Business KPI's
SELECT 'Total Revenue' AS Measure_Name, ROUND(SUM(Total_Price), 2) AS Measure_Value
FROM sales.orders

UNION ALL

SELECT 'Total Quantity Sold' As Measure_Name, SUM(Quantity) As Measure_Value
FROM sales.orders

UNION ALL

SELECT 'Average Selling Price' As Measure_Name, ROUND(AVG(Price), 2) As Measure_Value
FROM sales.orders

UNION ALL

SELECT 'Total Number of Orders' As Measure_Name, COUNT(DISTINCT Order_ID) As Measure_Value
FROM sales.orders

UNION ALL

SELECT 'Total Categories' As Measure_Name, COUNT(DISTINCT Category) As Measure_Value 
FROM sales.orders

UNION ALL

SELECT 'Total Subcategories' As Measure_Name, COUNT(DISTINCT Subcategory) As Measure_Value
FROM sales.orders

Union All 

Select 'Total Customers' As Measure_Name, Count(Distinct Concat(First_Name,' ',Last_Name)) As Measure_Value
From sales.orders


Union All 

Select
'Average Order Value' As Measure, Round(Total_Revenue/Tota_Orders,2)  As Measure_Value
From (Select Round(Sum(Total_Price),2) As Total_Revenue , Count(*) As Tota_Orders  From Sales.orders )t


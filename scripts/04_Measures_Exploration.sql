--===============================================================================
-- Measures Exploration (Key Metrics)
--===============================================================================
-- Finding The Business Big Numbers 
--===============================================================================

-- Find the Total Revenue 
Select 
Round(Sum(Total_Price),2) As Total_Revenue 
From sales.orders

--Find the Total Quantity Sold 
Select 
Round(Sum(Quantity),2 As Total 
From sales.orders

--Find the average selling price
Select 
Round(Avg(Price),2) As Avg_Price
From sales.orders

-- Find the Total number of Orders
Select 
Count(Order_ID) As Total_Orders
From sales.orders

--Find the Total  number of categories 
Select 
Count( Distinct Category) As Total_Category
From sales.orders

--Find the Total number of Subcategory 
Select 
Count( Distinct Subcategory) As Total_Subcategory
From sales.orders


-- Find the total number of customers
Select 
Count(Order_ID) As Total_Orders
From sales.orders

--Find the total customers 
Select 
Count(Distinct Concat(First_Name,' ',Last_Name)) As Full_Name
From sales.orders

--Average Order Value 
Select 
Total_Revenue/Tota_Orders  As Average_Order_Value
From(
Select 
Round(Sum(Total_Price),2) As Total_Revenue ,
Count(*) As Tota_Orders  
From Sales.orders 
) t

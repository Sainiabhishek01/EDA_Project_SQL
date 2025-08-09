--===============================================================================
--Ranking Analysis
--===============================================================================
--What are the Top 3 Categories in terms of revenue?
Select *
From(
Select 
Row_Number() Over(Order By Sum(Total_Price) Desc) As Ranks,
Category,
Round(Sum(Total_Price),2) As Total_Revnue
From Sales.orders
Group BY Category
)t
Where Ranks <= 3


--What are the 3 worst-performing Categories in terms of Revenue?
Select *
From(
Select 
Row_Number() Over(Order By Sum(Total_Price) ) As Ranks,
Category,
Round(Sum(Total_Price),2) As Total_Revnue
From Sales.orders
Group BY Category
)t
Where Ranks <= 3


--What are the Top 3 Subcategories in terms of sold quantity?
Select Top 3
Subcategory,
Sum(Quantity) As Total_Quantity 
From Sales.orders
Group BY Subcategory
Order By Sum(Quantity) Desc


-- What are the worst 3 Subcategories in terms of sold quantity?
Select Top 3
Subcategory,
Sum(Quantity) As Total_Quantity 
From Sales.orders
Group BY Subcategory
Order By Sum(Quantity) 


-- Which 5 Subcategories Generating the Highest Revenue?
-- Dynamic

SELECT Ranks,
Subcategory
FROM 
(
  SELECT 
    ROW_NUMBER() OVER (ORDER BY ROUND(SUM(Total_Price), 2) DESC) AS Ranks,
    Subcategory,
    ROUND(SUM(Total_Price), 2) AS Total_Revenue
  FROM sales.orders
  GROUP BY Subcategory
) t 
WHERE Ranks < = 5;


-- What are the 5 worst-performing Subcategories in terms of Revenue?

SELECT Ranks,
Subcategory,
Total_Revenue
FROM 
(
  SELECT 
    ROW_NUMBER() OVER (ORDER BY ROUND(SUM(Total_Price), 2) ) AS Ranks,
    Subcategory,
    ROUND(SUM(Total_Price), 2) AS Total_Revenue
  FROM sales.orders
  GROUP BY Subcategory
) t 
WHERE Ranks < = 5;

-- Find the top 10 customers who have generated the highest revenue
Select * 
From 
(
Select 
Row_Number() Over(Order By  Concat(First_Name,' ',Last_Name) Desc) As Ranks,
Concat(First_Name,' ',Last_Name) As Full_Name,
Round(Sum(Total_Price),2) Total_Revenue
From sales.orders
Group By Concat(First_Name,' ',Last_Name)
)t
Where Ranks < = 5

---- The 3 customers with the fewest orders placed
Select
* 
From
(
Select 
Row_Number() Over( Order By Count(Order_Id) ) AS Ranks,
Concat(First_Name,' ',Last_Name) As Full_Name,
Count(Order_Id) As Total_Orders
From sales.orders
Group By Concat(First_Name,' ',Last_Name)
)t
Where Ranks <= 3

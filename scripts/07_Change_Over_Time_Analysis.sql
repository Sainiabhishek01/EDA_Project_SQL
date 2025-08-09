
/*
===============================================================================
Change Over Time Analysis
===============================================================================
Purpose:
    - To track trends, growth, and changes in key metrics over time.
    - For time-series analysis and identifying seasonality.
    - To measure growth or decline over specific periods.

SQL Functions Used:
    - Date Functions: DATEPART(), DATETRUNC(), FORMAT()
    - Aggregate Functions: SUM(), COUNT(), AVG()
===============================================================================
*/

-- Analyse sales & Quantity performance over time
Select 
Year(Order_Date) As Order_Year,
Month(Order_Date) As Order_Month,
Count(Order_Id) Total_Orders,
COUNT(DISTINCT CONCAT(First_Name, ' ', Last_Name)) AS Total_Customers, -- For Unique Customers 
Sum(Quantity) Total_Quantity,
Round(Sum(Total_Price),2) As Total_Sales,
Round(Avg(Total_Price),2) As Average_Sales,
Round(Avg(Price),2) Avg_Price,
Max(Round(Total_Price,2)) As Highest_Sales,
Min(Round(Total_Price,2)) As Lowest_Sales
From Sales.orders
Where Order_ID Is Not NUll 
Group By Year(Order_Date),Month(Order_Date) 
Order by 1,2

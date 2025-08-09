
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
Count(Order_Id) Total_Customers,
Sum(Quantity) Total_Quantity,
Round(Sum(Total_Price),2) As Total_Sales
From Sales.orders
Where Order_ID Is Not NUll 
Group By Year(Order_Date),Month(Order_Date) --Format Funcation 
Order by 1,2

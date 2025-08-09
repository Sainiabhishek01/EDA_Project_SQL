/*
===============================================================================
Cumulative Sales & Quantity Analysis
===============================================================================
Purpose:
    - Calculate monthly total sales and quantity sold.
    - Track running (cumulative) totals over time.
===============================================================================
*/

WITH MonthlyStats AS (
    SELECT
        YEAR(Order_Date) AS Order_Year,
        MONTH(Order_Date) AS Order_Month,
        FORMAT(Order_Date, 'yyyy-MM') AS Year_Month,
        ROUND(SUM(Total_Price), 2) AS Total_Sales,
        SUM(Quantity) AS Total_Quantity
    FROM Sales.orders
    WHERE Order_ID IS NOT NULL
    GROUP BY YEAR(Order_Date), MONTH(Order_Date), FORMAT(Order_Date, 'yyyy-MM')
)
SELECT
    Order_Year,
    Order_Month,
    Year_Month,
    Total_Sales,
    SUM(Total_Sales) OVER (ORDER BY Order_Year, Order_Month) AS Cumulative_Sales, --ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    Total_Quantity,
    SUM(Total_Quantity) OVER (ORDER BY Order_Year, Order_Month)AS Cumulative_Quantity -- ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
FROM MonthlyStats
ORDER BY Order_Year, Order_Month;


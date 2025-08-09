/*
===============================================================================
Part-to-Whole Revenue Analysis by Category
===============================================================================
Purpose:
    - To calculate total revenue contributed by each product category.
    - To determine the percentage share of each category in the overall revenue.
    - Useful for identifying top-performing categories and revenue distribution.
    - Helps in strategic decision-making such as resource allocation or marketing focus.

SQL Functions Used:
    - SUM(): To aggregate total sales by category.
    - ROUND(): To format numerical results for readability.
    - Window Function SUM() OVER(): To calculate the overall revenue across all categories.
===============================================================================
*/
With Cateories_Summary As (
Select 
Category,
Round(Sum(Total_Price),2) As Total_Revenue
From sales.orders
Group By Category
) 

Select 
Category,
Total_Revenue,
Sum(Total_Revenue) Over() Overall_Revenue,
Round((Total_Revenue/Sum(Total_Revenue) Over()),2) *100 As Percentage_of_Total
From Cateories_Summary
Order By Round((Total_Revenue/Sum(Total_Revenue) Over()),2) *100 DESC

/*
===============================================================================
Performance Analysis (Year-over-Year & Average Comparison)
===============================================================================
Purpose:
    - Compare each subcategory's yearly sales to its own historical average.
    - Identify trends (Above/Below Average performance).
    - Perform Year-over-Year (YoY) comparison for growth or decline.
===============================================================================
*/

With Yearly_Subcategory_Sales As
(
Select 
	Subcategory,
	Year(Order_Date) As Order_Year,
	Round(Sum(Total_Price),2) As CY_Revenue
From sales.orders
Group BY 
		Year(Order_Date),Subcategory
)

Select 
	Order_Year,
	Subcategory,
	Avg(CY_Revenue) Over(Partition By Subcategory) Avg_Sales,
	CY_Revenue,
	CY_Revenue - Avg(CY_Revenue) Over(Partition By Subcategory) Diff_Avg,
	Case	
		When CY_Revenue - Avg(CY_Revenue) Over(Partition By Subcategory) > 0 Then 'Above_Avg'
		When CY_Revenue - Avg(CY_Revenue) Over(Partition By Subcategory) < 0 Then 'Below_Avg'
		Else 'Avg'
		End Avg_Changes,
	CY_Revenue,
	Lag(CY_Revenue) Over(Partition By Subcategory Order By Order_Year) PY_Revenue,
	CY_Revenue - Lag(CY_Revenue) Over(Partition By Subcategory Order By Order_Year) Revenue_Diff,
	Case 
		When CY_Revenue - Lag(CY_Revenue) Over(Partition By Subcategory Order By Order_Year) > 0 Then 'Positive'
		When CY_Revenue - Lag(CY_Revenue) Over(Partition By Subcategory Order By Order_Year) < 0  Then 'Negative'
		Else 'No Chanage'
		End PY_Changes
	From Yearly_Subcategory_Sales
	Order By 2,1




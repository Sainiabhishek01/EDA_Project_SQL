/*
Group restaurant customers into three segments based on their monthly visit frequency:
    - Regular Customers: Customers who visited more than 5 times in a month.
    - Occasional Customers: Customers who visited 2 to 5 times in a month.
    - One-time Customers: Customers who visited only once in a month.

This segmentation provides insights into customer engagement and dining patterns,
helping the restaurant tailor marketing campaigns, loyalty programs, and improve service for different customer groups.

The query also summarizes the total number of customers in each segment for better business understanding.
*/
Select 
	Customer_Type,
	Count(*) As Total_Customers
From 
(
Select 
	Month(Order_Date) As Order_Month,
	First_Name+' '+Last_Name As Full_Name,
	Count(*) Total_Orders,
	Case 
		When Count(*) > 5  Then 'Regular Customerss'
		When Count(*) Between 2 And 4 Then 'Occasional Customer'
		Else 'One-time'
	End Customer_Type
	From Sales.orders
	Group BY First_Name+' '+Last_Name, Month(Order_Date)
	)t 
	Group By Customer_Type

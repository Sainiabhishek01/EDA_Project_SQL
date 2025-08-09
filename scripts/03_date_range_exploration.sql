--===============================================================================
--Date Range Exploration 
--===============================================================================

---- Determine the first and last order date and the total duration in months
Select 
Min(Order_Date) As First_Order,
Max(Order_Date) As Last_Order,
Datediff(Month,Min(Order_Date),Max(Order_Date)) As Order_Range_Months
From sales.orders

---- Determine the fiirst and last order time 
---- Business Hours From 11:00 AM to 6:00 PM 
Select 
Min(Order_Time)  As Time_First_Order,
Max(Order_Time) As Time_Last_Orders
From sales.orders

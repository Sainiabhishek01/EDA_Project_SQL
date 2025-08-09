--===============================================================================
--Dimensions Exploration
--===============================================================================

---- Retrieve a list of unique Cities from which customers originate
Select Distinct 
City 
From sales.orders 
Order by 1


--Retrieve a list of unique Order_Type 
Select Distinct 
Order_Type 
From sales.orders
Order By Order_Type 


-- Retrieve a list of unique categories and subcategories
Select Distinct
Category,
Subcategory
From sales.orders 
Order By 1,2

-- Retrieve a list of unique Customer Review 
Select Distinct
Customer_Review 
From sales.orders
Order By 1


-- Retrieve a list of unique Wheather Types
Select Distinct 
Weather 
From sales.orders
Order By 1

-- Retrieve a list of Unique Payment Type 
Select Distinct 
Payment_Method 
From  sales.orders
Order By 1


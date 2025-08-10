
-- ====================================================================
-- Checking 'sales.orders'
-- ====================================================================
-- Check for NULLs  in Primary Key
-- Expectation: No Results
Select Order_Id 
From sales.orders 
Where Order_Id Is Null 


--Checking Duplicates Values in Primary Key 
-- Expectation: No Results
Select Order_Id,
Count(Order_Id) As Total_Count
From sales.orders
Group By Order_Id
Having Count(Order_Id) > 1


-->> Variable:- "First_name"
-- Check for Extra Spaces 
-- Expectation: No Results
Select 
First_Name 
From sales.orders
Where First_Name <> Trim(First_Name )

--Checking Duplicates Values 
-- Expectation: No Results
Select 
First_Name 
From sales.orders
Where First_Name Is Null 

-->> Variable:- "Last_Name"
-- Check for Extra Spaces 
-- Expectation: No Results
Select 
Last_Name
From sales.orders
Where Last_Name <> Trim(Last_Name)

--Checking Duplicates Values 
-- Expectation: No Results
Select 
Last_Name
From sales.orders
Where Last_Name Is Null 

-->> Variable:- "City "
-- Check for Extra Spaces 
-- Expectation: No Results
Select 
City 
From sales.orders
Where City <> Trim(City)

--Checking Duplicates Values 
-- Expectation: No Results
Select 
City
From sales.orders
Where City Is Null 


-->> Variable:- "Order_Date"
-- Check for Extra Spaces 
-- Expectation: No Results
Select 
Order_Date
From sales.orders
Where Order_Date <> Trim(Order_Date)

--Checking Unexpected Dates  Order_Date > Today_Day
--Checking Invalid Dates
Select
Order_Date
From sales.orders
Where Order_Date > Getdate()
Or Len(Order_Date) <> 10

-- Invalid times (e.g., wrong format can't be detected directly unless stored as string)
-- Optional: Check if times fall outside business hours (e.g., 08:00 to 22:00)
SELECT *
FROM sales.orders
WHERE 
  CAST(Order_Time AS TIME) < '08:00:00'
  OR CAST(Order_Time AS TIME) > '22:00:00';


--- Check NULLs in all columns
SELECT 
  COUNT(*) AS total_rows,
  COUNT(Order_Date) AS non_null_order_date,
  COUNT(Order_Time) AS non_null_order_time,
  COUNT(Order_Type) AS non_null_order_type,
  COUNT(Category) AS non_null_category,
  COUNT(Subcategory) AS non_null_subcategory,
  COUNT(Price) AS non_null_price,
  COUNT(Quantity) AS non_null_quantity,
  COUNT(Total_Price) AS non_null_total_price,
  COUNT(Customer_Review) AS non_null_review,
  COUNT(Weather) AS non_null_weather,
  COUNT(Payment_Method) AS non_null_payment
FROM sales.orders;


-- Handling Extra Spaces have extra spaces
SELECT *
FROM sales.orders
WHERE 
  Order_Type <> TRIM(Order_Type)
  OR Category <> TRIM(Category)
  OR Subcategory <> TRIM(Subcategory)
  OR Weather <> TRIM(Weather)
  OR Payment_Method <> TRIM(Payment_Method);

  -- List distinct Order Types
SELECT DISTINCT Order_Type FROM sales.orders;

-- List distinct Categories and Subcategories
SELECT DISTINCT Category, Subcategory FROM sales.orders;

-- List distinct Payment Methods
SELECT DISTINCT Payment_Method FROM sales.orders;



-- Negative or zero price
SELECT * 
FROM sales.orders
WHERE Price <= 0;

-- Negative or zero quantity
SELECT * 
FROM sales.orders
WHERE Quantity <= 0;

-- Check for Total_Price mismatch
SELECT * 
FROM sales.orders
WHERE ROUND(Total_Price, 2) <> ROUND(Price * Quantity, 2);

-- Extremely high prices or quantities
SELECT * 
FROM sales.orders
WHERE Price > 10000 OR Quantity > 1000;



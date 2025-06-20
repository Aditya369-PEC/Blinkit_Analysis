-- Creation of Database 
CREATE DATABASE blinkitdb;
-- Import Table in the database
-- Select the whole date for preview for data analysis 
SELECT * FROM blinkit_data;
SELECT COUNT(*) FROM blinkit_data;

-- UPDATE THE DATA FOR PROPER ANALYSIS 

-- Data Cleaning and Preparation 
SET Item_Fat_Content = CASE
    WHEN Item_Fat_Content IN ('LF', 'low fat') THEN 'Low Fat'
    WHEN Item_Fat_Content = 'reg' THEN 'Regular'
    ELSE Item_Fat_Content
END;
-- CHECK UPDATE IS DONE IN RIGHT FORMAT or not .
SELECT DISTINCT(Item_Fat_Content) From blinkit_data; 

SELECT SUM(Sales) as Total_Sales FROM blinkit_data;

SELECT CAST(SUM(Sales)/1000000 AS DECIMAL(10,2)) AS Total_Sales_Millions
FROM blinkit_data  
WHERE Outlet_Establishment_Year = 2022;

SELECT CAST(AVG(Sales) AS DECIMAL(10,0)) AS Avg_Sales FROM blinkit_data;

SELECT COUNT(*) AS No_Of_Items FROM blinkit_data ;

SELECT CAST(AVG(Rating) AS DECIMAL(10,2)) AS AVG_Rating FROM blinkit_data;

-- Total Sales by Fat Content 
SELECT Item_Fat_Content, SUM(Sales) AS TOTAL_Sales FROM blinkit_data GROUP BY Item_Fat_Content ORDER BY TOTAL_Sales DESC ;
SELECT Item_Fat_Content,
				CAST(SUM(Sales) AS DECIMAL(10,2)) AS TOTAL_Sales,
                CAST(AVG(Sales) AS DECIMAL(10,1)) AS AVG_Sales,
                COUNT(*) AS No_Of_Items,
                CAST(AVG(RATING) AS DECIMAL(10,2)) AS AVG_Rating
FROM blinkit_data  
GROUP BY Item_Fat_Content 
ORDER BY TOTAL_Sales DESC ;

-- Total Sales By Item Type 
SELECT Item_Type,
				CAST(SUM(Sales) AS DECIMAL(10,2)) AS TOTAL_Sales,
                CAST(AVG(Sales) AS DECIMAL(10,1)) AS AVG_Sales,
                COUNT(*) AS No_Of_Items,
                CAST(AVG(RATING) AS DECIMAL(10,2)) AS AVG_Rating
FROM blinkit_data  
GROUP BY Item_Type
ORDER BY TOTAL_Sales DESC 
LIMIT 5 ;

-- Fat Content by Outlet for Total Sales 
SELECT Outlet_Location_Type,Item_Type,
				CAST(SUM(Sales) AS DECIMAL(10,2)) AS TOTAL_Sales,
                CAST(AVG(Sales) AS DECIMAL(10,1)) AS AVG_Sales,
                COUNT(*) AS No_Of_Items,
                CAST(AVG(RATING) AS DECIMAL(10,2)) AS AVG_Rating
FROM blinkit_data  
GROUP BY Outlet_Location_Type,Item_Type
ORDER BY TOTAL_Sales DESC ;

-- Total Sales by Outlet Establishment 
SELECT 
    Outlet_Location_Type,
    IFNULL(SUM(IF(Item_Fat_Content = 'Low Fat', Sales, 0)), 0) AS Low_Fat,
    IFNULL(SUM(IF(Item_Fat_Content = 'Regular', Sales, 0)), 0) AS Regular
FROM blinkit_data
GROUP BY Outlet_Location_Type
ORDER BY Outlet_Location_Type;

-- Percentage of sales by outlet Size
SELECT 
    Outlet_Size,
    CAST(SUM(Sales) AS DECIMAL(10,2)) AS TOTAL_Sales,
    CAST((SUM(Sales) * 100.0 / SUM(SUM(Sales)) OVER()) AS DECIMAL(10,2)) AS Sales_Percentage
FROM blinkit_data
GROUP BY Outlet_Size
ORDER BY TOTAL_Sales DESC;

-- Sales By outlet_Location
SELECT Outlet_Location_Type,
				CAST(SUM(Sales) AS DECIMAL(10,2)) AS TOTAL_Sales,
                CAST(AVG(Sales) AS DECIMAL(10,1)) AS AVG_Sales,
                CAST((SUM(Sales) * 100.0 / SUM(SUM(Sales)) OVER()) AS DECIMAL(10,2)) AS Sales_Percentage,
                COUNT(*) AS No_Of_Items,
                CAST(AVG(RATING) AS DECIMAL(10,2)) AS AVG_Rating
FROM blinkit_data  
WHERE Outlet_Establishment_Year=2022
GROUP BY Outlet_Location_Type
ORDER BY TOTAL_Sales DESC 
LIMIT 5 ;
 
 -- All Metrics by Outlet type
 SELECT Outlet_Type,
				CAST(SUM(Sales) AS DECIMAL(10,2)) AS TOTAL_Sales,
                CAST(AVG(Sales) AS DECIMAL(10,1)) AS AVG_Sales,
                CAST((SUM(Sales) * 100.0 / SUM(SUM(Sales)) OVER()) AS DECIMAL(10,2)) AS Sales_Percentage,
                COUNT(*) AS No_Of_Items,
                CAST(AVG(RATING) AS DECIMAL(10,2)) AS AVG_Rating
FROM blinkit_data  
GROUP BY Outlet_Type
ORDER BY TOTAL_Sales DESC; 




 
 





         


                

                

 






















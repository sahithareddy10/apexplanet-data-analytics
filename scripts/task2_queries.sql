-- ==========================================
-- TASK 2 : SQL FOR DATA EXTRACTION
-- ApexPlanet Data Analytics Internship
-- ==========================================

-- 1. View First 10 Records
SELECT * FROM superstore LIMIT 10;

-- 2. Count Total Records
SELECT COUNT(*) AS TotalRows
FROM superstore;

-- 3. View Category, Sales, Profit
SELECT Category, Sales, Profit
FROM superstore;

-- 4. Sales Greater Than 500
SELECT *
FROM superstore
WHERE Sales > 500;

-- 5. Sort by Highest Sales
SELECT *
FROM superstore
ORDER BY Sales DESC;

-- 6. Sales by Category
SELECT Category,
       SUM(Sales) AS TotalSales
FROM superstore
GROUP BY Category;

-- 7. Profit by Category
SELECT Category,
       SUM(Profit) AS TotalProfit
FROM superstore
GROUP BY Category;

-- 8. Sales by Region
SELECT Region,
       SUM(Sales) AS TotalSales
FROM superstore
GROUP BY Region;

-- 9. Profit by Region
SELECT Region,
       SUM(Profit) AS TotalProfit
FROM superstore
GROUP BY Region;

-- 10. Orders by Segment
SELECT Segment,
       COUNT(*) AS TotalOrders
FROM superstore
GROUP BY Segment;

-- 11. Average Sales by Category
SELECT Category,
       AVG(Sales) AS AverageSales
FROM superstore
GROUP BY Category;

-- 12. Average Profit by Region
SELECT Region,
       AVG(Profit) AS AverageProfit
FROM superstore
GROUP BY Region;

-- 13. Categories With Sales Above 100000
SELECT Category,
       SUM(Sales) AS TotalSales
FROM superstore
GROUP BY Category
HAVING SUM(Sales) > 100000;

-- 14. Regions With Profit Above 50000
SELECT Region,
       SUM(Profit) AS TotalProfit
FROM superstore
GROUP BY Region
HAVING SUM(Profit) > 50000;

-- 15. Top 5 Products By Sales
SELECT `Product Name`,
       SUM(Sales) AS TotalSales
FROM superstore
GROUP BY `Product Name`
ORDER BY TotalSales DESC
LIMIT 5;

-- 16. Top 5 Customers By Sales
SELECT `Customer Name`,
       SUM(Sales) AS TotalSales
FROM superstore
GROUP BY `Customer Name`
ORDER BY TotalSales DESC
LIMIT 5;

-- 17. Top 10 Cities By Sales
SELECT City,
       SUM(Sales) AS TotalSales
FROM superstore
GROUP BY City
ORDER BY TotalSales DESC
LIMIT 10;

-- 18. Sales By Ship Mode
SELECT `Ship Mode`,
       SUM(Sales) AS TotalSales
FROM superstore
GROUP BY `Ship Mode`;

-- 19. Most Profitable Products
SELECT `Product Name`,
       SUM(Profit) AS TotalProfit
FROM superstore
GROUP BY `Product Name`
ORDER BY TotalProfit DESC
LIMIT 10;

-- 20. Average Discount By Category
SELECT Category,
       AVG(Discount) AS AverageDiscount
FROM superstore
GROUP BY Category;

-- 21. Above Average Sales (Subquery)
SELECT *
FROM superstore
WHERE Sales >
(
    SELECT AVG(Sales)
    FROM superstore
);

-- 22. CTE Example
WITH CategorySales AS
(
    SELECT Category,
           SUM(Sales) AS TotalSales
    FROM superstore
    GROUP BY Category
)
SELECT *
FROM CategorySales;

-- 23. Best Performing Region
SELECT Region,
       SUM(Profit) AS TotalProfit
FROM superstore
GROUP BY Region
ORDER BY TotalProfit DESC
LIMIT 1;

-- 24. Best Performing Category
SELECT Category,
       SUM(Sales) AS TotalSales
FROM superstore
GROUP BY Category
ORDER BY TotalSales DESC
LIMIT 1;

-- 25. Customer Segment Analysis
SELECT Segment,
       SUM(Sales) AS TotalSales,
       SUM(Profit) AS TotalProfit
FROM superstore
GROUP BY Segment;
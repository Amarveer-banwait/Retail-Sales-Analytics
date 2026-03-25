#️ SQL queries
1. Basic Business Overview Queries : Total Sales, Profit, Quantity
SELECT 
SUM(Sales) AS Total_Sales,
SUM(Profit) AS Total_Profit,
SUM(Quantity) AS Total_Quantity
FROM superstore;

Purpose: overall business performance.

2. Sales by Region
SELECT Region, 
SUM(Sales) AS Total_Sales
FROM superstore
GROUP BY Region
ORDER BY Total_Sales DESC;

Business question : Which region generates the most revenue?

3. Profit by Category
SELECT Category,
SUM(Profit) AS Total_Profit
FROM superstore
GROUP BY Category
ORDER BY Total_Profit DESC;

Business question : Which product category is most profitable?

4. Top 10 Products by Sales
SELECT Sub_Category,
SUM(Sales) AS Total_Sales
FROM superstore
GROUP BY Sub_Category
ORDER BY Total_Sales DESC
LIMIT 10;

Insight: top performing products.

️5. Loss Making Products
SELECT Sub_Category,
SUM(Profit) AS Total_Profit
FROM superstore
GROUP BY Sub_Category
HAVING SUM(Profit) < 0;

Business insight : which products losing money.

️6. Sales by Segment
SELECT Segment,
SUM(Sales) AS Total_Sales
FROM superstore
GROUP BY Segment
ORDER BY Total_Sales DESC;

Segments: Consumer, Corporate, Home Office
️
7. Average Discount by Category
SELECT Category,
AVG(Discount) AS Avg_Discount
FROM superstore
GROUP BY Category;

Purpose: understand discount strategy.

️8. Top Cities by Sales
SELECT City,
SUM(Sales) AS Total_Sales
FROM superstore
GROUP BY City
ORDER BY Total_Sales DESC
LIMIT 10;

Business question : Which cities drive revenue?

️9. Profit Margin by Category
SELECT Category,
SUM(Profit)/SUM(Sales) AS Profit_Margin
FROM superstore
GROUP BY Category;

Important business metric.

10. Orders with High Discount but Low Profit
SELECT * FROM superstore
WHERE Discount > 0.3 AND Profit < 0;

Insight:discount strategy harming profits.

11.Window Function : Rank Regions by Sales
SELECT Region,
SUM(Sales) AS Total_Sales,
RANK() OVER (ORDER BY SUM(Sales) DESC) AS Sales_Rank
FROM superstore
GROUP BY Region;

/* -.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.

* File Name : BAKERY-lab5.sql

* Purpose :

* Creation Date : 05-11-2017

* Last Modified : Sun 05 Nov 2017 01:55:43 PM STD

* Created By :  Jordan Castillo

* Email : jtcastil@calpoly.edu
_._._._._._._._._._._._._._._._._._._._._.*/
use bakery
-- Q1)
SELECT cm.FirstName, cm.LastName
FROM items it, goods gd, receipts rc, customers cm
WHERE (gd.GId = it.Item)
AND (it.Receipt = rc.RNumber)
AND (rc.Customer = cm.CId)
AND (gd.Food = "Croissant")
GROUP BY cm.LastName
HAVING COUNT(it.Item) >= 2;

-- Q2)
SELECT DISTINCT rc.SaleDate
FROM items it, goods gd, receipts rc, customers cm
WHERE (gd.GId = it.Item)
AND (it.Receipt = rc.RNumber)
AND (rc.Customer = cm.CId)
AND ((cm.LastName = "DOMKOWSKI" AND cm.FirstName = "ALMETA") OR (gd.Flavor = "Gongolais"))
ORDER BY rc.SaleDate;

-- Q3) Not too tricky, had to look up the "ROUND()" function to understand, but this enables
--		 me to round to the hundredth place
SELECT ROUND(SUM(gd.PRICE * it.Ordinal), 2) AS Dollars
FROM items it, goods gd, receipts rc, customers cm
WHERE (gd.GId = it.Item)
AND (it.Receipt = rc.RNumber)
AND (rc.Customer = cm.CId)
AND (cm.LastName = "STENZ" AND cm.FirstName = "NATACHA");

-- Q4)
SELECT ROUND(SUM(gd.PRICE * it.Ordinal), 2) AS totalRevenue
FROM items it, goods gd, receipts rc
WHERE (gd.GId = it.Item)
AND (it.Receipt = rc.RNumber)
AND (MONTHNAME(rc.SaleDate) = "October")
AND (YEAR(rc.SaleDate) = 2007)
AND (gd.Flavor = "Chocolate");





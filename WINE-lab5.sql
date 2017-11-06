/* -.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.

* File Name : WINE-lab5.sql

* Purpose :

* Creation Date : 05-11-2017

* Last Modified : Mon 06 Nov 2017 12:38:50 AM STD

* Created By :  Jordan Castillo

* Email : jtcastil@calpoly.edu
_._._._._._._._._._._._._._._._._._._._._.*/
use wine
-- Q1
SELECT gp.Grape, wn.Winery, wn.Name, wn.Score, (12 * wn.Price * wn.Cases) AS Revenue
FROM wine wn
	JOIN grapes gp
		ON (gp.Grape = wn.Grape)
	JOIN wine wn2
		ON (wn2.Winery = "Rosenblum")
		AND (wn2.Grape = "Zinfandel")
		AND (wn2.Appellation = "Paso Robles")
		AND (wn2.Name = "Appelation Series")
	JOIN appellations ap
		ON (ap.Appellation = wn.Appellation)
WHERE (ap.County = "Napa")
AND (wn.Vintage = 2006)
AND ((wn.Price * wn.Cases) > (wn2.Price * wn2.Cases));

-- Q2
SELECT ROUND(AVG(Score), 0) AS avgScore
FROM wine
WHERE (Appellation = "Paso Robles")
	AND (Grape = "Zinfandel");

-- Q3
SELECT SUM(12 * wn.Price * wn.Cases)
FROM wine wn, grapes gp
WHERE (wn.Grape = gp.Grape)
AND (wn.Winery = "Kosta Browne")
AND (gp.Color = "Red");

-- Q4 
SELECT ROUND(AVG(wn.Cases), 2) AS avgWineCases
FROM wine wn, appellations ap
WHERE (wn.Appellation = ap.Appellation)
AND (wn.Grape = "Pinot Noir")
AND (ap.Area = "Central Coast");

-- Q5
SELECT COUNT(wn.Name) AS numRedWines
FROM wine wn
	JOIN grapes gp
		ON (wn.Grape = gp.Grape)
	JOIN wine wn2
		ON (wn2.Appellation = "Russian River Valley")
		AND (wn2.Score = 98)
WHERE (gp.Color = "Red")
AND (wn.Appellation = "Russian River Valley")
AND (wn.Vintage = wn2.Vintage);


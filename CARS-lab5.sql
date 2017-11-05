/* -.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.

* File Name : CARS-lab5.sql

* Purpose :

* Creation Date : 05-11-2017

* Last Modified : Sun 05 Nov 2017 03:38:56 PM STD

* Created By :  Jordan Castillo

* Email : jtcastil@calpoly.edu
_._._._._._._._._._._._._._._._._._._._._.*/
use cars
-- Q1)
SELECT mk1.Make, cd1.Year, cm.FullName, cd1.MPG
FROM carmakers cm
	JOIN models md
		ON (cm.Id = md.Maker)
	JOIN makes mk1
		ON (md.Model = mk1.Model)
	JOIN cardata cd1
		ON (mk1.Id = cd1.Id)
	JOIN makes mk2
		 ON (mk2.Make = "honda civic")
	JOIN cardata cd2
		ON (mk2.Id = cd2.Id)
		AND (cd2.Year = 1982)
WHERE (cd1.MPG > cd2.MPG)
AND (cd1.Year > 1980)
ORDER BY cd1.MPG DESC;
		
-- Q2)
SELECT AVG(cd.Horsepower), MAX(Horsepower), MIN(Horsepower), cd.Year
FROM cardata cd, makes mk
WHERE (cd.Id = mk.Id)
	AND (mk.Model = "renault")
	AND (cd.Year >= 1971)
	AND (cd.Year <= 1976)
GROUP BY cd.Year;
-- Q3)
SELECT COUNT(mk1.Make)
FROM carmakers cm
	JOIN models md
		ON (cm.Id = md.Maker)
	JOIN makes mk1
		ON (md.Model = mk1.Model)
	JOIN cardata cd1
		ON (mk1.Id = cd1.Id)
	JOIN makes mk2
		 ON (mk2.Make = "volvo 145e (sw)")
	JOIN cardata cd2
		ON (mk2.Id = cd2.Id)
		AND (cd2.Year = 1972)
WHERE (cd1.Accelerate > cd2.Accelerate)
AND (cd1.Year = 1971);
	

-- Q4)
SELECT COUNT(DISTINCT cm.FullName)
FROM carmakers cm, models md, makes mk, cardata cd
WHERE (cm.Id = md.Maker)
	AND (mk.Model = md.Model)
	AND (mk.Id = cd.Id)
	AND (cd.Weight > 4000);


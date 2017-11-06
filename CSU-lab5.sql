/* -.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.

* File Name : CSU-lab5.sql

* Purpose :

* Creation Date : 05-11-2017

* Last Modified : Sun 05 Nov 2017 05:46:41 PM STD

* Created By :  Jordan Castillo

* Email : jtcastil@calpoly.edu
_._._._._._._._._._._._._._._._._._._._._.*/
use csu
-- Q1
SELECT SUM(dg.degrees)
FROM campuses cp, degrees dg
WHERE (cp.Id = dg.CampusId)
AND (cp.Campus = "California Polytechnic State University-San Luis Obispo")
AND (dg.year >= 1995)
AND (dg.year <= 2000);

-- Q2
SELECT MAX(fee), MIN(fee), ROUND(AVG(fee), 0)
FROM fees
WHERE Year = 2005;

-- Q3
SELECT ROUND(AVG(er.FTE/fc.FTE), 0)
FROM faculty fc, enrollments er
WHERE (fc.CampusID = er.CampusID)
	AND (fc.Year = er.Year)
	AND (fc.Year = 2004)
	AND (er.FTE + fc.FTE > 15000);

-- Q4
SELECT DISTINCT er.Year
FROM campuses cp, enrollments er, degrees dg
WHERE (dg.CampusId = er.CampusId)
AND (cp.Id = er.CampusId)
AND (dg.year = er.Year)
AND (cp.Campus = "California Polytechnic State University-San Luis Obispo")
AND (er.Enrolled > 17000 OR dg.degrees > 3500);



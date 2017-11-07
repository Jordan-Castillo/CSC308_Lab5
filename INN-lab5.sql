/* -.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.

* File Name : INN-lab5.sql

* Purpose :

* Creation Date : 05-11-2017

* Last Modified : Mon 06 Nov 2017 06:47:25 PM STD

* Created By :  Jordan Castillo

* Email : jtcastil@calpoly.edu
_._._._._._._._._._._._._._._._._._._._._.*/
use inn
-- Q1
SELECT DISTINCT rm.RoomName, rm.RoomCode
FROM reservations rs1
	JOIN rooms rm
		ON (rm.RoomCode = rs1.Room)
	JOIN reservations rs2
		ON (rs2.Room = rs1.Room)
	JOIN reservations rs3
		ON (rs3.Room = rs1.Room)
WHERE (DAYOFYEAR(rs1.CheckIn) <= DAYOFYEAR("2010-05-15") AND DAYOFYEAR(rs1.CheckOut) >= DAYOFYEAR("2010-05-15"))
AND (DAYOFYEAR(rs2.CheckIn) <= DAYOFYEAR("2010-08-18") AND DAYOFYEAR(rs2.CheckOut) >= DAYOFYEAR("2010-08-18"))
AND (DAYOFYEAR(rs3.CheckIn) <= DAYOFYEAR("2010-12-12") AND DAYOFYEAR(rs3.CheckOut) >= DAYOFYEAR("2010-12-12"));

-- Q2
SELECT DISTINCT rs1.FirstName, rs1.LastName
FROM rooms rm
	JOIN reservations rs1
		ON (rs1.Room = rm.RoomCode)
		AND (rs1.FirstName != "HERBERT" AND rs1.LastName != "FRYDAY")
	JOIN reservations rs2
		ON (rs2.FirstName = "HERBERT" AND rs2.LastName = "FRYDAY")
WHERE (rs1.CheckIn BETWEEN rs2.CheckIn AND rs2.CheckOut)
	OR (rs1.CheckOut BETWEEN rs2.CheckIn AND rs2.CheckOut)
	OR (rs2.CheckIn BETWEEN rs1.CheckIn AND rs1.CheckOut)
 	OR (rs2.CheckOut BETWEEN rs1.CheckIn AND rs1.CheckOut)
ORDER BY rs1.LastName;

-- Q3
SELECT COUNT(CODE)
FROM reservations 
WHERE (MONTHNAME(CheckIn) = "August" AND MONTHNAME(CheckOut) = "August")
AND (Adults = 2)
AND (Kids = 2);

-- Q4
SELECT AVG(DATEDIFF(rs.CheckOut, rs.CheckIn))
FROM reservations rs, rooms rm
WHERE (rs.Room = rm.RoomCode)
AND (rm.RoomName = "Interim but salutary")
AND (rs.CheckIn BETWEEN "2010-05-01" AND "2010-08-31")
AND (rs.CheckOut BETWEEN "2010-05-01" AND "2010-08-30");

-- Q5
SELECT COUNT(DISTINCT DATEDIFF(rs.CheckOut, rs.CheckIn)) AS numDifferentDays
FROM reservations rs, rooms rm
WHERE (rs.Room = rm.RoomCode)
AND (rm.RoomName = "Interim but salutary")
AND (MONTHNAME(rs.CheckIn) = "July")
AND (MONTHNAME(rs.CheckOut) = "July")
AND (YEAR(rs.CheckOut) = 2010);

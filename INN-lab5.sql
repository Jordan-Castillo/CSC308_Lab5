/* -.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.

* File Name : INN-lab5.sql

* Purpose :

* Creation Date : 05-11-2017

* Last Modified : Sun 05 Nov 2017 07:20:30 PM STD

* Created By :  Jordan Castillo

* Email : jtcastil@calpoly.edu
_._._._._._._._._._._._._._._._._._._._._.*/
use inn
-- Q1
SELECT rm.RoomName, rm.RoomCode, DATEDIFF(rs.CheckOut, rs.CheckIn) AS daysBooked
FROM rooms rm, reservations rs
WHERE (rs.Room = rm.RoomCode)
AND ((DAYOFYEAR(rs.CheckIn) <= DAYOFYEAR("2010-05-15") AND DAYOFYEAR(rs.CheckOut) >= DAYOFYEAR("2010-0
5-15"))
OR (DAYOFYEAR(rs.CheckIn) <= DAYOFYEAR("2010-08-18") AND DAYOFYEAR(rs.CheckOut) >= DAYOFYEAR("2010-08-1
8"))
OR (DAYOFYEAR(rs.CheckIn) <= DAYOFYEAR("2010-12-12") AND DAYOFYEAR(rs.CheckOut) >= DAYOFYEAR("2010-12-1
2")))
GROUP BY rs.Room
HAVING (DAYOFYEAR(rs.CheckIn) <= DAYOFYEAR("2010-05-15") AND DAYOFYEAR(rs.CheckOut) >= DAYOFYEAR("2010-0
5-15"))
AND (DAYOFYEAR(rs.CheckIn) <= DAYOFYEAR("2010-08-18") AND DAYOFYEAR(rs.CheckOut) >= DAYOFYEAR("2010-08-1
8"))
AND (DAYOFYEAR(rs.CheckIn) <= DAYOFYEAR("2010-12-12") AND DAYOFYEAR(rs.CheckOut) >= DAYOFYEAR("2010-12-1
2"))
AND (COUNT(YEAR(rs.CheckOut) = 2010) >= 1);

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
SELECT DISTINCT DATEDIFF(rs.CheckOut, rs.CheckIn)
FROM reservations rs, rooms rm
WHERE (rs.Room = rm.RoomCode)
AND (rm.RoomName = "Interim but salutary")
AND (MONTHNAME(rs.CheckIn) = "July")
AND (MONTHNAME(rs.CheckOut) = "July")
AND (YEAR(rs.CheckOut) = 2010);

/* -.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.

* File Name : KATZENJAMMER-lab5.sql

* Purpose :

* Creation Date : 06-11-2017

* Last Modified : Mon 06 Nov 2017 03:04:08 PM STD

* Created By :  Jordan Castillo

* Email : jtcastil@calpoly.edu
_._._._._._._._._._._._._._._._._._._._._.*/
use katzenjammer
-- Q1
SELECT COUNT(it.Song)
FROM Band bd, Instruments it
WHERE (bd.Id = it.Bandmate)
AND (it.Instrument = "bass balalaika")
AND (bd.FirsName = "Turid");

-- Q2
SELECT COUNT(pf.Bandmate)
FROM Band bd, Performance pf
WHERE (bd.Id = pf.Bandmate)
AND ()

SELECT COUNT(pf.Bandmate)
FROM Performance pf
	JOIN Band bd
		ON (bd.Id = pf.Bandmate)
	JOIN Band bd2
		ON (bd2.FirsName = "Marianne")
	JOIN Instruments it
		ON (bd2.Id = it.Bandmate)
		AND (it.Instrument = "drums")
WHERE (bd.FirsName = "Solveig")
AND (pf.StagePosition = "center")
AND (pf.Song = it.Song);
-- Q3
SELECT COUNT(DISTINCT vc.Song)
FROM Vocals vc
	JOIN Band bd
		ON (vc.Bandmate = bd.Id)
	JOIN Band bd2
		ON (bd2.FirsName = "Marianne")
	JOIN Performance pf
		ON (pf.Bandmate = bd2.Id)
		AND (pf.StagePosition != "back")
WHERE (vc.VocalType = "lead")
AND (vc.Song = pf.Song)
AND (bd.FirsName = "Solveig");

-- Q4
SELECT COUNT(DISTINCT it.Instrument)
FROM Band bd, Instruments it
WHERE (bd.FirsName = "Anne-Marit")
AND (bd.Id = it.Bandmate);

-- Q5
--SELECT it.Instrument
--FROM Band bd, Instruments it
--WHERE 

-- Q6


-- Q7


-- Q8



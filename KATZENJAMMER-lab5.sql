/* -.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.

* File Name : KATZENJAMMER-lab5.sql

* Purpose :

* Creation Date : 06-11-2017

* Last Modified : Mon 06 Nov 2017 07:34:38 PM STD

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
SELECT COUNT(vc.Song)
FROM Vocals vc
   JOIN Band bd
      ON (vc.Bandmate = bd.Id)
   JOIN Band bd2
      ON (bd2.FirsName = "Marianne")
   JOIN Performance pf
      ON (pf.Bandmate = bd2.Id
      AND pf.StagePosition = "left"
				OR pf.StagePosition = "center"
				OR pf.StagePosition = "right")
WHERE (vc.VocalType = "lead")
AND (vc.Song = pf.Song)
AND (bd.FirsName = "Solveig");


-- Q4
SELECT COUNT(DISTINCT it.Instrument)
FROM Band bd, Instruments it
WHERE (bd.FirsName = "Anne-Marit")
AND (bd.Id = it.Bandmate);

-- Q5
SELECT DISTINCT it.Instrument
FROM Instruments it
	JOIN Instruments it2
		ON (it.Instrument = it2.Instrument)
	JOIN Band bd1 
		ON (bd1.FirsName = "Marianne")
	JOIN Band bd2
		ON (bd2.FirsName = "Turid")
WHERE (bd1.Id = it.Bandmate)
	AND (bd2.Id = it2.Bandmate);

-- Q6
SELECT COUNT(DISTINCT pf.Song)
FROM Performance pf
	JOIN Instruments it
		ON (pf.Song = it.Song)
WHERE (it.Instrument = "guitar");

-- Q7
SELECT COUNT(DISTINCT it.Song)
FROM Instruments it
	JOIN Instruments it2
		ON (it.Song = it2.Song)
		AND (it.Bandmate != it2.Bandmate)
WHERE (it.Instrument = it2.Instrument);

-- Q8
SELECT COUNT(DISTINCT it.Song)
FROM Vocals vc
	JOIN Instruments it
		ON (vc.Song = it.Song)
WHERE (vc.VocalType = "lead")
	AND (it.Instrument = "bass balalaika");



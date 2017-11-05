/* -.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.

* File Name : STUDENTS-lab5.sql

* Purpose :

* Creation Date : 05-11-2017

* Last Modified : Sun 05 Nov 2017 11:35:21 AM STD

* Created By :  Jordan Castillo

* Email : jtcastil@calpoly.edu
_._._._._._._._._._._._._._._._._._._._._.*/
use students
-- Q1) Notes: This query took me longer than anticipated because I needed to remove reverse duplicates
--  the very last line of the 'HAVING' statement removes duplicates by not allowing a LastName 
--	 that is present in list 1 to also be present in list 2. LastName used because no ID avail.
SELECT DISTINCT l1.FirstName, l1.LastName, l1.grade, l2.FirstName, l2.LastName, l2.grade
FROM list as l1, list as l2
HAVING (l1.FirstName = l2.FirstName) AND (l1.LastName != l2.LastName) AND (l1.LastName < l2.LastName);
-- Q2)
SELECT ls.FirstName, ls.LastName
FROM list ls, teachers tc
WHERE (ls.classroom = tc.classroom)
AND (tc.First != "OTHA" AND tc.Last != "MOYER")
AND (ls.grade = 1)
ORDER BY ls.LastName;
-- Q3)
SELECT COUNT(LastName) AS Students, grade
FROM list
WHERE (grade = 3 OR grade = 4)
GROUP BY grade;
-- Q4)
SELECT COUNT(ls.LastName) AS StudentsTaughtByLoria
FROM list ls, teachers tc
WHERE (ls.classroom = tc.classroom)
AND (tc.First = "LORIA" AND tc.Last = "ONDERSMA");

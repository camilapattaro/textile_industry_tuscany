
--1.My first step was checking for null values, filtering the columns one by one, on my SQL editor, DBeaver.
----No null values were found.

--2.Finding duplicate values.

SELECT 
  "Ragione sociale",
  COUNT (*)
FROM 
  tst
GROUP BY
  "Ragione sociale" 
HAVING 
  COUNT (*) > 1

----Two rows under the name INTERFIL - S.R.L. were found.
----However, after checking those two rows, I could see they have different values, so I decide to keep them both in my analysis.

--3.Checking if there is any negative number for Investment values.

SELECT 
 *
FROM 
  tst
WHERE 
  "Investimenti
2013" < 1
OR 
  "Investimenti
2014" < 1
OR 
  "Investimenti
2015" < 1

----No negative numbers where found.


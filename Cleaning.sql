
--1.My first step was checking for null values, filtering the columns one by one, on my SQL editor, DBeaver.
--No null values were found.

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

--Two rows with the name INTERFIL - S.R.L. were identified.
--However, upon reviewing these rows, I observed that they contain different values; therefore, I decided to retain both for my analysis."

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

--No negative numbers where found.
--The data is consistent and in the correct format.


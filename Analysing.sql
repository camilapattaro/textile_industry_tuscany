--Given that the table includes 1,012 companies, I have decided to conduct an aggregate analysis by year.
--The annual average across all companies provides an overview and enables an understanding of the sector's or group's average trend over the three-year period.
--But first, I created new columns with individual ratios and necessary indicators for each company. 
--The columns are of INTEGER data type, so I needed to CAST them to FLOAT in order to perform the division.

--1.My first step was to examine the average Debt Ratio, which indicates the proportion of financing through debt relative to total investments.

ALTER TABLE tst ADD "Debt Ratio 2013" DECIMAL (9,2),
                ADD "Debt Ratio 2014" DECIMAL (9,2),
                ADD "Debt Ratio 2015" DECIMAL (9,2)

UPDATE
  tst  
  SET "Debt Ratio 2013" = (CAST("Debito
  2013" AS FLOAT)/ CAST("Investimenti
  2013" AS FLOAT)),
      "Debt Ratio 2014" = (CAST("Debito
  2014" AS FLOAT)/ CAST("Investimenti
  2014" AS FLOAT)),
      "Debt Ratio 2015" = (CAST("Debito
  2015" AS FLOAT)/ CAST("Investimenti
  2015" AS FLOAT))
FROM 
  tst

SELECT 
  AVG("Debt Ratio 2013"),
  AVG("Debt Ratio 2014"),
  AVG("Debt Ratio 2015")
FROM
  tst t

--Debt Ratio 2013 _ 0.67
--Debt Ratio 2014 _ 0.69
--Debt Ratio 2015 _ 0.82
--A Debt Ratio greater than 1.0 indicates that the company has more debt than investments, whereas a Debt Ratio below 1.0 indicates that the company has more investments than debt.

--2.The next step was to examine the Debt-to-Equity Ratio, which measures the level of debt relative to equity and offers insight into the extent to which the company relies on debt to finance its operations.
  ALTER TABLE 
  tst 
  ADD "Debt-to-Equity Ratio 2013" DECIMAL (9,2),
  ADD "Debt-to-Equity Ratio 2014" DECIMAL (9,2),
  ADD "Debt-to-Equity Ratio 2015" DECIMAL (9,2)

  UPDATE
  tst 
  SET "Debt-to-Equity Ratio 2013" = (CAST("Debito
  2013" AS FLOAT)/ CAST("Netto
  2013" AS FLOAT)),
      "Debt-to-Equity Ratio 2014" = (CAST("Debito
  2014" AS FLOAT)/ CAST("Netto
  2014" AS FLOAT)),
      "Debt-to-Equity Ratio 2015" = (CAST("Debito
  2015" AS FLOAT)/ CAST("Netto
  2015" AS FLOAT))

  SELECT
  AVG("Debt-to-Equity Ratio 2013"),
  AVG("Debt-to-Equity Ratio 2014"),
  AVG("Debt-to-Equity Ratio 2015")
FROM
  tst
--Average Debt-to-Equity Ratio 2013 _ 5.47
--Average Debt-to-Equity Ratio 2014 _ 15.07
--Average Debt-to-Equity Ratio 2015 _ 4.62
--In general, the higher the Debt-to-Equity Ratio, the greater the proportion of a company's financing that originates from debt.

--3.Next, I examined the Return on Investment (ROI), which indicates the percentage return on invested capital, serving as a useful measure for assessing the productivity of investments."

ALTER TABLE
  tst 
  ADD "ROI 2013" DECIMAL (9,2),
  ADD "ROI 2014" DECIMAL (9,2),
  ADD "ROI 201" DECIMAL (9,2)

  UPDATE 
  tst 
  SET "ROI 2013" = (CAST("Utile
  2013" AS FLOAT)/ CAST("Investimenti
  2013" AS FLOAT))*100,
      "ROI 2014" = (CAST("Utile
  2014" AS FLOAT)/ CAST("Investimenti
  2014" AS FLOAT))*100,
      "ROI 2015" = (CAST("Utile
  2015" AS FLOAT)/ CAST("Investimenti
  2015" AS FLOAT))*100

  SELECT 
  AVG("ROI 2013"),
  AVG("ROI 2014"),
  AVG("ROI 2015")
FROM
  tst)

--ROI 2013 _ 0.03%
--ROI 2014 _ -1.65%
--ROI 2015 _ -9.95%
--When ROI calculations yield a negative percentage, it indicates that the company is not profitable.

--4. I then proceeded to assess the overall profitability for each year, starting with an analysis of the average EBITDA (MOL).
--This indicator has already a column in the table, and reflects the company's operating profitability, excluding depreciation and amortization expenses."

SELECT
 AVG("Mol
2013") AS avg_mol_2013,
 AVG("Mol
2014") AS avg_mol_2014,
AVG("Mol
2015") AS avg_mol_2015
FROM 
  tst

--Average EBITDA 2013 _ €202.250,97
--Average EBITDA 2014 _ €212.409,49	
--Average EBITDA 2015 _ €181.816,14
--The higher the EBITDA margin, the lower a company's operating expenses are in relation to total revenue, enhancing its bottom line and resulting in a more profitable operation.

--5. I then compared the average Return on Equity (ROE) for each year.
--This indicator measures the profit generated for each unit of equity, providing valuable insight for investors."

ALTER TABLE 
  tst
  ADD "ROE 2013" DECIMAL (9,2)
  ADD "ROE 2014" DECIMAL (9,2),
  ADD "ROE 2015" DECIMAL (9,2)

  UPDATE 
  tst 
  SET "ROE 2013" = (CAST("Utile
  2013" AS FLOAT)/ CAST("Netto
  2013" AS FLOAT))*100,
      "ROE 2014" = (CAST("Utile
  2014" AS FLOAT)/ CAST("Netto
  2014" AS FLOAT))*100,
      "ROE 2015" = (CAST("Utile
  2015" AS FLOAT)/ CAST("Netto
  2015" AS FLOAT))*100

  SELECT 
  AVG("ROE 2013"),
  AVG("ROE 2014"),
  AVG("ROE 2015")
FROM
  tst)
--Average ROE 2013 _ 1.73%
--Average ROE 2014 _ -8.80%
--Average ROE 2015 _ 12.60%
--A higher ROE is preferable to a low or negative value, as it signals that a company is efficiently utilizing its shareholders' equity to generate income.

--6. The numbers were low, so I examined the minimum and maximum values for Utile (Net Income) and Netto (Equity).

SELECT
  MIN("Utile
2013") AS min_utile_2013,
 MIN("Utile
2014") AS min_utile_2014,
 MIN("Utile
2015") AS min_utile_2015,
 MAX("Utile
2013") AS max_utile_2013,
 MAX("Utile
2014") AS max_utile_2014,
 MAX("Utile
2015") AS max_utile_2015
FROM
  tst

SELECT
  MIN("Netto
2013") AS min_netto_2013,
 MIN("Netto
2014") AS min_netto_2014,
 MIN("Netto
2015") AS min_netto_2015,
 MAX("Netto
2013") AS max_netto_2013,
 MAX("Netto
2014") AS max_netto_2014,
 MAX("Netto
2015") AS max_netto_2015
FROM
  tst

--Many negative values were returned, which explains the low ROE.

--7. I then proceeded to assess Operational Efficiency for each year, beginning with Revenue per Employee.
--This metric measures how efficiently the company utilizes its resources, particularly in relation to its workforce.

ALTER TABLE 
  tst
  ADD "Operational Efficiency 2013" DECIMAL (9,2),
  ADD "Operational Efficiency 2014" DECIMAL (9,2),
  ADD "Operational Efficiency 2015" DECIMAL (9,2)

  UPDATE 
  tst 
  SET "Operational Efficiency 2013" = (CAST("Ricavi
  2013" AS FLOAT)/ CAST("Dipendenti
  2013" AS FLOAT))*100,
      "Operational Efficiency 2014" = (CAST("Ricavi
  2014" AS FLOAT)/ CAST("Dipendenti
  2014" AS FLOAT))*100,
      "Operational Efficiency 2015" = (CAST("Ricavi
  2015" AS FLOAT)/ CAST("Dipendenti
  2015" AS FLOAT))*100

  SELECT 
  AVG("Operational Efficiency 2013"),
  AVG("Operational Efficiency 2014"),
  AVG("Operational Efficiency 2015")
FROM
  tst)

--Average Labor Cost per Employee 2013 _ €32.974,10
--Average Labor Cost per Employee 2014 _ €34.154,03
--Average Labor Cost per Employee 2015 _ €37.482,10
--A higher revenue per employee ratio indicates greater productivity, which often translates into higher profits for the company.

--8. The previous numbers were more favorable, so I decided to check the average Labor Cost per Employee.
--This metric indicates the average cost per employee, helping to understand how 'expensive' the workforce is for the company.

ALTER TABLE 
  tst 
  ADD "Labor Cost per Employee 2013" DECIMAL (9,2),
  ADD "Labor Cost per Employee 2014" DECIMAL (9,2),
  ADD "Labor Cost per Employee 2015" DECIMAL (9,2)

  UPDATE
  tst 
  SET "Labor Cost per Employee 2013" = (CAST("Costo lav
  2013" AS FLOAT)/ CAST("Dipendenti
  2013" AS FLOAT)),
     "Labor Cost per Employee 2014" = (CAST("Costo lav
  2014" AS FLOAT)/ CAST("Dipendenti
  2014" AS FLOAT)),
     "Labor Cost per Employee 2015" = (CAST("Costo lav
  2015" AS FLOAT)/ CAST("Dipendenti
  2015" AS FLOAT))

  SELECT 
  AVG("Labor Cost per Employee 2013"),
  AVG("Labor Cost per Employee 2014"),
  AVG("Labor Cost per Employee 2015")
FROM
  tst)

--Average Labor Cost per Employee 2013 _ €32.973,71
--Average Labor Cost per Employee 2014 _ €35.050,10
--Average Labor Cost per Employee 2015 _ €35.995.54
--The numbers have been quite consistent over the three years.
--The higher a company's labor costs, the more it pays its employees and the less it retains for other business operations.
--The numbers have been quite consistent over the three years.

--9. I then added Value per Employee, which measures the average productivity per employee.

ALTER TABLE
  tst
  ADD "Value per Employee 2013" DECIMAL (9,2),
  ADD "Value per Employee 2014" DECIMAL (9,2),
  ADD "Value per Employee 2015" DECIMAL (9,2)

  UPDATE
  tst 
  SET "Value per Employee 2013" = (CAST("Val
  2013" AS FLOAT)/ CAST("Dipendenti
  2013" AS FLOAT)),
      "Value per Employee 2014" = (CAST("Val
  2014" AS FLOAT)/ CAST("Dipendenti
  2014" AS FLOAT)),
      "Value per Employee 2015" = (CAST("Val
  2015" AS FLOAT)/ CAST("Dipendenti
  2015" AS FLOAT))

  SELECT 
  AVG("Value per Employee 2013"),
  AVG("Value per Employee 2014"),
  AVG("Value per Employee 2015")
FROM
  tst)
  
--Average Added Value per Employee 2013 _ €49.825,76 
--Average Added Value per Employee 2014 _ €50.151,14
--Average Added Value per Employee 2015 _ €40.359,09
--A higher Added Value per Employee ratio indicates that employees are contributing more value to the company's products, leading to increased revenue.

--10. Finally, I assessed Operating Profitability, which indicates the percentage of revenue that results in operating profit.

ALTER TABLE 
  tst 
  ADD "Operating Profitability 2013" DECIMAL (9,2),
  ADD "Operating Profitability 2014" DECIMAL (9,2),
  ADD "Operating Profitability 2015" DECIMAL (9,2)

  UPDATE
  tst 
  SET "Operating Profitability 2013" = (CAST("Mol
  2013" AS FLOAT)/ CAST("Ricavi
  2013" AS FLOAT))*100,
      "Operating Profitability 2014" = (CAST("Mol
  2014" AS FLOAT)/ CAST("Ricavi
  2014" AS FLOAT))*100,
      "Operating Profitability 2015" = (CAST("Mol
  2015" AS FLOAT)/ CAST("Ricavi
  2015" AS FLOAT))*100

  SELECT 
  AVG("Operating Profitability 2013"),
  AVG("Operating Profitability 2014"),
  AVG("Operating Profitability 2015")
FROM
  tst

--Average Operating Profitability 2013 _ 5.84%
--Average Operating Profitability 2013 _ 4.34%
--Average Operating Profitability 2013 _ -32.21%
--Low profitability primarily results from excessive operating costs, insufficient revenue, or a combination of both.

--11.11. Some companies have the words 'IN LIQUIDAZIONE' written in front of the company name, I counted them and found out that 111 companies were in liquidation.

SELECT 
 COUNT(*)
FROM
  tst 
WHERE 
 "Ragione sociale" LIKE '%IN LIQUIDAZIONE%'

--12.I wanted to examine at least one of the indicators to gain a clearer understanding of their impact on the results.
--I chose to analyze their average Operating Profitability.

SELECT 
  AVG("Operating Profitability 2013"),
  AVG("Operating Profitability 2014"),
  AVG("Operating Profitability 2015")
FROM
  tst)
  WHERE
 "Ragione sociale" LIKE '%IN LIQUIDAZIONE%'

--Average Operating Profitability 2013 _ 7.23%
--Average Operating Profitability 2014 _ -9.41%
--Average Operating Profitability 2015 _ -266.77%
--We can see that they have quite low numbers, especially in 2015.

--13.I also compared the Operating Profitability of the 10 companies with the best and worst performance, repeating the query below for each scenario and year.

SELECT 
"Ragione sociale",
"Operating Profitability 2013"
FROM
  tst
ORDER BY
  "Operating Profitability 2013" DESC
 LIMIT 10
  
--14.And the average by year.

SELECT AVG("Operating Profitability 2013")
FROM
 (SELECT 
"Ragione sociale",
"Operating Profitability 2013"
FROM
  tst
ORDER BY
  "Operating Profitability 2013" DESC
 LIMIT 10)

--            2013    2014    2015
--10 best _   153.09%   203.00%   237.48%
--10 worse _ -151.89%  -242.27% -3,276.90%

--We can observe that while the top 10 companies experienced significantly greater profit growth over the three years compared to the sector average, the bottom 10 companies faced a substantial decline, particularly in 2015.
--Although the overall average also deteriorated during this period, especially in 2015, it remained far better than the performance of the bottom 10.
--As we could already see while calculating the ratios earlier, all other ratios and indicators performed worse in 2015, so these final results are not surprising.

--15.To provide a clearer picture, I decided to compare the percentage of companies with positive profitability (greater than 0) versus those with negative profitability (less than 0).
--I repeated the query below for the following two years.

SELECT 
  (COUNT("Operating Profitability 2013")*100)/1012 
FROM
  tst 
WHERE 
  "Operating Profitability 2013" > 0

--In 2013 and 2014, 86% of the companies ended the year with a positive balance, and this figure dropped to 80% in 2015.

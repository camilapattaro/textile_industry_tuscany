--1.My first step was to examine the average Debt Ratio, which indicates the proportion of financing through debt relative to total investments.
--The columns are of INTEGER data type, so I needed to CAST them to FLOAT in order to perform the division.

SELECT 
AVG(debito_2013/investimenti_2013) AS avg_raporto_indebitamento_2013,
AVG(debito_2013/investimenti_2014) AS avg_raporto_indebitamento_2014,
AVG(debito_2013/investimenti_2015) AS avg_raporto_indebitamento_2015
FROM
(SELECT 
  CAST("Debito
2013" AS FLOAT) AS debito_2013,
  CAST("Debito
2014" AS FLOAT) AS debito_2014,
  CAST("Debito
2015" AS FLOAT) AS debito_2015,
  CAST("Investimenti
2013" AS FLOAT) AS investimenti_2013,
  CAST("Investimenti
2014" AS FLOAT) AS investimenti_2014,
  CAST("Investimenti
2015" AS FLOAT) AS investimenti_2015
FROM
  tst)

--Debt Ratio 2013 _ 0.67
--Debt Ratio 2014 _ 0.67
--Debt Ratio 2015 _ 0.95 
--A Debt Ratio greater than 1.0 indicates that the company has more debt than investments, whereas a Debt Ratio below 1.0 indicates that the company has more investments than debt.

--2.The next step was to examine the Debt-to-Equity Ratio, which measures the level of debt relative to equity and offers insight into the extent to which the company relies on debt to finance its operations.
  SELECT 
AVG(debito_2013/netto_2013) AS avg_raporto_debito_netto_2013,
AVG(debito_2013/netto_2014) AS avg_raporto_debito_netto_2014,
AVG(debito_2013/netto_2015) AS avg_raporto_debito_netto_2015 
FROM
(SELECT 
  CAST("Debito
2013" AS FLOAT) AS debito_2013,
  CAST("Debito
2014" AS FLOAT) AS debito_2014,
  CAST("Debito
2015" AS FLOAT) AS debito_2015,
  CAST("Netto
2013" AS FLOAT) AS netto_2013,
  CAST("Netto
2014" AS FLOAT) AS netto_2014,
  CAST("Netto
2015" AS FLOAT) AS netto_2015
FROM
  tst)

--Average Debt-to-Equity Ratio 2013 _ 5.47
--Average Debt-to-Equity Ratio 2014 _ 11.55
--Average Debt-to-Equity Ratio 2015 _ 4.12
--In general, the higher the Debt-to-Equity Ratio, the greater the proportion of a company's financing that originates from debt.

--3.Next, I examined the Return on Investment (ROI), which indicates the percentage return on invested capital, serving as a useful measure for assessing the productivity of investments."

  SELECT 
AVG((utile_2013/investimenti_2013))*100 AS avg_rendimento_degli_investimenti_2013,
AVG((utile_2014/investimenti_2014))*100 AS avg_rendimento_degli_investiment_2014,
AVG((utile_2015/investimenti_2015))*100 AS avg_rendimento_degli_investiment_2015 
FROM
(SELECT 
  CAST("Utile
2013" AS FLOAT) AS utile_2013,
  CAST("Utile
2014" AS FLOAT) AS utile_2014,
  CAST("Utile
2015" AS FLOAT) AS utile_2015,
  CAST("Investimenti
2013" AS FLOAT) AS investimenti_2013,
  CAST("Investimenti
2014" AS FLOAT) AS investimenti_2014,
  CAST("Investimenti
2015" AS FLOAT) AS investimenti_2015
FROM
  tst)

--ROI 2013 _ 0.03%
--ROI 2014 _ -1.65%
--ROI 2015 _ -9.95%
--When ROI calculations yield a negative percentage, it indicates that the company is not profitable.

--4. I then proceeded to assess the overall profitability for each year, starting with an analysis of the average EBITDA (MOL).
--This indicator reflects the company's operating profitability, excluding depreciation and amortization expenses."

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

SELECT 
  AVG(roe_2013) AS avg_roe_2013,
  AVG(roe_2014) AS avg_roe_2014,
  AVG(roe_2015) AS avg_roe_2015
FROM
(SELECT 
  (utile_2013/netto_2013)*100 AS roe_2013,
  (utile_2014/netto_2014)*100 AS roe_2014,
  (utile_2015/netto_2015)*100 AS roe_2015
FROM
(SELECT 
  CAST("Utile
2013" AS FLOAT) AS utile_2013,
  CAST("Utile
2014" AS FLOAT) AS utile_2014,
  CAST("Utile
2015" AS FLOAT) AS utile_2015,
  CAST("Netto
2015" AS FLOAT) AS netto_2013,
  CAST("Netto
2014" AS FLOAT) AS netto_2014,
  CAST("Netto
2015" AS FLOAT) AS netto_2015
FROM
  tst))

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

SELECT 
  AVG(ricavi_2013/dipendenti_2013) AS avg_ricavi_per_dipendenti_2013,
  AVG(ricavi_2014/dipendenti_2014) AS avg_ricavi_per_dipendenti_2014,
  AVG(ricavi_2015/dipendenti_2015) AS avg_ricavi_per_dipendenti_2015
 FROM
(SELECT 
  CAST("Ricavi
2013" AS FLOAT) AS ricavi_2013,
  CAST("Ricavi
2014" AS FLOAT) AS ricavi_2014,
  CAST("Ricavi
2015" AS FLOAT) AS ricavi_2015,
  CAST("Dipendenti
2013" AS FLOAT) AS dipendenti_2013,
  CAST("Dipendenti
2014" AS FLOAT) AS dipendenti_2014,
  CAST("Dipendenti
2015" AS FLOAT) AS dipendenti_2015
FROM
  tst)

--Average Labor Cost per Employee 2013 _ €32.974,10
--Average Labor Cost per Employee 2014 _ €34.154,03
--Average Labor Cost per Employee 2015 _ €37.482,10
--A higher revenue per employee ratio indicates greater productivity, which often translates into higher profits for the company.

--8. The previous numbers were more favorable, so I decided to check the average Labor Cost per Employee.
--This metric indicates the average cost per employee, helping to understand how 'expensive' the workforce is for the company.

SELECT 
  AVG(costo_lavoro_2013/dipendenti_2013) AS avg_costo_lavoro_per_dipendente_2013,
  AVG(costo_lavoro_2014/dipendenti_2014) AS avg_costo_lavoro_per_dipendente_2014,
  AVG(costo_lavoro_2015/dipendenti_2015) AS avg_costo_lavoro_per_dipendente_2015
FROM
(SELECT 
  CAST("Costo lav
2013" AS FLOAT) AS costo_lavoro_2013,
  CAST("Costo lav
2013" AS FLOAT) AS costo_lavoro_2014,
  CAST("Costo lav
2013" AS FLOAT) AS costo_lavoro_2015,
  CAST("Dipendenti
2013" AS FLOAT) AS dipendenti_2013,
  CAST("Dipendenti
2014" AS FLOAT) AS dipendenti_2014,
  CAST("Dipendenti
2015" AS FLOAT) AS dipendenti_2015
FROM
  tst)

--Average Labor Cost per Employee 2013 _ €32.973,71
--Average Labor Cost per Employee 2014 _ €35.049,71
--Average Labor Cost per Employee 2015 _ €35.995.13
--The numbers have been quite consistent over the three years.
--The higher a company's labor costs, the more it pays its employees and the less it retains for other business operations.
--The numbers have been quite consistent over the three years.

--9. I then added Value per Employee, which measures the average productivity per employee.

SELECT 
AVG(val_2013/dipendenti_2013) AS val_aggiunto_per_dipendenti_2013,
AVG(val_2014/dipendenti_2014) AS val_aggiunto_per_dipendenti_2014,
AVG(val_2015/dipendenti_2015) AS val_aggiunto_per_dipendenti_2015
FROM
(SELECT 
  CAST("Val
2013" AS FLOAT) AS val_2013,
  CAST("Val
2014" AS FLOAT) AS val_2014,
  CAST("Val
2015" AS FLOAT) AS val_2015,
  CAST("Dipendenti
2013" AS FLOAT) AS dipendenti_2013,
  CAST("Dipendenti
2014" AS FLOAT) AS dipendenti_2014,
  CAST("Dipendenti
2015" AS FLOAT) AS dipendenti_2015
FROM
  tst)

--Average Added Value per Employee 2013 _ €49.825,76 
--Average Added Value per Employee 2014 _ €50.151,14
--Average Added Value per Employee 2015 _ €40.359,09
--A higher Added Value per Employee ratio indicates that employees are contributing more value to the company's products, leading to increased revenue.

--10. Finally, I assessed Operating Profitability, which indicates the percentage of revenue that results in operating profit.

SELECT 
AVG((mol_2013/ricavi_2013)*100) AS avg_redditivita_operativa_2013,
AVG((mol_2014/ricavi_2014)*100) AS avg_redditivita_operativa_2014,
AVG((mol_2015/ricavi_2015)*100) AS avg_redditivita_operativa_2015
FROM
(SELECT 
  CAST("Mol
2013" AS FLOAT) AS mol_2013,
  CAST("Mol
2014" AS FLOAT) AS mol_2014,
  CAST("Mol
2015" AS FLOAT) AS mol_2015,
  CAST("Ricavi
2013" AS FLOAT) AS ricavi_2013,
  CAST("Ricavi
2014" AS FLOAT) AS ricavi_2014,
  CAST("Ricavi
2015" AS FLOAT) AS ricavi_2015
FROM
  tst)

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
AVG(mol_2013/ricavi_2013)*100 AS avg_redditivita_operativa_in_liquidazione_2013,
AVG(mol_2014/ricavi_2014)*100 AS avg_redditivita_operativa_in_liquidazione_2014,
AVG(mol_2015/ricavi_2015)*100 AS avg_redditivita_operativa_in_liquidazione_2015
FROM
(SELECT 
 "Ragione sociale",
  CAST("Mol
2013" AS FLOAT) AS mol_2013,
  CAST("Mol
2014" AS FLOAT) AS mol_2014,
  CAST("Mol
2015" AS FLOAT) AS mol_2015,
  CAST("Ricavi
2013" AS FLOAT) AS ricavi_2013,
  CAST("Ricavi
2014" AS FLOAT) AS ricavi_2014,
  CAST("Ricavi
2015" AS FLOAT) AS ricavi_2015
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
mol_2013/ricavi_2013 AS redditivita_operativa_2013
FROM
(SELECT 
 "Ragione sociale",
  CAST("Mol
2013" AS FLOAT) AS mol_2013,
  CAST("Mol
2014" AS FLOAT) AS mol_2014,
  CAST("Mol
2015" AS FLOAT) AS mol_2015,
  CAST("Ricavi
2013" AS FLOAT) AS ricavi_2013,
  CAST("Ricavi
2014" AS FLOAT) AS ricavi_2014,
  CAST("Ricavi
2015" AS FLOAT) AS ricavi_2015
FROM
  tst)
ORDER BY
  redditivita_operativa_2013 DESC
 LIMIT 10

--14.And the average by year.

SELECT AVG(redditivita_operativa_2013)
FROM
(SELECT 
"Ragione sociale",
mol_2014/ricavi_2013 AS redditivita_operativa_2013
FROM
(SELECT 
 "Ragione sociale",
  CAST("Mol
2013" AS FLOAT) AS mol_2013,
  CAST("Mol
2014" AS FLOAT) AS mol_2014,
  CAST("Mol
2015" AS FLOAT) AS mol_2015,
  CAST("Ricavi
2013" AS FLOAT) AS ricavi_2013,
  CAST("Ricavi
2014" AS FLOAT) AS ricavi_2014,
  CAST("Ricavi
2015" AS FLOAT) AS ricavi_2015
FROM
  tst)
ORDER BY
  redditivita_operativa_2013 DESC
 LIMIT 10)

--            2013    2014    2015
--10 best _   1.48%   2.03%   3.58%
--10 worse _ -1.52%  -91.97% -136.27%

--We can observe that while the top 10 companies saw growth in profits over the three years, the bottom 10 companies experienced a decline, particularly in 2015.
  --The overall average also worsened over these three years, especially in 2015.
--As we could already see while calculating the ratios earlier, all other ratios and indicators performed worse in 2015, so these final results are not surprising.

--15.To provide a clearer picture, I decided to compare the percentage of companies with positive profitability (greater than 0) versus those with negative profitability (less than 0).
--I repeated the query below for the following two years.

SELECT 
 (COUNT(*)*100)/1012 AS percentage_positive_profit_2013
FROM
(SELECT 
(mol_2015/ricavi_2013)*100 AS redditivita_operativa_2013
FROM
(SELECT 
 "Ragione sociale",
  CAST("Mol
2013" AS FLOAT) AS mol_2013,
  CAST("Mol
2014" AS FLOAT) AS mol_2014,
  CAST("Mol
2015" AS FLOAT) AS mol_2015,
  CAST("Ricavi
2013" AS FLOAT) AS ricavi_2013,
  CAST("Ricavi
2014" AS FLOAT) AS ricavi_2014,
  CAST("Ricavi
2015" AS FLOAT) AS ricavi_2015
FROM
  tst))
 WHERE redditivita_operativa_2013 > 0

--In 2013 and 2014, 86% of the companies ended the year with a positive balance, and this figure dropped to 80% in 2015.

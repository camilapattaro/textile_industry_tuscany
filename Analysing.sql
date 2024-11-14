--1.My first step was to check the average Debt Ratio, that provides an indication of the proportion of financing through debt relative to total investments.
--The columns have INTEGER data type, so I had to CAST to FLOAT, in order to perform a division.

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

----Debt Ratio 2013 _ 0.67
----Debt Ratio 2014 _ 0.67
----Debt Ratio 2015 _ 0.95 
----A Debt Ratio higher than 1.0 indicates the companu has more dept than investments, while a Debt Ratio lower then 1.0, indicates that the company has more investments.
----2015 was the worse.

--2.Next step is to check Debt-to-Equity Ratio, which measures the level of debt relative to equity and provides an idea of how much the company relies on debt to finance its operations.

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

----Debt-to-Equity Ratio 2013 _ 5.47
----Debt-to-Equity Ratio 2014 _ 11.55
----Debt-to-Equity Ratio 2015 _ 4.12
----2014 was the worse.

--3.Now we have a look at Return on Investment (ROI), which indicates the percentage return on capital invested, useful for evaluating the productivity of investments.

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

----ROI 2013 _ 0.03%
----ROI 2014 _ -1.65%
----ROI 2015 _ -9.95%
----2015 is the worse.

--4.After I checked the general profitability, for each year.
--My first step was having a look at the EBITDA (MOL) average.
--This indicator shows the company's operating profitability, excluding depreciation and amortization expenses.

SELECT
 AVG("Mol
2013") AS avg_mol_2013,
 AVG("Mol
2014") AS avg_mol_2014,
AVG("Mol
2015") AS avg_mol_2015
FROM 
  tst

----Average EBITDA 2013 _ €202.250,97
----Average EBITDA 2014 _ €212.409,49	
----Average EBITDA 2015 _ €181.816,14

--5.Then I compared the average of the Return on Equity (ROE) for each year.
--This indicator measures the profit generated for each unit of equity, useful for investors.

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

----Average ROE 2013 _ 1.73%
----Average ROE 2014 _ -8.80%
----Average ROE 2015 _ 12.60%

--6.The numbers are low, so I checked the minimum and maximum for the valued Utile(Net Income) and Netto(Equity).

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

----A lot of negative values were returned, which explains the low ROE.

--7.Then I moved on to check the Operational Efficiency, for each year.
--Starting wirh Revenue per Employee, which measures how efficient the company is in using its resources, especially concerning employees.

SELECT 
  AVG(ricavi_per_dipendenti_2013) AS avg_ricavi_per_dipendenti_2013,
  AVG(ricavi_per_dipendenti_2014) AS avg_ricavi_per_dipendenti_2014,
  AVG(ricavi_per_dipendenti_2015) AS avg_ricavi_per_dipendenti_2015
FROM
(SELECT 
 ("Ricavi
2013" /"Dipendenti
2013") AS ricavi_per_dipendenti_2013,
 ("Ricavi
2014" /"Dipendenti
2014") AS ricavi_per_dipendenti_2014,
 ("Ricavi
2015" /"Dipendenti
2015") AS ricavi_per_dipendenti_2015
FROM 
  tst)

----Average Revenue per Employee 2013 _ €311.256,77
----Average Revenue per Employee 2014 _ €316.006,33
----Average Revenue per Employee 2015 _ €288.586,60
----This time the numbers don't look bad.

--8.The numbers before were not bad, so I decided to check the average Labor Cost per Employee.
---That indicates the average cost per employee; helping to understand how “expensive” the workforce is for the company.

SELECT 
 AVG(costo_lavoro_per_dipendente_2013) AS avg_costo_lavoro_per_dipendente_2013,
 AVG(costo_lavoro_per_dipendente_2014) AS avg_costo_lavoro_per_dipendente_2014,
 AVG(costo_lavoro_per_dipendente_2015) AS avg_costo_lavoro_per_dipendente_2015
FROM
(SELECT 
 ("Costo lav
2013" / "Dipendenti
2013") AS costo_lavoro_per_dipendente_2013,
  ("Costo lav
2014"/ "Dipendenti
2014") AS costo_lavoro_per_dipendente_2014,
  ("Costo lav
2015"/"Dipendenti
2015") AS costo_lavoro_per_dipendente_2015
FROM 
  tst)

----Average Labor Cost per Employee 2013 _ €32.973,71
----Average Labor Cost per Employee 2014 _ €35.049,71
----Average Labor Cost per Employee 2015 _ €35.995.13
----The numbers are pretty stable, over the years.

--9.Now Added Value per Employee, which measures the average productivity per employee.

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

----Average Added Value per Employee 2013 _ €49.825,76 
----Average Added Value per Employee 2014 _ €50.151,14
----Average Added Value per Employee 2015 _ €40.359,09

--10.For last, the Operating Profitability, which indicates the percentage of revenue that results in operating profitability.

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

----Average Operating Profitability 2013 _ 5.84%
----Average Operating Profitability 2013 _ 4.34%
----Average Operating Profitability 2013 _ -32.21%






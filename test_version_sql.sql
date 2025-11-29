USE [test_liga]
GO

/*Джоін на до таблиці Invoice (Рахунки) в CTE для багаторазового використання*/ 
	WITH cte_table AS (
		SELECT	
			c.[ID]
			,c.[Логін]
			,FORMAT(i.[Рік_місяць], 'yyyy.MM') AS [Рік_місяць]
			,i.[Прайс]
			,i.[Клієнт]
			,i.[Сегмент]
			,i.[Канал_продажу]
			,c.[Посада]
			,i.[Сума_євро]
	FROM customers c
	INNER JOIN invoice i
	ON 
		c.ID =i.ID
	)

--Завдання 1.1
SELECT
	[Канал_продажу]
	,[Посада]
	,COUNT([Логін]) AS [Кількість користувачів]
	,ROUND(SUM([Сума_євро]), 1)  AS Сума
	,ROUND(AVG([Сума_євро]),1) AS [Середній чек]
FROM 
	cte_table
GROUP BY 
	[Канал_продажу]
	,[Посада]
ORDER BY 
	[Кількість користувачів] DESC;

--Завдання 1.2
SELECT
	[Сегмент]
	,[Посада]
	,COUNT([Логін]) AS [Кількість користувачів]
	,ROUND(SUM([Сума_євро]), 1)  AS Сума
	,ROUND(AVG([Сума_євро]),1) AS [Середній чек]
FROM 
	cte_table
GROUP BY 
	[Сегмент]
	,[Посада]
ORDER BY 
	[Кількість користувачів] DESC;


--Завдання 2.1
SELECT
	[Канал_продажу]
	,COUNT([Клієнт]) AS [Кількість клієнтів]
	,ROUND(SUM([Сума_євро]), 1)  AS Сума
	,ROUND(AVG([Сума_євро]),1) AS [Середній чек]
FROM 
	[dbo].[invoice]
GROUP BY 
	[Канал_продажу]
ORDER BY 
	[Кількість клієнтів] DESC;

/*Завдання 2.2*/
SELECT
	[Сегмент]
	,COUNT([Клієнт]) AS [Кількість клієнтів]
	,ROUND(SUM([Сума_євро]), 1)  AS Сума
	,ROUND(AVG([Сума_євро]),1) AS [Середній чек]
FROM 
	[dbo].[invoice]
GROUP BY 
	[Сегмент]
ORDER BY 
	[Кількість клієнтів] DESC;
--2019.10.26_practise

/*Задание_1*/
-- Написать SQL script для создания таблички Planets. Заполнить значениями из примера:

USE PLANETS

CREATE TABLE Planets (
	ID INT PrimaryKey identity(1, 1) PlanetName VARCHAR(20)
	,Radius INT
	,SunSeason FLOAT
	,OpeningYear SMALLINT
	,HavingRings BIT
	,Opener VARCHAR(50)
	)

INSERT INTO Planets
VALUES (
	'mars'
	,3396
	,687
	,1659
	,0
	,'christiaan huygens'
	)
	,(
	'saturn'
	,60268
	,10759.22
	,NULL
	,1
	,NULL
	)
	,(
	'neptune'
	,24764
	,60190
	,1846
	,1
	,'john couch adams'
	)
	,(
	'mercury'
	,2439
	,115.88
	,1631
	,0
	,'nicolaus copernicus'
	)
	,(
	'venus'
	,6051
	,243
	,1610
	,0
	,'galileo galilei'
	)

/*Задание_2*/
-- Используя оператор SQL WHERE вывести записи, значение радиуса (Radius) которых находится в пределах от 3000 до 9000:
SELECT *
FROM Planets
WHERE [dbo].[Planets].Radius BETWEEN 3000
		AND 9000

/*Задание_3*/
-- Используя оператор SQL WHERE вывести название планеты (PlanetName), год ее открытия (OpeningYear) и имя первооткрывателя (Opener), планет, чье название не начинается или не заканчивается на букву «s»:

SELECT PlanetName
	,OpeningYear
	,Opener
FROM Planets
WHERE [dbo].[Planets].PlanetName LIKE 's%'
	OR [dbo].[Planets].PlanetName LIKE '%s'

/*Задание_4*/
--  Используя операторы SQL WHERE  вывести записи планет, у которых радиус планеты меньше 10000 и открытых (OpeningYear) после 1620:

SELECT *
FROM Planets
WHERE [dbo].[Planets].Radius < 10000
	AND [dbo].[Planets].OpeningYear > 1620

/*Задание_5*/
-- Используя операторы SQL WHERE вывести записи планет, названия которых начинаются с буквы «N» или заканчиваются на букву «s» и не имеющие колец:

SELECT *
FROM Planets
WHERE [dbo].[Planets].HavingRings = 0
	AND [dbo].[Planets].PlanetName LIKE 'N%'
	OR [dbo].[Planets].PlanetName LIKE '%s'

/*Задание_6*/
-- С помощью оператора SQL UPDATE изменить название планеты Neptune на Pluton:

UPDATE Planets
SET PlanetName = 'Pluton'
WHERE [dbo].[Planets].PlanetName LIKE 'Neptune'

-- TO SHOW
SELECT *
FROM Planets

/*Задание_7*/
-- С помощью оператора SQL UPDATE у первых трех записей таблицы изменить значение наличия колец (HavingRings) на «No»:

UPDATE Planets
SET HavingRings = 0
WHERE [dbo].[Planets].ID <= 3

--TO SHOW
SELECT *
FROM Planets

/*Задание_8*/
-- С помощью оператора SQL SELECT INTO вставить записи из таблицы Planets, которые имеют кольца в таблицу PlanetsWithRings:

SELECT *
FROM Planets
INTO PlanetsWithRings
WHERE [dbo].PlanetsWithRings.HavingRings = 1

/*Задание_9*/
-- Вывести на экран табличку:

SELECT *
FROM PlanetsWithRings

/*Задание_10*/
-- Используя оператор DELETE удалить из таблицы записи без колец и с незаполненными полями:

DELETE
FROM PlanetsWithRings
WHERE [dbo].PlanetsWithRings.HavingRings = 0
  OR [dbo].PlanetsWithRings.PlanetName IS NULL
	OR [dbo].PlanetsWithRings.Radius IS NULL
	OR [dbo].PlanetsWithRings.SunSeason IS NULL
	OR [dbo].PlanetsWithRings.OpeningYear IS NULL
	OR [dbo].PlanetsWithRings.HavingRings IS NULL
	OR [dbo].PlanetsWithRings.Opener IS NULL

--TO SHOW
SELECT *
FROM PlanetsWithRings

/*Задание_11*/
-- Найдите номер модели, скорость и размер жесткого диска для всех ПК стоимостью менее 500 дол. Вывести: model, speed и hd:

SELECT model, speed, hd
FROM PC
WHERE price < 500

/*Задание_12*/
-- Найдите производителей принтеров. Вывести: maker:

SELECT DISTINCT maker
FROM Product
WHERE type LIKE 'Printer'

/*Задание_13*/
-- Найдите номер модели, объем памяти и размеры экранов ПК-блокнотов, цена которых превышает 1000 дол.:

SELECT model, ram, screen
FROM Laptop
WHERE price > 1000

/*Задание_14*/
-- Найдите все записи таблицы Printer для цветных принтеров.:

SELECT * 
FROM Printer
WHERE color = 'y'

/*Задание_15*/
-- Найдите номер модели, скорость и размер жесткого диска ПК, имеющих 12x или 24x CD и цену менее 600 дол.:

SELECT model, speed, hd 
FROM PC 
WHERE cd IN ('12x', '24x') 
AND price < 600

-- OR

SELECT model, speed, hd 
FROM PC 
WHERE price < 600
AND cd = '12x' 
OR  cd = '24x' 

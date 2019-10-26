--2019.10.26_practise

/*�������_1*/
-- �������� SQL script ��� �������� �������� Planets. ��������� ���������� �� �������:

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

/*�������_2*/
-- ��������� �������� SQL WHERE ������� ������, �������� ������� (Radius) ������� ��������� � �������� �� 3000 �� 9000:
SELECT *
FROM Planets
WHERE [dbo].[Planets].Radius BETWEEN 3000
		AND 9000

/*�������_3*/
-- ��������� �������� SQL WHERE ������� �������� ������� (PlanetName), ��� �� �������� (OpeningYear) � ��� ���������������� (Opener), ������, ��� �������� �� ���������� ��� �� ������������� �� ����� �s�:

SELECT PlanetName
	,OpeningYear
	,Opener
FROM Planets
WHERE [dbo].[Planets].PlanetName LIKE 's%'
	OR [dbo].[Planets].PlanetName LIKE '%s'

/*�������_4*/
--  ��������� ��������� SQL WHERE  ������� ������ ������, � ������� ������ ������� ������ 10000 � �������� (OpeningYear) ����� 1620:

SELECT *
FROM Planets
WHERE [dbo].[Planets].Radius < 10000
	AND [dbo].[Planets].OpeningYear > 1620

/*�������_5*/
-- ��������� ��������� SQL WHERE ������� ������ ������, �������� ������� ���������� � ����� �N� ��� ������������� �� ����� �s� � �� ������� �����:

SELECT *
FROM Planets
WHERE [dbo].[Planets].HavingRings = 0
	AND [dbo].[Planets].PlanetName LIKE 'N%'
	OR [dbo].[Planets].PlanetName LIKE '%s'

/*�������_6*/
-- � ������� ��������� SQL UPDATE �������� �������� ������� Neptune �� Pluton:

UPDATE Planets
SET PlanetName = 'Pluton'
WHERE [dbo].[Planets].PlanetName LIKE 'Neptune'

-- TO SHOW
SELECT *
FROM Planets

/*�������_7*/
-- � ������� ��������� SQL UPDATE � ������ ���� ������� ������� �������� �������� ������� ����� (HavingRings) �� �No�:

UPDATE Planets
SET HavingRings = 0
WHERE [dbo].[Planets].ID <= 3

--TO SHOW
SELECT *
FROM Planets

/*�������_8*/
-- � ������� ��������� SQL SELECT INTO �������� ������ �� ������� Planets, ������� ����� ������ � ������� PlanetsWithRings:

SELECT *
FROM Planets
INTO PlanetsWithRings
WHERE [dbo].PlanetsWithRings.HavingRings = 1

/*�������_9*/
-- ������� �� ����� ��������:

SELECT *
FROM PlanetsWithRings

/*�������_10*/
-- ��������� �������� DELETE ������� �� ������� ������ ��� ����� � � �������������� ������:

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

/*�������_11*/
-- ������� ����� ������, �������� � ������ �������� ����� ��� ���� �� ���������� ����� 500 ���. �������: model, speed � hd:

SELECT model, speed, hd
FROM PC
WHERE price < 500

/*�������_12*/
-- ������� �������������� ���������. �������: maker:

SELECT DISTINCT maker
FROM Product
WHERE type LIKE 'Printer'

/*�������_13*/
-- ������� ����� ������, ����� ������ � ������� ������� ��-���������, ���� ������� ��������� 1000 ���.:

SELECT model, ram, screen
FROM Laptop
WHERE price > 1000

/*�������_14*/
-- ������� ��� ������ ������� Printer ��� ������� ���������.:

SELECT * 
FROM Printer
WHERE color = 'y'

/*�������_15*/
-- ������� ����� ������, �������� � ������ �������� ����� ��, ������� 12x ��� 24x CD � ���� ����� 600 ���.:

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

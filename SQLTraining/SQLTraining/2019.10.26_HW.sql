--2019.10.26_HW SQL EX 6-10

-- ������� 6
-- ��� ������� �������������, ������������ ��-�������� c ������� �������� ����� �� ����� 10 �����, ����� �������� ����� ��-���������. 
-- �����: �������������, ��������.

SELECT DISTINCT Product.maker
	,Laptop.speed
FROM Product
JOIN Laptop ON Product.model = Laptop.model
	AND Laptop.hd >= 10
WHERE Product.type LIKE 'Laptop'


-- ������� 7
-- ������� ������ ������� � ���� ���� ��������� � ������� ��������� (������ ����) ������������� B (��������� �����).

SELECT *
FROM (
	SELECT model
		,price
	FROM PC
	
	UNION
	
	SELECT model
		,price
	FROM Laptop
	
	UNION
	
	SELECT model
		,price
	FROM Printer
	) AS All_models
WHERE All_models.model IN (
		SELECT model
		FROM Product
		WHERE maker = 'B'
		)

-- ������� 8
-- ������� ������ ������� � ���� ���� ��������� � ������� ��������� (������ ����) ������������� B (��������� �����).

SELECT DISTINCT maker
FROM Product
WHERE type = 'PC'
	AND maker NOT IN (
		SELECT maker
		FROM Product
		WHERE type = 'Laptop'
		)

-- ������� 9
-- ������� �������������� �� � ����������� �� ����� 450 ���. �������: Maker

SELECT DISTINCT maker
FROM Product
JOIN PC ON Product.model = PC.model
WHERE PC.speed >= 450

-- ������� 10
-- ������� ������ ���������, ������� ����� ������� ����. �������: model, price

SELECT DISTINCT model, price
FROM Printer
WHERE price = (SELECT MAX(price)
FROM Printer)
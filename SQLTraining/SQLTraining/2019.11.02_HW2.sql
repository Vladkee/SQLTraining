-- ������� 11
-- ������� ������� �������� ��.
SELECT AVG(speed)
FROM PC

-- ������� 12
-- ������� ������� �������� ��-���������, ���� ������� ��������� 1000 ���.
SELECT AVG(speed)
FROM Laptop
WHERE price > 1000

-- ������� 13
-- ������� ������� �������� ��, ���������� �������������� A.
SELECT AVG(speed)
FROM PC
JOIN Product ON Product.model = PC.model
WHERE Product.maker = 'A'

-- ������� 14
-- ������� �����, ��� � ������ ��� �������� �� ������� Ships, ������� �� ����� 10 ������.
SELECT Ships.class
	,name
	,Classes.country
FROM Ships
JOIN Classes ON Ships.class = Classes.class
WHERE Classes.numGuns >= 10

-- ������� 15
-- ������� ������� ������� ������, ����������� � ���� � ����� PC. �������: HD
SELECT hd
FROM PC
GROUP BY hd
HAVING COUNT(model) >= 1

-- ������� 16
-- ������� ������� ������� ������, ����������� � ���� � ����� PC. �������: HD
SELECT DISTINCT A.model
	,B.model
	,A.speed
	,A.ram
FROM PC AS A
	,PC AS B
WHERE A.model > B.model
	AND A.speed = B.speed
	AND A.ram = B.ram

-- ������� 17
-- ������� ������ ��-���������, �������� ������� ������ �������� ������ �� ��. �������: type, model, speed
SELECT DISTINCT Product.type
	,Laptop.model
	,Laptop.speed
FROM Laptop
JOIN Product ON Laptop.model = Product.model
WHERE Laptop.speed < (
		SELECT MIN(speed)
		FROM PC
		)

-- ������� 18
-- ������� �������������� ����� ������� ������� ���������. �������: maker, price
SELECT DISTINCT maker
	,price
FROM Printer
JOIN Product ON Product.model = Printer.model
WHERE price = (
		SELECT MIN(price)
		FROM Printer
		WHERE color = 'y'
		)
	AND color = 'y'

-- ������� 19
-- ��� ������� �������������, �������� ������ � ������� Laptop, ������� ������� ������ ������ ����������� �� ��-���������. �������: maker, ������� ������ ������.

SELECT maker
	,AVG(screen) AS avg_screen
FROM Product
JOIN Laptop ON Product.model = Laptop.model
GROUP BY maker

-- ������� 21
-- ������� ������������ ���� ��, ����������� ������ ��������������, � �������� ���� ������ � ������� PC. �������: maker, ������������ ����.

SELECT maker
	,MAX(price) AS Max_price
FROM Product
JOIN PC ON Product.model = PC.model
GROUP BY maker

-- ������� 22
-- ��� ������� �������� �������� ��, ������������ 600 ���, ���������� ������� ���� �� � ����� �� ���������. �������: speed, ������� ����.

SELECT speed
	,AVG(price)
FROM PC
GROUP BY speed
HAVING speed > 600

-- ������� 28
-- ��������� ������� Product, ���������� ���������� ��������������, ����������� �� ����� ������.

SELECT DISTINCT COUNT(maker) AS qty
FROM Product
GROUP BY maker
HAVING COUNT(model) <= 1

SELECT COUNT(maker) AS Qty
FROM Product
WHERE maker IN (
		SELECT maker
		FROM Product
		GROUP BY maker
		HAVING COUNT(model) <= 1
		)

-- ������� 31
-- ��� ������� ��������, ������ ������ ������� �� ����� 16 ������, ������� ����� � ������.

SELECT class
	,country
FROM Classes
WHERE bore >= 16

-- ������� 33
-- ������� �������, ����������� � ��������� � �������� ��������� (North Atlantic). �����: ship.

SELECT ship
FROM Outcomes
WHERE battle LIKE 'North Atlantic'
	AND result LIKE 'sunk'

-- ������� 38
-- ������� ������, ������� �����-���� ������ ������� ������ �������� ('bb') � ������� �����-���� ������ ��������� ('bc').

SELECT country
FROM Classes
WHERE type LIKE 'bb'

INTERSECT

SELECT country
FROM Classes
WHERE type LIKE 'bc'

-- ������� 42
-- ������� �������� ��������, ����������� � ���������, � �������� ��������, � ������� ��� ���� ���������.

SELECT ship
	,battle
FROM Outcomes
WHERE result = 'sunk'

-- ������� 44
-- ������� �������� ���� �������� � ���� ������, ������������ � ����� R.

SELECT DISTINCT name
FROM Ships
WHERE name LIKE 'R%'

UNION

SELECT ship
FROM Outcomes
WHERE ship LIKE 'R%'

-- ������� 45
-- ������� �������� ���� �������� � ���� ������, ��������� �� ���� � ����� ���� (��������, King George V).
-- �������, ��� ����� � ��������� ����������� ���������� ���������, � ��� �������� ��������.

SELECT name
FROM Ships
WHERE name LIKE '% % %'

UNION

SELECT ship
FROM Outcomes
WHERE ship LIKE '% % %'

-- ������� 49
-- ������� �������� �������� � �������� ������� 16 ������ (������ ������� �� ������� Outcomes).

SELECT name
FROM Ships
JOIN Classes ON Classes.class = Ships.class
WHERE bore = 16

UNION

SELECT ship
FROM Outcomes
JOIN Classes ON Classes.class = Outcomes.ship
WHERE bore = 16

-- ������� 50
-- ������� ��������, � ������� ����������� ������� ������ Kongo �� ������� Ships.

SELECT DISTINCT battle
FROM Outcomes
JOIN Ships ON Outcomes.ship = Ships.name
WHERE class = 'Kongo'

SELECT DISTINCT battle
FROM Outcomes
WHERE ship IN (
		SELECT name
		FROM Ships
		WHERE class = 'Kongo'
		)

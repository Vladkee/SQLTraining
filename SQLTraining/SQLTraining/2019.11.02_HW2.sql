-- Задание 11
-- Найдите среднюю скорость ПК.
SELECT AVG(speed)
FROM PC

-- Задание 12
-- Найдите среднюю скорость ПК-блокнотов, цена которых превышает 1000 дол.
SELECT AVG(speed)
FROM Laptop
WHERE price > 1000

-- Задание 13
-- Найдите среднюю скорость ПК, выпущенных производителем A.
SELECT AVG(speed)
FROM PC
JOIN Product ON Product.model = PC.model
WHERE Product.maker = 'A'

-- Задание 14
-- Найдите класс, имя и страну для кораблей из таблицы Ships, имеющих не менее 10 орудий.
SELECT Ships.class
	,name
	,Classes.country
FROM Ships
JOIN Classes ON Ships.class = Classes.class
WHERE Classes.numGuns >= 10

-- Задание 15
-- Найдите размеры жестких дисков, совпадающих у двух и более PC. Вывести: HD
SELECT hd
FROM PC
GROUP BY hd
HAVING COUNT(model) >= 1

-- Задание 16
-- Найдите размеры жестких дисков, совпадающих у двух и более PC. Вывести: HD
SELECT DISTINCT A.model
	,B.model
	,A.speed
	,A.ram
FROM PC AS A
	,PC AS B
WHERE A.model > B.model
	AND A.speed = B.speed
	AND A.ram = B.ram

-- Задание 17
-- Найдите модели ПК-блокнотов, скорость которых меньше скорости любого из ПК. Вывести: type, model, speed
SELECT DISTINCT Product.type
	,Laptop.model
	,Laptop.speed
FROM Laptop
JOIN Product ON Laptop.model = Product.model
WHERE Laptop.speed < (
		SELECT MIN(speed)
		FROM PC
		)

-- Задание 18
-- Найдите производителей самых дешевых цветных принтеров. Вывести: maker, price
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

-- Задание 19
-- Для каждого производителя, имеющего модели в таблице Laptop, найдите средний размер экрана выпускаемых им ПК-блокнотов. Вывести: maker, средний размер экрана.

SELECT maker
	,AVG(screen) AS avg_screen
FROM Product
JOIN Laptop ON Product.model = Laptop.model
GROUP BY maker

-- Задание 21
-- Найдите максимальную цену ПК, выпускаемых каждым производителем, у которого есть модели в таблице PC. Вывести: maker, максимальная цена.

SELECT maker
	,MAX(price) AS Max_price
FROM Product
JOIN PC ON Product.model = PC.model
GROUP BY maker

-- Задание 22
-- Для каждого значения скорости ПК, превышающего 600 МГц, определите среднюю цену ПК с такой же скоростью. Вывести: speed, средняя цена.

SELECT speed
	,AVG(price)
FROM PC
GROUP BY speed
HAVING speed > 600

-- Задание 28
-- Используя таблицу Product, определить количество производителей, выпускающих по одной модели.

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

-- Задание 31
-- Для классов кораблей, калибр орудий которых не менее 16 дюймов, укажите класс и страну.

SELECT class
	,country
FROM Classes
WHERE bore >= 16

-- Задание 33
-- Укажите корабли, потопленные в сражениях в Северной Атлантике (North Atlantic). Вывод: ship.

SELECT ship
FROM Outcomes
WHERE battle LIKE 'North Atlantic'
	AND result LIKE 'sunk'

-- Задание 38
-- Найдите страны, имевшие когда-либо классы обычных боевых кораблей ('bb') и имевшие когда-либо классы крейсеров ('bc').

SELECT country
FROM Classes
WHERE type LIKE 'bb'

INTERSECT

SELECT country
FROM Classes
WHERE type LIKE 'bc'

-- Задание 42
-- Найдите названия кораблей, потопленных в сражениях, и название сражения, в котором они были потоплены.

SELECT ship
	,battle
FROM Outcomes
WHERE result = 'sunk'

-- Задание 44
-- Найдите названия всех кораблей в базе данных, начинающихся с буквы R.

SELECT DISTINCT name
FROM Ships
WHERE name LIKE 'R%'

UNION

SELECT ship
FROM Outcomes
WHERE ship LIKE 'R%'

-- Задание 45
-- Найдите названия всех кораблей в базе данных, состоящие из трех и более слов (например, King George V).
-- Считать, что слова в названиях разделяются единичными пробелами, и нет концевых пробелов.

SELECT name
FROM Ships
WHERE name LIKE '% % %'

UNION

SELECT ship
FROM Outcomes
WHERE ship LIKE '% % %'

-- Задание 49
-- Найдите названия кораблей с орудиями калибра 16 дюймов (учесть корабли из таблицы Outcomes).

SELECT name
FROM Ships
JOIN Classes ON Classes.class = Ships.class
WHERE bore = 16

UNION

SELECT ship
FROM Outcomes
JOIN Classes ON Classes.class = Outcomes.ship
WHERE bore = 16

-- Задание 50
-- Найдите сражения, в которых участвовали корабли класса Kongo из таблицы Ships.

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

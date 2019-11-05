--2019.10.26_HW SQL EX 6-10

-- Задание 6
-- Для каждого производителя, выпускающего ПК-блокноты c объёмом жесткого диска не менее 10 Гбайт, найти скорости таких ПК-блокнотов. 
-- Вывод: производитель, скорость.

SELECT DISTINCT Product.maker
	,Laptop.speed
FROM Product
JOIN Laptop ON Product.model = Laptop.model
	AND Laptop.hd >= 10
WHERE Product.type LIKE 'Laptop'


-- Задание 7
-- Найдите номера моделей и цены всех имеющихся в продаже продуктов (любого типа) производителя B (латинская буква).

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

-- Задание 8
-- Найдите номера моделей и цены всех имеющихся в продаже продуктов (любого типа) производителя B (латинская буква).

SELECT DISTINCT maker
FROM Product
WHERE type = 'PC'
	AND maker NOT IN (
		SELECT maker
		FROM Product
		WHERE type = 'Laptop'
		)

-- Задание 9
-- Найдите производителей ПК с процессором не менее 450 Мгц. Вывести: Maker

SELECT DISTINCT maker
FROM Product
JOIN PC ON Product.model = PC.model
WHERE PC.speed >= 450

-- Задание 10
-- Найдите модели принтеров, имеющих самую высокую цену. Вывести: model, price

SELECT DISTINCT model, price
FROM Printer
WHERE price = (SELECT MAX(price)
FROM Printer)
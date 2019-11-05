CREATE DATABASE ComputerCompany

CREATE TABLE Product (
	maker VARCHAR(10) PRIMARY KEY
	,model VARCHAR(50)
	,type VARCHAR(50)
	)

CREATE TABLE PC (
	code INT PRIMARY KEY
	,model VARCHAR(50)
	,speed SMALLINT
	,ram SMALLINT
	,hd REAL
	,cd VARCHAR(10)
	,price MONEY
	)

CREATE TABLE Laptop (
	code INT PRIMARY KEY
	,model VARCHAR(50)
	,speed SMALLINT
	,ram SMALLINT
	,hd REAL
	,price MONEY
	,screen TINYINT
	)

CREATE TABLE Printer (
	code INT PRIMARY KEY
	,model VARCHAR(50)
	,color CHAR(1)
	,type VARCHAR(10)
	,price MONEY
	)

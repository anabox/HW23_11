-- 1.Вывести клиентов не из Germany, имена которых начинаются на букву A

SELECT * 
FROM Customers
WHERE 
	CustomerName like 'a%'
AND
    Country != 'Germany';

-- 2.Вывести данные о заказах клиентов 1, 2, 5 (проекция: номерзаказа, названиекомпании_перевозчика)

SELECT 
OrderID,
ShipperName
FROM Customers
INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID
INNER JOIN Shippers ON Orders.ShipperID = Shippers.ShipperID
WHERE Customers.CustomerID in ('1','2','5');

-- 3.Вывести данные о заказах клиентов не из France (проекция: номерзаказа, имяклиента, фамилия_менеджера)

SELECT 
Orders.OrderID,
Customers.CustomerName,
Employees.LastName AS EmployeeLastName
FROM Customers
INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID
INNER JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID
WHERE Customers.Country != 'France';

-- 4.Вывести ср/стоимость товаров от поставщика 4
SELECT 
AVG(price) AS Average_price
FROM Products
WHERE SupplierID = '4'
GROUP BY SupplierID;

-- 5.Вывести один самый дешевый товар от поставщика 1
SELECT 
MIN(price) AS Minimal_price
FROM Products
WHERE SupplierID = '1'
GROUP BY SupplierID;

-- 6.Зачем нужна проекция в БД. Дайте короткий ответ:

-- Проекция позволяет экономить ресурсы базы данных и выводить только те данные, которые необходимы.





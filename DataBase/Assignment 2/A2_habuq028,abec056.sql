/*
Authors: Hussein Abuqadous, Austin Bec
Date: 2022-03-03
Comp 2521-001: DataBase I 
Assignment 2
**********/

-- Query 1A
SELECT officecode, city, phone
FROM classicmodels.offices
WHERE country = "USA" OR country = "France";
 
-- Query 1B
SELECT officecode, city, phone
FROM classicmodels.offices
WHERE country IN ("USA", "France");
 
-- Query 2
SELECT  employeeNumber, reportsTo
FROM classicmodels.employees
WHERE   lastName LIKE 'B%' OR  firstName LIKE '%y';
 
-- Query 3
SELECT employeeNumber, lastname, firstname, jobTitle
FROM classicmodels.employees
WHERE officecode >= 2 AND reportsTo = 1143 OR  reportsTo = 1088;
 
-- Query 4
SELECT r.lastName AS "Last Name Managers", r.firstName AS "First Name Managers"
FROM classicmodels.employees m, classicmodels.employees r
WHERE m.reportsTo = r.employeeNumber
GROUP BY m.reportsTo;
 
-- Query 5
SELECT r.lastName AS "Last Name Managers", r.firstName AS "First Name Managers", count(*) AS numManaging
FROM classicmodels.employees m, classicmodels.employees r
WHERE r.employeeNumber = m.reportsTo
GROUP BY m.reportsTo;
 
-- Query 6
SELECT classicmodels.products.productCode AS "Product Code" , SUM(quantityOrdered) AS "Quantity Ordered"
FROM classicmodels.products , classicmodels.orderdetails
WHERE classicmodels.products.productCode = classicmodels.orderdetails.productCode
GROUP BY classicmodels.products.productCode
ORDER BY SUM(quantityOrdered) DESC ;
 
-- Query 7A
SELECT DISTINCT country
FROM classicmodels.customers;
 
--Query 7B
SELECT country
FROM classicmodels.customers
GROUP BY country;
 
-- Query 8
SELECT COUNT(customerNumber), Country
FROM classicmodels.customers
GROUP BY Country;
 
-- Query 9
SELECT m.reportsTo AS manager, count(*) AS numManaging
FROM classicmodels.employees m LEFT JOIN classicmodels.employees r
ON m.reportsTo = r.employeeNumber
GROUP BY m.reportsTo
ORDER BY m.reportsTo;
 
-- Query 10 a
SELECT classicmodels.customers.customerName AS "Customer Name",     classicmodels.employees.firstName AS "Sales Rep Frist Name",
    classicmodels.employees.lastName AS "Sales Rep Last Name" , classicmodels.orders.orderNumber AS "order #",
    classicmodels.products.productName AS "Product Name", classicmodels.orderdetails.quantityOrdered AS "Qunatity ordered",
    classicmodels.orderdetails.priceEach AS "price on each"
FROM classicmodels.customers,  classicmodels.employees, classicmodels.orderdetails, classicmodels.orders, classicmodels.products
WHERE classicmodels.orders.customerNumber = classicmodels.customers.customerNumber
AND classicmodels.orderdetails.orderNumber = classicmodels.orders.orderNumber
AND classicmodels.customers.salesRepEmployeeNumber =  classicmodels.employees.employeeNumber
AND classicmodels.products.productCode = classicmodels.orderdetails.productCode
AND classicmodels.customers.Country ='Canada';
 
-- Query 10 b
SELECT classicmodels.customers.customerName AS "Customer Name", classicmodels.employees.firstName AS "Sales Rep Frist Name",
    classicmodels.employees.lastName AS "Sales Rep Last Name" , classicmodels.orders.orderNumber AS "order #",
    classicmodels.products.productName AS "Product Name", classicmodels.orderdetails.quantityOrdered AS "Qunatity ordered",
    classicmodels.orderdetails.priceEach AS "price on each"
FROM classicmodels.employees JOIN classicmodels.customers
    ON classicmodels.customers.salesRepEmployeeNumber =  classicmodels.employees.employeeNumber
    JOIN classicmodels.orders  USING (customerNumber)
    JOIN classicmodels.orderdetails USING (orderNumber)
    JOIN classicmodels.products USING(productCode)  
WHERE classicmodels.customers.Country ='Canada';
 
-- Query 11
SELECT m.customerName, m.phone, COUNT(r.orderNumber) AS numOrders
FROM classicmodels.customers m, classicmodels.orders r
WHERE m.customerNumber = r.customerNumber
GROUP BY m.customerNumber
HAVING COUNT(r.orderNumber) > 10;
 
-- Query 12
SELECT buyPrice, priceEach, ROUND(priceEach - buyPrice) AS priceDifference, ROUND(((priceEach - buyPrice) / priceEach) * 100) AS profitMargin
FROM classicmodels.products m, classicmodels.orderdetails r, classicmodels.orders s
WHERE m.productCode = r.productCode
AND r.orderNumber = s.orderNumber
ORDER BY profitMargin DESC;
 
-- Query 13
SELECT m.country, r.status, count(*) AS stat
FROM classicmodels.customers m, classicmodels.orders r
WHERE m.customerNumber = r.customerNumber AND status IN('disputed', 'cancelled')
GROUP BY m.country, r.status;
-- SQL Server
SELECT CONCAT(cars.brand, " ", cars.model) AS car, cars.price
FROM registered_cars AS cars
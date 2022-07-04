USE Cars

SELECT TOP 10
       cars.brand, 
       cars.model,
       AVG(cars.price) AS avg_price
FROM registered_cars AS cars
GROUP BY cars.brand, cars.model
HAVING AVG(cars.price) BETWEEN 500000 AND 2000000
ORDER BY avg_price DESC;



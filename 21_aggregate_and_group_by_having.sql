-- SQLite
SELECT * 
FROM (
    SELECT cars.brand,
       cars.model,
       SUM(cars.price) as total_price, 
       MIN(cars.price) as min_price, 
       MAX(cars.price) as max_price, 
       AVG(cars.price) as average_price,
       COUNT(cars.price) as total_cars
    FROM registered_cars AS cars
    GROUP BY cars.brand, cars.model
    HAVING cars.price BETWEEN 5000 AND 20000
) as car_summary
WHERE car_summary.total_cars >= 10
ORDER BY car_summary.average_price DESC

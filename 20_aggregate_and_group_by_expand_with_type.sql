-- SQLite
SELECT cars.brand,
       cars.model,
       SUM(cars.price) as total_price, 
       MIN(cars.price) as min_price, 
       MAX(cars.price) as max_price, 
       AVG(cars.price) as average_price
FROM registered_cars AS cars
GROUP BY cars.brand, cars.model
ORDER BY average_price DESC
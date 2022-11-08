-- SQLite
SELECT 
       cars.seats,
       cars.color,
       AVG(cars.price) AS avg_price
FROM registered_cars AS cars
WHERE cars.seats = 2
GROUP BY 1,2
ORDER BY avg_price DESC
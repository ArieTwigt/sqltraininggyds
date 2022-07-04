-- SQLite
SELECT cars.brand || " " || cars.model as brand, 
       COUNT(cars.brand) as amount,
       ROUND(AVG(cars.price), 2) as average_price    
FROM registered_cars AS cars
GROUP BY cars.brand
ORDER BY amount DESC

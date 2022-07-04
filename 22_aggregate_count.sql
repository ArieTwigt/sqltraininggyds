-- SQLite
SELECT cars.brand as brand, 
       COUNT(cars.brand) as amount
FROM registered_cars AS cars
GROUP BY cars.brand
ORDER BY amount DESC

-- SQLite
SELECT DISTINCT cars.brand, cars.model
FROM registered_cars AS cars
WHERE cars.brand = 'AUDI'
ORDER BY cars.brand, cars.model

-- SQLite
SELECT COUNT(DISTINCT(cars.brand)) AS distinct_brands
FROM registered_cars AS cars
ORDER BY cars.brand

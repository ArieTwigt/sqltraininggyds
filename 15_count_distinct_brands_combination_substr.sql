-- SQLite
SELECT DISTINCT cars.brand,
       substr(cars.model,1, instr(cars.model, ' ')) as model
FROM registered_cars AS cars
WHERE cars.brand = 'AUDI'
ORDER BY cars.brand, cars.model

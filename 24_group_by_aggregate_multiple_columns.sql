-- SQLite
SELECT cars.brand as brand,
       cars.car_type as car_type,
       COUNT(cars.car_type) as amount,
       ROUND(AVG(cars.price), 2) as average_price
FROM registered_cars AS cars
GROUP BY 1,2
HAVING cars.brand in ('BMW', 'AUDI', 'MERCEDES-BENZ')
ORDER BY amount DESC, average_price DESC

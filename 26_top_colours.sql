-- SQLite
SELECT premium_german_cars.color,
       ROUND(AVG(premium_german_cars.average_price), 2) as average_price
FROM (
    SELECT cars.brand as brand,
       cars.model as model,
       cars.car_type as car_type,
       cars.color as color,
       COUNT(cars.car_type) as amount,
       ROUND(AVG(cars.price), 2) as average_price
     FROM registered_cars AS cars
     GROUP BY 1,2,3,4
     HAVING cars.brand in ('BMW', 'AUDI', 'MERCEDES-BENZ')
        AND cars.price BETWEEN 30000 and 100000
     ORDER BY amount DESC, average_price DESC
     ) as premium_german_cars

GROUP BY 1
ORDER BY 2 DESC

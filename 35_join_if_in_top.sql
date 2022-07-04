WITH top_50_cars AS (
       SELECT TOP 50
           cars.brand, 
           cars.model,
           AVG(cars.price) AS avg_price
       FROM registered_cars AS cars
       GROUP BY cars.brand, cars.model
       HAVING AVG(cars.price) BETWEEN 500000 AND 2000000
       ORDER BY avg_price DESC
)   


SELECT cars.plate, cars.brand, cars.model, cars.price, top_50_cars.avg_price
FROM registered_cars AS cars
LEFT OUTER JOIN top_50_cars 
 ON cars.brand = top_50_cars.brand 
 AND cars.model = top_50_cars.model
ORDER BY avg_price DESC

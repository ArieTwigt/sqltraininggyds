-- SQLite
SELECT brands.country, SUM(cars.price) total
FROM registered_cars AS cars
    JOIN car_brands AS brands
    ON cars.brand = brands.brand
GROUP BY 1
ORDER BY total DESC
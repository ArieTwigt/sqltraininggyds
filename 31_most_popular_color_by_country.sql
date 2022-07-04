-- SQLite
SELECT  brands.country,
        cars.color,
        COUNT(cars.color) as color_count
FROM registered_cars as cars
JOIN car_brands as brands
ON cars.brand = brands.brand
GROUP BY 1,2
HAVING brands.country = 'Italy'
ORDER BY 3 DESC

-- SQLite
WITH cars_tax AS (
    SELECT  brands.country,
            cars.tax / cars.price * 100 as tax_percentage
    FROM registered_cars as cars
    JOIN car_brands as brands
    ON cars.brand = brands.brand
)

SELECT country, ROUND(AVG(tax_percentage), 2) as avg_tax_pct
FROM cars_tax
GROUP BY 1
ORDER BY 2 DESC
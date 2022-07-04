-- SQLite
SELECT cars.brand || " " || cars.model AS car
       ,cars.price AS price
       ,cars.tax AS tax
       ,price - tax AS price_without_tax
       ,(price - tax) * 0.21 AS vat
FROM registered_cars AS cars
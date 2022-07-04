-- SQLite
SELECT cars_tax_pct.brand AS brand, 
       cars_tax_pct.model AS model,
       ROUND(cars_tax_pct.tax_percentage, 5) AS tax_percentage
    FROM
    (SELECT cars.brand AS brand, 
          cars.model AS model, 
          (cars.tax / cars.price * 100) AS tax_percentage
     FROM registered_cars AS cars) AS cars_tax_pct

     WHERE cars_tax_pct.tax_percentage <= 5
     ORDER BY cars_tax_pct.tax_percentage DESC, 
              cars_tax_pct.brand, 
              cars_tax_pct.model

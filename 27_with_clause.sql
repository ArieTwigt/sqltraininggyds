-- get an overview of the tax in percentage for each car_type
WITH average_tax_percentage AS (SELECT cars.car_type AS car_type, 
       cars.tax / cars.price * 100 AS tax_percentage
      FROM registered_cars AS cars) 


SELECT average_tax_percentage.car_type  AS car_type,
       AVG(tax_percentage) AS average_tax_percentage
       FROM average_tax_percentage 
       GROUP BY 1
       ORDER BY average_tax_percentage DESC

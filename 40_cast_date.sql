
SELECT cars.brand,
       cars.model,
       cars.price,
       cars.registration_date,
       CONVERT(datetime, 
              CONVERT(varchar(10), cars.registration_date)) 
            AS registration_date_time
FROM registered_cars AS cars
WHERE cars.brand = 'PORSCHE'
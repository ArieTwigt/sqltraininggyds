
SELECT cars.brand,
       cars.model,
       cars.price,
       cars.registration_date,
       DATENAME(WW, CONVERT(datetime, 
              CONVERT(varchar(10), cars.registration_date)))   
            AS registration_week,
       DATENAME(M, CONVERT(datetime, 
              CONVERT(varchar(10), cars.registration_date)))   
            AS registration_month,
       DATENAME(W, CONVERT(datetime, 
              CONVERT(varchar(10), cars.registration_date)))   
            AS registration_weekday
FROM registered_cars AS cars
WHERE cars.brand = 'PORSCHE'
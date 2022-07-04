WITH cars_large_electric AS (
  SELECT cars_motor.plate,
         cars_motor.net_power_fuel,
         cars_motor.net_power_electric
  FROM cars_motor as cars_motor
),
cars_large_electric_grouped AS (
  SELECT cars_large_electric.plate,
         SUM(cars_large_electric.net_power_fuel) AS power_fuel,
         SUM(cars_large_electric.net_power_electric) AS power_electric
  FROM cars_large_electric
  GROUP BY cars_large_electric.plate
  HAVING SUM(cars_large_electric.net_power_electric) > 0
), cars_overview_electric_pct AS (
    SELECT cars.plate,
       cars.brand,
       cars.model,
       cars_large_electric_grouped.power_fuel,
       cars_large_electric_grouped.power_electric,
         ROUND(cars_large_electric_grouped.power_electric / 
          (cars_large_electric_grouped.power_fuel + cars_large_electric_grouped.power_electric) * 100, 2)
          AS power_pct_electric
    FROM registered_cars AS cars
     JOIN cars_large_electric_grouped AS cars_large_electric_grouped
     ON cars.plate = cars_large_electric_grouped.plate
)

SELECT  cars_overview_electric_pct.plate,
        cars_overview_electric_pct.brand,
        cars_overview_electric_pct.model,
        cars_overview_electric_pct.power_fuel,
        cars_overview_electric_pct.power_electric,
        CASE WHEN power_pct_electric >= 20 THEN 'large' ELSE 
            CASE WHEN power_pct_electric BETWEEN 10 AND 20 THEN 'medium' ELSE
                CASE WHEN power_pct_electric < 10 THEN 'small' END END END AS power_pct_electric
FROM cars_overview_electric_pct
ORDER BY cars_overview_electric_pct.brand, cars_overview_electric_pct.model
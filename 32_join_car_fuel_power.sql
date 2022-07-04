-- SQLite
SELECT cars.brand, cars.model, motor.net_power_fuel
FROM registered_cars AS cars
  JOIN cars_motor AS motor
  ON cars.plate = motor.plate
WHERE cars.brand = 'VOLVO' 
  AND cars.model = 'XC40'
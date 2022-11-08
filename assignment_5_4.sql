SELECT cars.brand,
       cars.model,
       cars_motor.net_power_fuel,
       
FROM registered_cars AS cars
JOIN cars_motor
  ON cars_motor.plate = cars.plate
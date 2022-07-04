USE Cars

CREATE TABLE cars_motor (
  plate VARCHAR(255),
  fuel_type_number INTEGER,
  fuel_type_description VARCHAR(255),
  fuel_consumption_combined FLOAT,
  co2_emission_combined FLOAT,
  net_power_fuel FLOAT,
  net_power_electric FLOAT
);

GO
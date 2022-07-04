USE Cars

CREATE TABLE registered_cars (
  plate VARCHAR(255) NOT NULL,
  brand VARCHAR(255),
  model VARCHAR(255),
  registration_date INTEGER,
  tax FLOAT,
  car_type VARCHAR(255),
  seats INTEGER,
  color VARCHAR(255),
  price FLOAT,
  PRIMARY KEY (plate)
);

GO
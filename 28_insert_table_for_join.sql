-- SQLite
USE Cars

CREATE TABLE brands (
  brand VARCHAR(255),
  country INTEGER,
  car_type VARCHAR(255),
  seats INTEGER,
  color VARCHAR(255),
  price FLOAT,
  PRIMARY KEY (plate)
);

GO
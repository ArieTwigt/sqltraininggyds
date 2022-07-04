-- SQLite
select cars.brand || " " || cars.model AS car, cars.price
from registered_cars as cars
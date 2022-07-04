/* Bulk insert from the csv file data/cars_data_20220101.csv to the registered_cars table in the Cars database. */
USE Cars

BULK INSERT registered_cars 
FROM 'C:/arie/projects/sqltraininggyds/data/cars_data_20220101.csv'
WITH
(
  FIELDTERMINATOR = ';',
  ROWTERMINATOR = '\n',
  ROWS_PER_BATCH = 10000, 
  FIRSTROW = 2,
  TABLOCK
)

GO
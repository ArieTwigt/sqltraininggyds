#%%
import pyodbc
import pandas as pd
from dotenv import load_dotenv
import urllib.parse
import os
from tqdm import tqdm

load_dotenv()

DB_USER = os.getenv("DB_USER")
DB_PASS = os.getenv("DB_PASS")

# %%
column_names = ['plate', 'brand', 'model', 'registration_date', 'tax', 'car_type', 'seats', 'color', 'price']
cars_df = pd.read_csv("data/cars_data_20220101.csv", sep = ";", names=column_names,  header=None, skiprows=1)


# %%
server = '146.190.20.45'
database = 'Cars' 
username = DB_USER
password = DB_PASS


# %%
cnxn = pyodbc.connect('DRIVER={ODBC Driver 17 for SQL Server};SERVER='+server+';DATABASE='+database+';UID='+username+';PWD='+ password)

#%%
cursor = cnxn.cursor()

#%%
cars_df = cars_df.dropna(axis=0, how='any')

#%%


# %%
for index, row in tqdm(cars_df.iterrows(), total=cars_df.shape[0]):
    cursor.execute("INSERT INTO registered_cars (plate, brand, model, registration_date, tax, car_type, seats, color, price) values(?,?,?,?,?,?,?,?,?)", 
                    row.plate, row.brand, row.model, row.registration_date, row.tax, row.car_type, row.seats, row.color, row.price)


#%%
cnxn.commit()
cursor.close()
# %%

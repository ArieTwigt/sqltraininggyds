#%%
import pyodbc
import pandas as pd
from dotenv import load_dotenv
import os
from tqdm import tqdm

load_dotenv()

DB_USER = os.getenv("DB_USER")
DB_PASS = os.getenv("DB_PASS")

# %%
cars_motor_df = pd.read_csv("data/cars_motor_filtered.csv", sep = ";")


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
cars_motor_df = cars_motor_df.fillna(0.0)

#%%


# %%
for index, row in tqdm(cars_motor_df.iterrows(), total=cars_motor_df.shape[0]):
    cursor.execute("INSERT INTO cars_motor (plate,fuel_type_number,fuel_type_description,fuel_consumption_combined,co2_emission_combined,net_power_fuel,net_power_electric) values(?,?,?,?,?,?,?)", 
                    row.plate, row.fuel_type_number, row.fuel_type_description, row.fuel_consumption_combined, row.co2_emission_combined, row.net_power_fuel, row.net_power_electric)


#%%
cnxn.commit()
cursor.close()
# %%

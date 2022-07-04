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
column_names = ['brand', 'country']
cars_df = pd.read_csv("data/cars_brands.csv", sep = ";", names=column_names,  header=None, skiprows=1)
cars_df['brand'] = cars_df['brand'].str.upper()

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
    cursor.execute("INSERT INTO car_brands (brand, country) values(?,?)", 
                    row.brand, row.country)


#%%
cnxn.commit()
cursor.close()
# %%

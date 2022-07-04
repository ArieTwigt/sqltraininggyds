#%%
import pandas as pd
import sqlite3

#%% connect to sqlite database
con = sqlite3.connect('data/Cars.db')

# %%
column_names = ['brand', 'country']
cars_df = pd.read_csv("data/cars_brands.csv", sep = ";", names=column_names,  header=None, skiprows=1)
cars_df['brand'] =  cars_df['brand'].str.upper()

# %%
cars_df.head()
# %%
cars_df.to_sql("car_brands", index=False, if_exists="replace", con=con)
# %%

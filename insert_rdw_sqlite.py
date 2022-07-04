#%%
import pandas as pd
import sqlite3

#%% connect to sqlite database
con = sqlite3.connect('data/Cars.db')

# %%
column_names = ['plate', 'brand', 'model', 'registration_date', 'tax', 'car_type', 'seats', 'color', 'price']
cars_df = pd.read_csv("data/cars_data_20220101.csv", sep = ";", names=column_names,  header=None, skiprows=1)
cars_df = cars_df.dropna(axis=0, how='any')

# %%
cars_df.head()
# %%
cars_df.to_sql("registered_cars", index=False, if_exists="replace", con=con)
# %%

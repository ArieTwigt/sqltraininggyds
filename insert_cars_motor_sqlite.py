#%%
import pandas as pd
import sqlite3

#%% connect to sqlite database
con = sqlite3.connect('data/Cars.db')

# %%
cars_motor_df = pd.read_csv("data/cars_motor_filtered.csv", sep = ";")


# %%
cars_motor_df.head()
# %%
cars_motor_df.to_sql("cars_motor", index=False, if_exists="replace", con=con)
# %%

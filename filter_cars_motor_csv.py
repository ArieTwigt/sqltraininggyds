#%%
import pandas as pd


#%%
column_names = ['plate', 'brand', 'model', 'registration_date', 'tax', 'car_type', 'seats', 'color', 'price']
cars_df = pd.read_csv("data/cars_data_20220101.csv", sep = ";", names=column_names,  header=None, skiprows=1)
cars_df = cars_df.dropna(axis=0, how='any')

#%%
cars_motor_df = pd.read_csv("data/cars_motor.csv")


# %%
selected_plates = list(cars_df.plate.unique())

#%%
cars_motor_df_filtered = cars_motor_df[cars_motor_df.Kenteken.isin(selected_plates)]

#%% select only the columns we need
columns = ['Kenteken', 'Brandstof volgnummer', 'Brandstof omschrijving', 
           'Brandstofverbruik gecombineerd', 'CO2 uitstoot gecombineerd', 
           'Nettomaximumvermogen', 'Netto max vermogen elektrisch']

cars_motor_df_filtered = cars_motor_df_filtered[columns]

#%% rename columns
cars_motor_df_filtered = cars_motor_df_filtered.rename({'Kenteken': 'plate', 
                               'Brandstof volgnummer': 'fuel_type_number', 
                               'Brandstof omschrijving': 'fuel_type_description',
                               'Brandstofverbruik gecombineerd': 'fuel_consumption_combined',
                               'CO2 uitstoot gecombineerd': 'co2_emission_combined',
                               'Nettomaximumvermogen': 'net_power_fuel',
                               'Netto max vermogen elektrisch': 'net_power_electric'}, 
                              inplace=False, axis=1)

# %%
cars_motor_df_filtered.to_csv("data/cars_motor_filtered.csv", index=False, sep=";")

# %%

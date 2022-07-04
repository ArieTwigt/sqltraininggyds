
SELECT 
       cars_power.brand,
       cars_power.model,
       cars_power.power_pct_electric,
       AVG(cars_power.power_electric) AS avg_power_pct_electric,
       COUNT(cars_power.power_pct_electric) AS amount
FROM cars_overview_electric_pct AS cars_power
GROUP BY cars_power.brand, cars_power.model, cars_power.power_pct_electric
ORDER BY avg_power_pct_electric DESC
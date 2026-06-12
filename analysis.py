import pandas as pd

t4 = pd.read_csv("table4_battery_management_totals.csv")
t6 = pd.read_csv("table6_dropoff_programs_by_service_type.csv")
t7 = pd.read_csv("table7_dropoff_access_by_battery_type.csv")
t8 = pd.read_csv("table8_access_by_dropoff_setting.csv")
t11 = pd.read_csv("table11_retailer_acceptance_clean.csv")

print(t4.to_string(index=False))
print(t6.to_string(index=False))
print(t7.to_string(index=False))
print(t8.to_string(index=False))
print(t11.to_string(index=False))
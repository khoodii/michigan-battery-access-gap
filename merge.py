import pandas as pd

# Load cleaned census data
census = pd.read_csv("census_income_clean.csv")

# Load drop-off access by setting (has the most detail)
access = pd.read_csv("table8_access_by_dropoff_setting.csv")

# Preview both before merging
print("CENSUS DATA:")
print(census.head())
print(f"\nShape: {census.shape}")

print("\nACCESS DATA:")
print(access.head())
print(f"\nShape: {access.shape}")

print("\n✅ Preview complete.")
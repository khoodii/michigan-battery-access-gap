import pandas as pd

df = pd.read_csv("battery_locations_raw.csv")

print(f"Total locations: {len(df)}")
print(f"\nTop business names:")
print(df["name"].str.split("#").str[0].str.strip().value_counts().head(15))
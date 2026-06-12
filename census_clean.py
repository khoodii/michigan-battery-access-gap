import pandas as pd

# Load the census file, skip the first row (cryptic codes), use row 2 as header
df = pd.read_csv("ACSST5Y2023.S1901-Data.csv", header=1)

# Keep only county name and median household income
df = df[["Geographic Area Name", "Estimate!!Households!!Median income (dollars)"]]

# Rename columns to something clean
df.columns = ["County", "Median_Household_Income"]

# Replace Census placeholder values with nulls
df["Median_Household_Income"] = df["Median_Household_Income"].replace({"(X)": None, "N": None, "-": None})

# Strip "County, Michigan" from county names
df["County"] = df["County"].str.replace(", Michigan", "", regex=False)
df["County"] = df["County"].str.replace(" County", "", regex=False)

# Convert income column to numeric
df["Median_Household_Income"] = pd.to_numeric(df["Median_Household_Income"], errors="coerce")

# Check the result
print(df.head(10))
print(f"\nShape: {df.shape}")
print(f"\nNull counts:\n{df.isnull().sum()}")

# Save the cleaned file
df.to_csv("census_income_clean.csv", index=False)
print("\n✅ Census data cleaned and saved.")
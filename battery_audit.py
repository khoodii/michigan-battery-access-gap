import pandas as pd
import os

CSV_FOLDER = "."

csv_files = [f for f in os.listdir(CSV_FOLDER) if f.endswith(".csv")]

for filename in csv_files:
    path = os.path.join(CSV_FOLDER, filename)
    df = pd.read_csv(path)

    print(f"\n{'='*50}")
    print(f"FILE: {filename}")
    print(f"{'='*50}")

    print(f"Rows: {df.shape[0]} | Columns: {df.shape[1]}")

    print("\n--- Column Types ---")
    print(df.dtypes)

    print("\n--- Null Counts ---")
    print(df.isnull().sum())

    for col in df.select_dtypes(include="object").columns:
        has_spaces = df[col].dropna().apply(lambda x: x != x.strip()).any()
        if has_spaces:
            print(f"\n⚠️  Trailing/leading spaces found in: '{col}'")

        unique_vals = df[col].dropna().unique()
        lowered = [v.strip().lower() for v in unique_vals]
        if len(lowered) != len(set(lowered)):
            print(f"⚠️  Inconsistent capitalization in: '{col}'")
            print(f"    Values: {unique_vals}")

print("\n✅ Audit complete.")
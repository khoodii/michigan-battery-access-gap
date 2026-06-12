import pandas as pd
import urllib.request

# ── 1. Load data ──────────────────────────────────────────────────────────────
locations = pd.read_csv("/mnt/user-data/uploads/battery_locations_raw.csv")
census    = pd.read_csv("/mnt/user-data/uploads/census_income_clean.csv")

# Drop state-level Michigan row from census (keep only the 83 counties)
census = census[census["County"] != "Michigan"].copy()

print(f"Loaded {len(locations)} battery locations and {len(census)} counties.\n")

# ── 2. Build zip → county crosswalk (Michigan only) ───────────────────────────
url = "https://raw.githubusercontent.com/scpike/us-state-county-zip/master/geo-data.csv"
crosswalk = pd.read_csv(url, dtype={"zipcode": str})
mi_zips = crosswalk[crosswalk["state_abbr"] == "MI"][["zipcode", "county"]].drop_duplicates("zipcode")
print(f"Loaded {len(mi_zips)} Michigan zip codes from crosswalk.\n")

# ── 3. Clean zip codes (strip extended format e.g. 48051-2313 → 48051) ────────
locations["zip_clean"] = locations["zip"].astype(str).str.split("-").str[0].str.zfill(5)

# ── 4. Map locations to county ────────────────────────────────────────────────
locations = locations.merge(mi_zips, left_on="zip_clean", right_on="zipcode", how="left")
locations.rename(columns={"county": "County"}, inplace=True)

# Report any zips that didn't resolve
unmatched = locations[locations["County"].isna()]
if len(unmatched) > 0:
    print(f"⚠️  {len(unmatched)} locations could not be mapped to a county:")
    print(unmatched[["name", "city", "zip"]].to_string(index=False))
else:
    print("✅  All locations successfully mapped to a county.\n")

# ── 5. Aggregate drop-off counts per county ───────────────────────────────────
county_counts = (
    locations.groupby("County")
    .size()
    .reset_index(name="dropoff_count")
)

# ── 6. Merge with census income data ─────────────────────────────────────────
# Left join from census so every county appears, even those with zero sites
merged = census.merge(county_counts, on="County", how="left")
merged["dropoff_count"] = merged["dropoff_count"].fillna(0).astype(int)

# ── 7. Add derived columns ────────────────────────────────────────────────────
merged = merged.sort_values("Median_Household_Income").reset_index(drop=True)

merged["income_quartile"] = pd.qcut(
    merged["Median_Household_Income"],
    q=4,
    labels=["Q1_lowest", "Q2", "Q3", "Q4_highest"]
)

# ── 8. Save output ────────────────────────────────────────────────────────────
output_path = "/mnt/user-data/outputs/county_access_merged.csv"
merged.to_csv(output_path, index=False)
print(f"✅  Saved merged data to {output_path}\n")

# ── 9. Summary report ─────────────────────────────────────────────────────────
print("=" * 55)
print("SUMMARY")
print("=" * 55)
print(f"Total counties in census:          {len(census)}")
print(f"Counties WITH drop-off sites:      {(merged['dropoff_count'] > 0).sum()}")
print(f"Counties with ZERO drop-off sites: {(merged['dropoff_count'] == 0).sum()}")
print(f"Total drop-off locations mapped:   {merged['dropoff_count'].sum()}")

print("\n── Bottom 10 counties by income ──")
bottom10 = merged.head(10)[["County", "Median_Household_Income", "dropoff_count", "income_quartile"]]
print(bottom10.to_string(index=False))

print("\n── Drop-off sites by income quartile ──")
quartile_summary = (
    merged.groupby("income_quartile", observed=True)["dropoff_count"]
    .agg(avg_sites="mean", total_sites="sum", num_counties="count")
)
print(quartile_summary.to_string())

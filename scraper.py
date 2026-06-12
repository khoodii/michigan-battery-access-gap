import requests
import pandas as pd
import time

API_BASE = "https://apim-techservices-integrations-prod-us.azure-api.net"
API_KEY = "ee294a0c63854ef0afcce0f8466dd583"
HEADERS = {
    "Ocp-Apim-Subscription-Key": API_KEY,
    "Content-Type": "application/json"
}

MI_ZIPS = [
    "48001", "48014", "48026", "48035", "48045", "48060", "48066", "48075",
    "48084", "48094", "48103", "48111", "48120", "48130", "48138", "48146",
    "48154", "48161", "48168", "48176", "48183", "48190", "48197", "48201",
    "48210", "48219", "48228", "48237", "48301", "48310", "48320", "48329",
    "48340", "48348", "48356", "48362", "48370", "48380", "48390", "48401",
    "48412", "48420", "48428", "48436", "48442", "48450", "48457", "48462",
    "48470", "48476", "48503", "48509", "48529", "48601", "48610", "48618",
    "48625", "48632", "48640", "48647", "48655", "48661", "48701", "48706",
    "48720", "48728", "48735", "48742", "48750", "48757", "48763", "48770",
    "48801", "48808", "48815", "48820", "48827", "48835", "48840", "48848",
    "48855", "48862", "48867", "48875", "48882", "48890", "48895", "48906",
    "48911", "48917", "49001", "49010", "49017", "49024", "49031", "49038",
    "49045", "49052", "49058", "49065", "49071", "49078", "49085", "49092",
    "49098", "49103", "49111", "49120", "49127", "49201", "49220", "49228",
    "49235", "49242", "49250", "49257", "49264", "49271", "49279", "49286",
    "49301", "49309", "49316", "49323", "49330", "49337", "49344", "49351",
    "49401", "49408", "49415", "49421", "49428", "49435", "49441", "49448",
    "49455", "49461", "49503", "49508", "49512", "49519", "49525", "49534",
    "49546", "49601", "49610", "49618", "49625", "49631", "49638", "49645",
    "49651", "49659", "49665", "49670", "49676", "49683", "49690", "49696",
    "49701", "49709", "49715", "49720", "49727", "49733", "49739", "49745",
    "49751", "49756", "49762", "49768", "49775", "49781", "49788", "49795",
    "49801", "49806", "49812", "49819", "49825", "49831", "49837", "49841",
    "49847", "49853", "49858", "49864", "49868", "49874", "49879", "49885",
    "49891", "49896", "49901", "49908", "49915", "49920", "49927", "49934",
    "49942", "49948", "49953", "49959", "49965", "49971"
]

locations = []
seen = set()

print(f"Starting scrape of {len(MI_ZIPS)} Michigan zip codes...")

for i, zipcode in enumerate(MI_ZIPS):
    try:
        geo_url = f"{API_BASE}/Locator/google/geocode/{zipcode}"
        geo_response = requests.get(geo_url, headers=HEADERS, timeout=10)

        if geo_response.status_code != 200:
            print(f"Geocode failed for {zipcode}: {geo_response.status_code}")
            continue

        geo_data = geo_response.json()
        lat = geo_data.get("lat") or geo_data.get("latitude")
        lon = geo_data.get("lng") or geo_data.get("lon") or geo_data.get("longitude")

        if not lat or not lon:
            print(f"No coordinates for {zipcode}")
            continue

        loc_url = f"{API_BASE}/Locator/locations_within_range/{lat}/{lon}/30000"
        loc_response = requests.get(loc_url, headers=HEADERS, timeout=10)

        if loc_response.status_code != 200:
            print(f"Location search failed for {zipcode}: {loc_response.status_code}")
            continue

        results = loc_response.json()

        for loc in results:
            acct = loc.get("accountNumber")
            if acct and acct not in seen:
                seen.add(acct)
                locations.append({
                    "name": loc.get("businessName", ""),
                    "address": loc.get("addressStreet", ""),
                    "city": loc.get("addressCity", ""),
                    "state": loc.get("addressStateProvince", ""),
                    "zip": loc.get("addressZIP", ""),
                    "accepted_materials": loc.get("acceptedMaterials", ""),
                    "account_number": acct
                })

        if i % 20 == 0:
            print(f"Progress: {i}/{len(MI_ZIPS)} zips | Unique locations: {len(locations)}")

        time.sleep(0.3)

    except Exception as e:
        print(f"Error on zip {zipcode}: {e}")
        continue

df = pd.DataFrame(locations)
df = df[df["state"].str.upper() == "MI"] if len(df) > 0 else df
df.to_csv("battery_locations_raw.csv", index=False)
print(f"\n✅ Done! {len(df)} unique Michigan locations saved to battery_locations_raw.csv")
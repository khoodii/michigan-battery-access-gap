import requests

API_BASE = "https://apim-techservices-integrations-prod-us.azure-api.net"
API_KEY = "ee294a0c63854ef0afcce0f8466dd583"
HEADERS = {
    "Ocp-Apim-Subscription-Key": API_KEY,
    "Content-Type": "application/json"
}

# Geocode a zip
geo = requests.get(f"{API_BASE}/Locator/google/geocode/48301", headers=HEADERS, timeout=10)
geo_data = geo.json()
print("GEO RESPONSE:", geo_data)

lat = geo_data.get("lat") or geo_data.get("latitude")
lon = geo_data.get("lng") or geo_data.get("lon") or geo_data.get("longitude")

# Get locations
loc = requests.get(f"{API_BASE}/Locator/locations_within_range/{lat}/{lon}/30000", headers=HEADERS, timeout=10)
results = loc.json()

# Print first location raw
print("\nFIRST LOCATION RAW:")
print(results[0])
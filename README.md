# Michigan Battery Recycling Access Gap

A county-level analysis of battery drop-off infrastructure across all 83 Michigan counties, identifying where access fails and proposing a self-funding model to close the gap.

## The Finding in One Line

38 of 83 Michigan counties have zero battery drop-off sites, and the gap tracks income, not demand. The lowest income quartile averages 0.29 sites per county. The highest averages 6.14. That is a 21-to-1 disparity built around retail footprints rather than community need.

## Why This Matters

Lithium battery fires at waste facilities hit an all-time high in 2025, with 448 incidents across the US and Canada. Michigan is already seeing it: a battery fire in a Troy trash truck in May 2025, monthly fires reported at Grand Rapids recycling facilities. Awareness is not the bottleneck. 95% of residents report at least one barrier to recycling, and in 38 counties the barrier is that there is nowhere to go.

## What I Built

- **Original dataset.** The Battery Network publishes a location map but no downloadable data. I used browser developer tools to identify the API endpoints behind the map, then wrote a Python script that queried those endpoints across 206 Michigan zip codes, collected every unique location, and deduplicated. Result: 214 drop-off locations with retailer name, address, accepted materials, and account number. Cross-validated against NextCycle statewide totals at ~90% coverage.
- **County-level access map.** Merged the location data with 2023 ACS 5-Year Census income and population estimates for all 83 counties, classified rurality using USDA Rural-Urban Continuum Codes, and computed sites per county and sites per 100,000 residents.
- **Audit of the existing state report.** Extracted and cleaned Tables 5 through 11 from the 2025 NextCycle Michigan Battery Gap Analysis, then documented where its survey methodology breaks down (an 18 million battery estimate against a real range of 208 to 416 million, recall bias, a rural-heavy 776-respondent sample, self-reporting overstating participation).
- **Power BI dashboard.** Interactive county map, income-vs-access scatter, and quartile breakdowns.

## Key Results

| Income Quartile | Avg Sites Per County | Avg Sites Per 100k | Desert Counties |
| --- | --- | --- | --- |
| Q1 Lowest | 0.29 | 0.86 | 16 of 21 |
| Q2 | 2.10 | 1.09 | 14 of 21 |
| Q3 | 1.60 | 2.16 | 5 of 20 |
| Q4 Highest | 6.14 | 3.00 | 3 of 21 |

**The Wayne County trap.** Wayne County has 23 sites, more than any other county, which looks like strong access. With 1.7 million residents that is 1.33 sites per 100,000, one of the lowest per capita rates in its quartile. Raw site count is a misleading metric without population context. Adjusted for population, Wayne residents are as underserved as the rural counties flagged as priority targets.

**Rural is worst.** 16 of 18 rural counties qualify as battery deserts, averaging 0.76 sites per 100,000, less than a quarter of the urban and metro rate.

**The system can't self-correct.** The drop-off network is retailer-dependent and voluntary, concentrated in commercial corridors that serve middle and upper income areas. The stores in every community (Walmart, Target, Meijer, Menards) accept no batteries. Alkaline, the most common type disposed, is rejected by almost every major retailer.

## The Recommendation

Place collection sites at food pantries and libraries in the 38 desert counties. These are trusted community anchors already visited by the most underserved residents, so recycling embeds into existing routines instead of requiring a separate trip. The Battery Network provides collection boxes and recycling logistics at no cost to host sites, so the barrier is coordination, not equipment.

**A self-funding model.** Borrowing the principle behind LifeStraw's Buy One Give One, each Q4 site contributes a proportional amount to fund a desert county site. At $500 per Q4 site across 129 active Q4 locations, the program generates $64,500 a year. At $1,000 per desert site, that covers all 38 target counties with a $26,500 surplus. No legislation, government funding, or new infrastructure required.

## Data Sources

- Battery Network internal API (214 scraped drop-off locations, original dataset)
- 2023 ACS 5-Year Estimates, US Census Bureau
- USDA Rural-Urban Continuum Codes (2023)
- 2025 NextCycle Michigan Battery Gap Analysis, published by EGLE

## Stack

Python (data collection and cleaning), PostgreSQL (county and location tables), Power BI (dashboard).

## Recommended Phase 2

- **Spatial cluster detection** (SaTScan / Moran's I) to identify statistically significant access deserts rather than eyeballed scatter clusters.
- **Composite access vulnerability score** weighting distance, income, rurality, and disposal volume, more precise than sites per 100k alone.
- **Formalized cross-subsidy framework** with documented inputs, math, and decision rules others can adopt.

---

*Full data files, scripts, SQL queries, and the Power BI dashboard are available on request.*

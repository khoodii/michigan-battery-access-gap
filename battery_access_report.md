# Michigan Battery Recycling Access Gap
## Findings & Site Placement Recommendations
**Prepared for:** [Stakeholder Name]
**Date:** 2025
**Analyst:** [Your Name]

---

## The Problem Is Already Here

In May 2025, a lithium battery caused a fire in a Troy trash truck. One month later, the Grand Rapids Fire Department reported battery fires occurring monthly at their recycling and waste facilities. These are not isolated incidents — 2025 saw an all-time high of 448 waste facility fires at facilities across the US and Canada.

The problem is not awareness. Michigan residents largely know batteries require special handling. The problem is access. When 38 of 83 Michigan counties have zero battery drop-off infrastructure, improper disposal is not a behavior problem — it is a structural one.

---

## What the Existing Data Gets Wrong

The 2025 NextCycle Michigan Battery Gap Analysis provides the most comprehensive statewide picture available, but its survey-based methodology has significant limitations worth noting.

The survey estimated 18 million batteries disposed annually in Michigan. Waste characterization studies from comparable states put the real number between 208 million and 416 million — a gap the report attributes to recall bias. Residents don't remember every battery they threw away, and batteries embedded in products often go uncounted entirely.

The survey sample was 776 respondents. Of these, 35% came from rural counties — the same counties with the highest rates of improper disposal and the least access to alternatives. Self-reported recycling behavior also overstates actual recycling, since a resident reporting they "brought batteries to a drop-off" may not have used a correct or operational site.

The survey data is a starting point, not a measurement. Our county-level infrastructure analysis tells the more reliable story.

---

## What the Data Actually Shows

Using location data sourced directly from the Battery Network's internal API — original data not available in any published report — and merged with 2023 ACS Census income data for all 83 Michigan counties, the access gap is quantifiable and consistent.

**The headline finding:**

Counties in the lowest income quartile average 0.29 drop-off sites. Counties in the highest income quartile average 6.14. That is a 21-to-1 disparity driven entirely by where the infrastructure was built — not by demand.

**The breakdown:**

| Income Quartile | Avg Sites Per County | Avg Sites Per 100k Residents | Desert Counties |
|---|---|---|---|
| Q1 Lowest | 0.29 | 0.86 | 16 of 21 |
| Q2 | 2.10 | 1.09 | 14 of 21 |
| Q3 | 1.60 | 2.16 | 5 of 20 |
| Q4 Highest | 6.14 | 3.00 | 3 of 21 |

38 counties have zero drop-off sites. Of these, 30 fall in the bottom two income quartiles.

**Rural counties are the hardest hit:**

16 of 18 rural Michigan counties are battery deserts. Rural counties average 0.76 sites per 100,000 residents — less than a quarter of the rate in urban and metro areas.

---

## The Wayne County Case

Wayne County appears to be an outlier — with 23 drop-off sites, it has more than any other county in Michigan. At first glance this suggests Detroit has strong access.

It does not. Wayne County has 1.7 million residents. 23 sites translates to 1.33 sites per 100,000 people — one of the lowest per capita rates in its income quartile and well below the statewide average.

The raw count is misleading. When adjusted for population, Wayne County residents are as underserved as the rural counties on the target list. This is not an anomaly in the data — it is a confirmation of the thesis. The current system is built around retail footprints, not population need.

---

## Why the Current System Cannot Fix This

The existing battery drop-off network is retailer-dependent and voluntary. The stores that accept batteries — Home Depot, Lowe's, Staples, Best Buy — cluster in high-traffic commercial corridors serving middle and upper income areas. They are not in the communities that need them.

More critically: the most common battery type in Michigan is alkaline, and alkaline batteries are rejected by almost every major retailer. The infrastructure that does exist largely cannot accept the battery most people are throwing away.

The stores present in every community — Walmart, Target, Meijer, Menards — accept nothing. The stores that accept everything — Battery Plus, Battery Giant — have 8 to 10 locations statewide.

The NextCycle report confirms this directly: fewer than one-third of Michigan residents have access to a permanent government-operated drop-off site, and private retail programs are voluntary, inconsistent, and can end without notice. Funding service providers have stated plainly that expansion is not possible under current funding structures without dedicated mechanisms such as EPR legislation.

While legislative solutions are being discussed, the infrastructure gap exists today and requires action that does not depend on a policy timeline.

---

## The Resident Side

95% of Michigan residents face at least one barrier to battery recycling. The most commonly cited barriers are not apathy — they are structural: not knowing where to take batteries, confusion over which types are accepted, and limited local options.

54% of residents said more convenient access would increase their participation.

The residents in the 38 battery desert counties are not choosing to throw batteries in the trash. They have nowhere else to put them.

---

## Recommendation: Place Collection Sites at Food Pantries and Libraries

Food pantries and libraries are the institutions that exist in battery desert counties when retailers do not. They are trusted, accessible, and already visited by the residents most underserved by the current system.

Placing battery collection sites at these locations does not require residents to change their behavior or make a special trip. It embeds recycling access into existing routines. It also directly targets the communities where the access gap is most severe — the 38 counties with zero infrastructure, concentrated in the lowest two income quartiles and in rural Michigan.

The 38 target counties are documented in the accompanying data. Priority placement should begin with Q1 counties that are also classified as rural — these are communities with the lowest median incomes, zero drop-off access, and no nearby alternatives.

---

## Funding the Expansion: A Cross-Subsidy Model

The current system has no funding mechanism for desert county placement. One viable model draws from LifeStraw's Buy One Give One approach: for every collection site placed in a high-income Q4 county, a corresponding site is funded in a desert county.

Q4 counties already have the commercial infrastructure and resident demand to sustain collection programs. Directing a portion of program revenue or sponsorship from those sites toward desert county placement creates a self-sustaining pipeline that does not rely on EPR legislation or government funding.

The financial model for this approach — including estimated site setup and maintenance costs, and the number of Q4 sponsors required to cover all 38 desert counties — is in development and will be included in the next phase of this analysis.

---

## Data Sources & Methodology

**Battery location data:** Sourced directly from the Battery Network's internal API. The Battery Network website provides a map of drop-off locations but no downloadable dataset. Using browser developer tools, the API endpoints behind the site were identified. A Python script was written to query those endpoints across 206 Michigan zip codes, collect all unique locations, and deduplicate. The result — 214 locations with retailer name, address, accepted materials, and account number — is original data not available in any published report. Retailer counts cross-validated against NextCycle statewide totals (63 Home Depots vs. reported 70, 43 Lowe's vs. reported 45), confirming approximately 90% coverage.

**Income data:** 2023 ACS 5-Year Estimates for all 83 Michigan counties, sourced from the US Census Bureau.

**Rural classification:** USDA Rural-Urban Continuum Codes (2023), applied at the county level.

**Population data:** 2023 ACS 5-Year Estimates, used to calculate sites per 100,000 residents.

**Report data:** 2025 NextCycle Michigan Battery Gap Analysis, published by EGLE. Tables 5–11 were extracted, cleaned, and audited prior to analysis.

All data, scripts, SQL queries, and Power BI dashboard files are available for review.

---

## Summary of Key Findings

- 38 of 83 Michigan counties have zero battery drop-off sites
- The lowest income quartile averages 0.29 sites per county vs. 6.14 in the highest — a 21x gap
- 16 of 18 rural counties are battery deserts
- Wayne County's 23 raw sites equal only 1.33 per 100k residents — one of the lowest rates in its quartile
- The most common battery type (alkaline) is rejected by most major retailers
- 95% of residents face at least one recycling barrier; 54% say convenience would change their behavior
- The current system is voluntary, retail-anchored, and structurally unable to reach the communities that need it most
- Food pantries and libraries in the 38 desert counties are the recommended entry points for site placement

# Michigan Battery Access Project — Master Notes
### Last Updated: Current Session

---

## 1. PROJECT OVERVIEW
**Thesis:** Low income and rural communities have disproportionately worse access to battery drop-off infrastructure in Michigan.
**Stakeholder goal:** Find entry points to place collection sites at food pantries and libraries.
**Portfolio angle:** Original research — scraped data that doesn't exist in any published report.
**Report tone:** Analyst briefing to a decision maker. Direct, data-first, action-oriented. Assume he knows the problem — give him findings and a recommendation.

---

## 2. THE URGENCY (use as opening hook)
- May 2025: Lithium battery caused a fire in a Troy trash truck — Troy Fire Department warned residents not to put batteries in trash or recycling bins
- June 2025: Grand Rapids Fire Department and Kent County DPW issued warning — battery fires occurring monthly at recycling and waste facilities
- 2025 Annual Waste & Recycling Facility Fires Report: all-time high of **448 publicly reported fire incidents** at waste and recycling facilities across the US and Canada
- EGLE is examining opportunities to develop a comprehensive strategy — but the infrastructure gap exists today

**Suggested opening:**
"In May 2025, a lithium battery caused a fire in a Troy trash truck. One month later, Grand Rapids Fire reported battery fires occurring monthly at their facilities. 2025 saw an all-time high of 448 waste facility fires across the US and Canada. The problem isn't awareness. It's access."

---

## 3. HARD DATA (from NextCycle 2025 Battery Gap Analysis)
- 12,430 tons of batteries replaced annually in Michigan
- **86% going to landfill, only 10% recycled**
- **Only 29% of residents have access to a permanent drop-off site**
- **885,758 people (~9% of the state) have zero program information available** — actual access gap, not a data gap
- **64% of Michigan's population has access to free battery drop-off** — but this figure includes programs that only accept 1-2 battery types, not the full range
- Fees at other programs: $10–$30 per visit, which creates another barrier for low income residents
- Most common battery type: **Alkaline — rejected by almost every major retailer.** Most alarming fact in the project.

**Retailer reality:**
- Stores that accept nothing: Walmart, Target, Meijer, Best Buy, Menards — the stores in every neighborhood
- Stores that accept everything: Battery Plus, Battery Giant — only 8–10 locations statewide
- Home Depot and Lowe's don't accept alkaline batteries — the most common type people throw away
- Ace Hardware: "less transparent" per the report, accepted materials vary store to store — inconsistent policy, not missing data
- Private retail programs are voluntary and can end with little or no notice

---

## 4. SURVEY DATA (and why it's flawed — use this carefully)
**The report's own numbers:**
- 32% of batteries disposed in curbside trash
- 11% placed in curbside recycling
- 13% brought to retail drop-off
- 12% brought to community/county drop-off
- 12% brought to HHW site
- 4% sent to mail-back program
- **17% stored at home after replacement** ← this is the point

**The bias problem:**
- Survey estimated 18M batteries disposed — waste characterization studies put it at **208M–416M**
- The report calls it recall bias — residents don't remember every battery they threw away, and embedded batteries in products aren't even counted
- Sample size: only **776 people**, 35% from rural counties (which have the highest non-disposal rate)
- A resident reporting they "recycled" batteries doesn't guarantee they went to the correct drop-off or proper bin
- Survey data was extrapolated to estimate state totals using Census population — built on a shaky foundation

**Clean version for report:**
The NextCycle survey estimated 18M batteries disposed annually, but waste characterization studies suggest the real number is 208M–416M — a gap the report attributes to recall bias. With a sample size of 776 respondents and self-reported behavior, the survey likely undercounts improper disposal significantly. Our county-level infrastructure data tells the more reliable story.

**Primary sources to chase for future citations:** Washington 2020, Oregon 2024, Vermont 2023, New Hampshire 2024, New York 2024

---

## 5. AWARENESS DATA (supports the access argument)
- **95% of residents face at least one barrier** to recycling batteries — only 5% report no obstacles
- Most common barriers: not knowing where to take batteries, confusion over which types to recycle, limited local options
- **54% said more convenient access would encourage participation**
- 17% cited lack of clear information on how and where to recycle
- Between 15–17% of survey respondents believed batteries go in curbside recycling bin
- 11–19% believed batteries go in curbside trash
- Despite confusion, 63% know single-use alkaline needs specialized handling — 73% for lithium-ion
- The problem isn't total ignorance — it's that people know batteries are special but have nowhere to take them

---

## 6. ORIGINAL RESEARCH — THE SCRAPE
**What was done:**
The Battery Network website has a map of drop-off locations but no download button. Opened browser developer tools, watched network traffic while the site ran, found the hidden API behind the scenes. The API has two endpoints — one converts zip code to GPS coordinates, one returns all drop-off locations within a given distance. Script hit both endpoints for 206 Michigan zip codes, collected every unique location, saved to CSV.

**Why the data is good:**
Came directly from the Battery Network's own internal API — same data their website displays. Not scraped from HTML or estimated. Retailer counts confirm against NextCycle report: 63 Home Depots vs their reported 70, 43 Lowe's vs their 45 — roughly 90% coverage. Small gap is edge zip codes not covered.

**Why it matters:**
Nobody has published this data in structured format by location. NextCycle only gives statewide totals. This is county-level location data built from scratch using the primary source. That's original research.

**Portfolio explanation (use this language):**
"The Battery Network has a locator tool on their website but no way to download the data. I went into browser developer tools, watched the network requests while the site was running, and found the actual API endpoint it was using behind the scenes. I wrote a Python script that loops through Michigan zip codes, hits the API, and deduplicates everything. The result is a dataset of every Battery Network drop-off site in Michigan with the battery types each location accepts — original data that doesn't exist in any published report."

---

## 7. KEY STATS (verified against final data)
| Metric | Number |
|---|---|
| Total Michigan counties | 83 |
| Counties with zero drop-off sites (battery deserts) | **38** |
| Total drop-off sites mapped | 211 |
| Q1 lowest income — avg sites per county | **0.29** |
| Q4 highest income — avg sites per county | **6.14** |
| Income gap in access | **21x** |
| Rural counties that are battery deserts | **16 of 18** |
| Avg sites per 100k in rural counties | **0.76** |
| Wayne County raw sites | 23 |
| Wayne County sites per 100k | **1.33** |
| Lowest income county | Iosco ($47,777) |
| Highest income county | Livingston ($101,315) |
| Q1 desert counties | 16 of 21 |
| Q2 desert counties | 14 of 21 |

---

## 8. WAYNE COUNTY CALLOUT
Wayne County landed in Q2 (not Q4) because its median income ($59k) is below the state midpoint. That's accurate, not a bug.

On the raw bar chart, Q2 appears taller than Q3 — that's Wayne County inflating the number. The per capita chart corrects this, showing Q2 below Q3 where it belongs.

**Stakeholder language:**
"Wayne County has the most battery drop-off sites in Michigan at 23 locations, which at first glance suggests Detroit has strong access. But when you account for its 1.7 million residents, that's only 1.3 sites per 100,000 people — one of the lowest rates in the state. The raw number is misleading. Per capita, Wayne County residents are just as underserved as the rural counties we're targeting."

**Portfolio framing:**
Mention Wayne as confirmation of thesis, not an exception. Shows you anticipated the counterargument and had data to address it. Demonstrates critical thinking, not just chart making.

---

## 9. SCATTER PLOT EXPLANATION
- X axis = median household income (poorest left, richest right)
- Y axis = sites per 100k residents
- Zero cluster bottom left = desert counties, almost all Q1/Q2
- Not a clean diagonal — some low income counties have decent per capita, some middle income are terrible. More honest than raw count, richer story
- Wayne County sits low on Y despite being mid X — the callout moment
- Trend line shows positive correlation even with noise

---

## 10. POWER BI DASHBOARD STRUCTURE
| Page | Title | Content |
|---|---|---|
| 1 | Maps | Battery Drop-Off Access by County (red gradient) + Community Type (urban/rural) |
| 2 | Income vs Access | Raw Drop-Off Sites by Quartile + Sites per 100k side by side |
| 3 | Target Counties | 38 desert counties table filtered to dropoff_count = 0 |
| 4 | County Analysis | Income vs Battery Access scatter plot colored by quartile |

**Theme:** Navy #1B4F72, Red #E74C3C, Green #2ECC71, Amber #F39C12, Gray #85929E, Background #F2F3F4

---

## 11. CORPORATE FRAMING ANGLE
The access gap isn't just a logistics problem — it's what happens when you build a voluntary consumer-responsibility system around retail footprints. The solution isn't more consumer guilt campaigns, it's infrastructure in the right places. Food pantries and libraries are the only institutions that actually exist in desert counties. The entry point argument isn't just convenient — it's structurally necessary.

**EPR context (one sentence only):**
"While legislative solutions like EPR are being discussed at the state level, the infrastructure gap exists today and requires immediate action."

---

## 12. CROSS-SUBSIDY MODEL (to build)
Inspired by LifeStraw's Buy One Give One model. Every battery drop-off site placed in a wealthy county (Q4) funds one in a desert county. Need: cost to set up and maintain a collection site at a food pantry or library. Build a simple financial model showing how many Q4 county sponsors are needed to cover all 38 desert counties. The fee data from the report ($10–$30 per visit at some programs) might give us a starting point.

---

## 13. FUNDING CONTEXT (from report)
"Expansion of consumer battery collection programs remains constrained without dedicated funding mechanisms such as EPR legislation. Under current funding structures, providers may have limited ability to broaden collection coverage, add participating sites, or increase volumes beyond the battery types already supported."

This is your setup for the cross-subsidy model — the report itself says the current system can't expand without new funding. Your model is the answer.

---

## 14. DATA PIPELINE (in order)
1. Extracted and cleaned 8 tables from NextCycle Battery Gap Analysis (Tables 5–11 AI-assisted)
2. Pandas audit — clean data, one expected null in table5
3. Python analysis → analysis_output.txt
4. 2023 ACS 5-Year Census income data for 83 MI counties → census_income_clean.csv
5. Scraped 214 locations from Battery Network API → battery_locations_raw.csv
6. Mapped locations to counties by zip → add_county.py
7. Merged with Census income + USDA Rural-Urban Continuum Codes → county_access_merged.csv
8. Loaded into PostgreSQL → Battery_Access database
9. 6 analytical SQL queries → battery_analysis.sql
10. Power BI dashboard — 4 pages

---

## 15. DATA QUALITY NOTES
- 211 of 214 locations mapped (3 unresolvable zips — negligible)
- Ace Hardware unknown values = inconsistent store-level policies, not missing data
- County-level data doesn't exist in published reports — itself a policy failure, strengthens thesis
- Wayne County Q2 placement is accurate (median income $59k, below state midpoint)

---

## 16. TO DO
- [ ] Text box callouts in Power BI (after reading report — done)
- [ ] Cross-subsidy financial model
- [ ] Portfolio narrative writeup
- [ ] Eventually: merge 114-page Michigan recycling report with Census data

---

## 17. REPORTS ON FILE
- **33-page:** 2025 NextCycle Michigan Battery Gap Analysis — primary source, already read
- **114-page:** Broader Michigan recycling gap analysis — read later, merge with Census data

---

## 18. SAVED PROMPTS
"Have Claude clean this up, I need one copy for notes and another written as a business analyst report. Base it off the tone of the article Dro sent me."

-- ================================================================
-- Michigan Battery Access Analysis — v4 (corrected source data)
-- Correction: Added EGLE county facility sites not captured by
-- Battery Network locator. See phase1_correction.md for details.
-- Run this entire file in pgAdmin Query Tool
-- ================================================================

DROP TABLE IF EXISTS battery_locations CASCADE;
DROP TABLE IF EXISTS county_access CASCADE;

CREATE TABLE county_access (
    county                  TEXT PRIMARY KEY,
    median_household_income INTEGER NOT NULL,
    dropoff_count           INTEGER NOT NULL DEFAULT 0,
    income_quartile         TEXT NOT NULL,
    population              INTEGER NOT NULL,
    sites_per_100k          NUMERIC(8,2) NOT NULL,
    state                   CHAR(2) NOT NULL DEFAULT 'MI',
    rucc_code               INTEGER,
    metro_nonmetro          TEXT,
    rural_urban_class       TEXT,
    source                  TEXT,
    desert_status           TEXT,
    verification_status     TEXT
);

INSERT INTO county_access VALUES
    ('Iosco', 47777, 0, 'Q1_lowest', 25054, 0.0, 'MI', 6, 'Nonmetro', 'Suburban/Small City', 'Battery Network', 'desert', 'confirmed desert'),
    ('Montmorency', 47803, 0, 'Q1_lowest', 9261, 0.0, 'MI', 7, 'Nonmetro', 'Rural', 'Battery Network', 'desert', 'confirmed desert'),
    ('Gogebic', 49672, 0, 'Q1_lowest', 14526, 0.0, 'MI', 7, 'Nonmetro', 'Rural', 'Battery Network', 'desert', 'confirmed desert'),
    ('Lake', 49680, 0, 'Q1_lowest', 11853, 0.0, 'MI', 8, 'Nonmetro', 'Rural', 'Battery Network', 'desert', 'confirmed desert'),
    ('Clare', 49805, 1, 'Q1_lowest', 30608, 3.27, 'MI', 6, 'Nonmetro', 'Suburban/Small City', 'Battery Network', 'not desert', 'confirmed not desert'),
    ('Oscoda', 50581, 0, 'Q1_lowest', 8241, 0.0, 'MI', 9, 'Nonmetro', 'Rural', 'Battery Network', 'desert', 'confirmed desert'),
    ('Ontonagon', 51844, 0, 'Q1_lowest', 5951, 0.0, 'MI', 9, 'Nonmetro', 'Rural', 'Battery Network', 'desert', 'confirmed desert'),
    ('Alpena', 51909, 1, 'Q1_lowest', 28573, 3.50, 'MI', 6, 'Nonmetro', 'Suburban/Small City', 'EGLE/County facility', 'not desert', 'confirmed not desert'),
    ('Ogemaw', 51983, 1, 'Q1_lowest', 21024, 4.76, 'MI', 6, 'Nonmetro', 'Suburban/Small City', 'Battery Network', 'not desert', 'confirmed not desert'),
    ('Alcona', 53568, 0, 'Q1_lowest', 10234, 0.0, 'MI', 7, 'Nonmetro', 'Rural', 'Battery Network', 'desert', 'confirmed desert'),
    ('Iron', 53614, 0, 'Q1_lowest', 11228, 0.0, 'MI', 8, 'Nonmetro', 'Rural', 'Battery Network', 'desert', 'confirmed desert'),
    ('Isabella', 53759, 2, 'Q1_lowest', 70311, 2.84, 'MI', 3, 'Metro', 'Urban/Metro', 'Battery Network', 'not desert', 'confirmed not desert'),
    ('Keweenaw', 53893, 0, 'Q1_lowest', 2103, 0.0, 'MI', 9, 'Nonmetro', 'Rural', 'Battery Network', 'desert', 'confirmed desert'),
    ('Roscommon', 54106, 0, 'Q1_lowest', 23766, 0.0, 'MI', 6, 'Nonmetro', 'Suburban/Small City', 'Battery Network', 'desert', 'confirmed desert'),
    ('Luce', 54338, 0, 'Q1_lowest', 6230, 0.0, 'MI', 9, 'Nonmetro', 'Rural', 'Battery Network', 'desert', 'confirmed desert'),
    ('Delta', 54829, 1, 'Q1_lowest', 35784, 2.79, 'MI', 6, 'Nonmetro', 'Suburban/Small City', 'EGLE/County facility', 'not desert', 'confirmed not desert'),
    ('Baraga', 55117, 0, 'Q1_lowest', 8209, 0.0, 'MI', 8, 'Nonmetro', 'Rural', 'Battery Network', 'desert', 'confirmed desert'),
    ('Gladwin', 55576, 0, 'Q1_lowest', 25289, 0.0, 'MI', 6, 'Nonmetro', 'Suburban/Small City', 'Battery Network', 'desert', 'confirmed desert'),
    ('Menominee', 55688, 1, 'Q1_lowest', 22893, 4.37, 'MI', 7, 'Nonmetro', 'Rural', 'Battery Network', 'not desert', 'confirmed not desert'),
    ('Houghton', 56573, 1, 'Q1_lowest', 35684, 2.8, 'MI', 6, 'Nonmetro', 'Suburban/Small City', 'Battery Network', 'not desert', 'confirmed not desert'),
    ('Presque Isle', 56713, 0, 'Q1_lowest', 12592, 0.0, 'MI', 7, 'Nonmetro', 'Rural', 'Battery Network', 'desert', 'confirmed desert'),
    ('Huron', 56963, 0, 'Q2', 30981, 0.0, 'MI', 7, 'Nonmetro', 'Rural', 'Battery Network', 'desert', 'confirmed desert'),
    ('Arenac', 56989, 1, 'Q2', 14694, 6.81, 'MI', 6, 'Nonmetro', 'Suburban/Small City', 'EGLE/County facility', 'not desert', 'confirmed not desert'),
    ('Osceola', 57050, 0, 'Q2', 23460, 0.0, 'MI', 6, 'Nonmetro', 'Suburban/Small City', 'Battery Network', 'desert', 'confirmed desert'),
    ('Schoolcraft', 57708, 0, 'Q2', 7989, 0.0, 'MI', 8, 'Nonmetro', 'Rural', 'Battery Network', 'desert', 'confirmed desert'),
    ('Mecosta', 57774, 2, 'Q2', 43240, 4.63, 'MI', 6, 'Nonmetro', 'Suburban/Small City', 'Battery Network + local gov', 'not desert', 'confirmed not desert'),
    ('Saginaw', 58347, 6, 'Q2', 190539, 3.15, 'MI', 2, 'Metro', 'Urban/Metro', 'Battery Network', 'not desert', 'confirmed not desert'),
    ('Mackinac', 58598, 1, 'Q2', 10799, 9.26, 'MI', 8, 'Nonmetro', 'Rural', 'Battery Network', 'not desert', 'confirmed not desert'),
    ('Crawford', 58614, 0, 'Q2', 14030, 0.0, 'MI', 7, 'Nonmetro', 'Rural', 'Battery Network', 'desert', 'confirmed desert'),
    ('Sanilac', 59074, 3, 'Q2', 41170, 7.29, 'MI', 6, 'Nonmetro', 'Suburban/Small City', 'EGLE/County facility', 'not desert', 'confirmed not desert'),
    ('Alger', 59406, 0, 'Q2', 9069, 0.0, 'MI', 7, 'Nonmetro', 'Rural', 'Battery Network', 'desert', 'confirmed desert'),
    ('Wayne', 59521, 23, 'Q2', 1734013, 1.33, 'MI', 1, 'Metro', 'Urban/Metro', 'Battery Network', 'not desert', 'confirmed not desert'),
    ('Kalkaska', 60365, 0, 'Q2', 18038, 0.0, 'MI', 6, 'Nonmetro', 'Suburban/Small City', 'Battery Network', 'desert', 'confirmed desert'),
    ('Calhoun', 60385, 4, 'Q2', 134159, 2.98, 'MI', 3, 'Metro', 'Urban/Metro', 'Battery Network', 'not desert', 'confirmed not desert'),
    ('Bay', 60523, 2, 'Q2', 103126, 1.94, 'MI', 3, 'Metro', 'Urban/Metro', 'Battery Network', 'not desert', 'confirmed not desert'),
    ('Chippewa', 60631, 0, 'Q2', 37354, 0.0, 'MI', 6, 'Nonmetro', 'Suburban/Small City', 'Battery Network', 'desert', 'confirmed desert'),
    ('Genesee', 60673, 7, 'Q2', 405813, 1.72, 'MI', 2, 'Metro', 'Urban/Metro', 'Battery Network', 'not desert', 'confirmed not desert'),
    ('Hillsdale', 60869, 0, 'Q2', 45830, 0.0, 'MI', 6, 'Nonmetro', 'Suburban/Small City', 'Battery Network', 'desert', 'confirmed desert'),
    ('Manistee', 60879, 0, 'Q2', 24397, 0.0, 'MI', 6, 'Nonmetro', 'Suburban/Small City', 'Battery Network', 'desert', 'confirmed desert'),
    ('Gratiot', 61128, 1, 'Q2', 40347, 2.48, 'MI', 6, 'Nonmetro', 'Suburban/Small City', 'Battery Network', 'not desert', 'confirmed not desert'),
    ('Cheboygan', 61619, 0, 'Q2', 26152, 0.0, 'MI', 6, 'Nonmetro', 'Suburban/Small City', 'Battery Network', 'desert', 'confirmed desert'),
    ('Missaukee', 61868, 0, 'Q2', 15453, 0.0, 'MI', 7, 'Nonmetro', 'Rural', 'Battery Network', 'desert', 'confirmed desert'),
    ('Dickinson', 61882, 1, 'Q3', 25554, 3.91, 'MI', 6, 'Nonmetro', 'Suburban/Small City', 'Battery Network', 'not desert', 'confirmed not desert'),
    ('Newaygo', 61931, 0, 'Q3', 49654, 0.0, 'MI', 3, 'Metro', 'Urban/Metro', 'Battery Network', 'desert', 'confirmed desert'),
    ('Branch', 61958, 1, 'Q3', 43517, 2.3, 'MI', 6, 'Nonmetro', 'Suburban/Small City', 'Battery Network', 'not desert', 'confirmed not desert'),
    ('Mason', 62296, 0, 'Q3', 29449, 0.0, 'MI', 6, 'Nonmetro', 'Suburban/Small City', 'Battery Network', 'desert', 'confirmed desert'),
    ('Tuscola', 62847, 1, 'Q3', 52245, 1.91, 'MI', 3, 'Metro', 'Urban/Metro', 'Battery Network', 'not desert', 'confirmed not desert'),
    ('Wexford', 63123, 1, 'Q3', 34152, 2.93, 'MI', 6, 'Nonmetro', 'Suburban/Small City', 'Battery Network', 'not desert', 'confirmed not desert'),
    ('Berrien', 63152, 3, 'Q3', 153696, 1.95, 'MI', 3, 'Metro', 'Urban/Metro', 'Battery Network', 'not desert', 'confirmed not desert'),
    ('Muskegon', 63495, 3, 'Q3', 176492, 1.7, 'MI', 2, 'Metro', 'Urban/Metro', 'Battery Network', 'not desert', 'confirmed not desert'),
    ('Oceana', 63624, 1, 'Q3', 26467, 3.78, 'MI', 6, 'Nonmetro', 'Suburban/Small City', 'Battery Network', 'not desert', 'confirmed not desert'),
    ('Ingham', 64354, 5, 'Q3', 292406, 1.71, 'MI', 1, 'Metro', 'Urban/Metro', 'Battery Network', 'not desert', 'confirmed not desert'),
    ('Shiawassee', 64464, 1, 'Q3', 68122, 1.47, 'MI', 3, 'Metro', 'Urban/Metro', 'Battery Network', 'not desert', 'confirmed not desert'),
    ('Marquette', 64675, 4, 'Q3', 66657, 6.0, 'MI', 3, 'Metro', 'Urban/Metro', 'Battery Network', 'not desert', 'confirmed not desert'),
    ('St. Joseph', 64707, 1, 'Q3', 60964, 1.64, 'MI', 3, 'Metro', 'Urban/Metro', 'Battery Network', 'not desert', 'confirmed not desert'),
    ('Montcalm', 64892, 0, 'Q3', 63888, 0.0, 'MI', 3, 'Metro', 'Urban/Metro', 'Battery Network', 'desert', 'confirmed desert'),
    ('Jackson', 65004, 2, 'Q3', 158510, 1.26, 'MI', 3, 'Metro', 'Urban/Metro', 'Battery Network', 'not desert', 'confirmed not desert'),
    ('Van Buren', 66902, 0, 'Q3', 76258, 0.0, 'MI', 3, 'Metro', 'Urban/Metro', 'Battery Network', 'desert', 'confirmed desert'),
    ('Lenawee', 67013, 2, 'Q3', 98451, 2.03, 'MI', 3, 'Metro', 'Urban/Metro', 'Battery Network', 'not desert', 'confirmed not desert'),
    ('Otsego', 67285, 2, 'Q3', 24397, 8.2, 'MI', 6, 'Nonmetro', 'Suburban/Small City', 'Battery Network', 'not desert', 'confirmed not desert'),
    ('Cass', 68011, 0, 'Q3', 51547, 0.0, 'MI', 3, 'Metro', 'Urban/Metro', 'Battery Network', 'desert', 'confirmed desert'),
    ('St. Clair', 69349, 4, 'Q3', 159415, 2.51, 'MI', 1, 'Metro', 'Urban/Metro', 'Battery Network', 'not desert', 'confirmed not desert'),
    ('Kalamazoo', 70525, 6, 'Q4_highest', 265066, 2.26, 'MI', 2, 'Metro', 'Urban/Metro', 'Battery Network', 'not desert', 'confirmed not desert'),
    ('Antrim', 71421, 1, 'Q4_highest', 23624, 4.23, 'MI', 6, 'Nonmetro', 'Suburban/Small City', 'Battery Network', 'not desert', 'confirmed not desert'),
    ('Benzie', 72603, 1, 'Q4_highest', 17766, 5.63, 'MI', 6, 'Nonmetro', 'Suburban/Small City', 'County website', 'not desert', 'confirmed not desert'),
    ('Ionia', 73436, 1, 'Q4_highest', 64697, 1.55, 'MI', 3, 'Metro', 'Urban/Metro', 'Battery Network', 'not desert', 'confirmed not desert'),
    ('Emmet', 73724, 4, 'Q4_highest', 33895, 11.8, 'MI', 6, 'Nonmetro', 'Suburban/Small City', 'Battery Network', 'not desert', 'confirmed not desert'),
    ('Monroe', 75272, 2, 'Q4_highest', 150500, 1.33, 'MI', 1, 'Metro', 'Urban/Metro', 'Battery Network', 'not desert', 'confirmed not desert'),
    ('Lapeer', 76228, 1, 'Q4_highest', 89843, 1.11, 'MI', 1, 'Metro', 'Urban/Metro', 'Battery Network', 'not desert', 'confirmed not desert'),
    ('Macomb', 76399, 17, 'Q4_highest', 881217, 1.93, 'MI', 1, 'Metro', 'Urban/Metro', 'Battery Network', 'not desert', 'confirmed not desert'),
    ('Charlevoix', 76495, 1, 'Q4_highest', 26856, 3.72, 'MI', 6, 'Nonmetro', 'Suburban/Small City', 'Battery Network', 'not desert', 'confirmed not desert'),
    ('Midland', 77538, 6, 'Q4_highest', 82874, 7.24, 'MI', 3, 'Metro', 'Urban/Metro', 'Battery Network', 'not desert', 'confirmed not desert'),
    ('Barry', 77873, 0, 'Q4_highest', 61550, 0.0, 'MI', 3, 'Metro', 'Urban/Metro', 'Battery Network', 'desert', 'confirmed desert'),
    ('Eaton', 78025, 3, 'Q4_highest', 110268, 2.72, 'MI', 1, 'Metro', 'Urban/Metro', 'Battery Network', 'not desert', 'confirmed not desert'),
    ('Grand Traverse', 79486, 10, 'Q4_highest', 97519, 10.25, 'MI', 3, 'Metro', 'Urban/Metro', 'Battery Network', 'not desert', 'confirmed not desert'),
    ('Allegan', 80255, 1, 'Q4_highest', 118081, 0.85, 'MI', 3, 'Metro', 'Urban/Metro', 'Battery Network', 'not desert', 'confirmed not desert'),
    ('Kent', 80390, 16, 'Q4_highest', 667415, 2.4, 'MI', 2, 'Metro', 'Urban/Metro', 'Battery Network', 'not desert', 'confirmed not desert'),
    ('Clinton', 85928, 1, 'Q4_highest', 79594, 1.26, 'MI', 1, 'Metro', 'Urban/Metro', 'Battery Network', 'not desert', 'confirmed not desert'),
    ('Ottawa', 87144, 10, 'Q4_highest', 305134, 3.28, 'MI', 2, 'Metro', 'Urban/Metro', 'Battery Network', 'not desert', 'confirmed not desert'),
    ('Washtenaw', 87156, 8, 'Q4_highest', 375329, 2.13, 'MI', 1, 'Metro', 'Urban/Metro', 'Battery Network', 'not desert', 'confirmed not desert'),
    ('Leelanau', 91943, 0, 'Q4_highest', 22355, 0.0, 'MI', 3, 'Metro', 'Urban/Metro', 'Battery Network', 'desert', 'confirmed desert'),
    ('Oakland', 95296, 37, 'Q4_highest', 1274395, 2.9, 'MI', 1, 'Metro', 'Urban/Metro', 'Battery Network', 'not desert', 'confirmed not desert'),
    ('Livingston', 101315, 4, 'Q4_highest', 202909, 1.97, 'MI', 1, 'Metro', 'Urban/Metro', 'Battery Network', 'not desert', 'confirmed not desert');

CREATE TABLE battery_locations (
    id                  SERIAL PRIMARY KEY,
    name                TEXT NOT NULL,
    address             TEXT,
    city                TEXT,
    state               CHAR(2),
    zip                 TEXT,
    county              TEXT REFERENCES county_access(county),
    accepted_materials  TEXT,
    account_number      INTEGER
);

INSERT INTO battery_locations (name, address, city, state, zip, county, accepted_materials, account_number) VALUES
    ('Lowe''s', '27990 23 Mile Rd', 'Chesterfield', 'MI', '48051-2313', 'Macomb', 'rechargeable;cellphones;highenergybattery', '69123'),
    ('Staples #0372', '51382 Gratiot Ave', 'Chesterfield', 'MI', '48051-2035', 'Macomb', 'rechargeable;singleuse;cellphones', '65091'),
    ('The Home Depot', '51315 Gratiot Ave', 'Chesterfield', 'MI', '48051-2041', 'Macomb', 'rechargeable', '42999'),
    ('The Home Depot', '20777 Hall Rd', 'Macomb', 'MI', '48044-4231', 'Macomb', 'rechargeable', '70640'),
    ('Lowe''s', '35115 S Gratiot Ave', 'Clinton Township', 'MI', '48035-2845', 'Macomb', 'rechargeable;cellphones;highenergybattery', '69130'),
    ('Trek Bicycle Macomb Township', '18571 Hall Rd', 'Macomb Township', 'MI', '48044', 'Macomb', 'ebike', '210856'),
    ('The Home Depot', '20500 E 13 Mile Rd', 'Roseville', 'MI', '48066-4542', 'Macomb', 'rechargeable', '42993'),
    ('Fraser Bicycle', '34501 Utica Road', 'Fraser', 'MI', '48026', 'Macomb', 'ebike', '205827'),
    ('Lowe''s', '31140 Van Dyke Ave', 'Warren', 'MI', '48093-7639', 'Macomb', 'rechargeable;cellphones;highenergybattery', '69110'),
    ('The Home Depot', '37000 Van Dyke Ave', 'Sterling Heights', 'MI', '48312-1824', 'Macomb', 'rechargeable', '43000'),
    ('The Home Depot', '25879 Hoover Rd', 'Warren', 'MI', '48089-1150', 'Macomb', 'rechargeable', '42991'),
    ('uBreakiFix', '36657 Van Dyke', 'Sterling Heights', 'MI', '48312', 'Macomb', 'rechargeable;cellphones', '181853'),
    ('The Home Depot', '20300 Kelly Rd', 'Harper Woods', 'MI', '48225-1205', 'Wayne', 'rechargeable', '42995'),
    ('Lowe''s', '19340 Vernier Rd', 'Harper Woods', 'MI', '48225-1045', 'Wayne', 'rechargeable;cellphones;highenergybattery', '69129'),
    ('Lowe''s', '15350 Hall Rd', 'Clinton Township', 'MI', '48038-1034', 'Macomb', 'rechargeable;cellphones;highenergybattery', '69119'),
    ('uBreakiFix', '14876 Hall Rd', 'Sterling Heights', 'MI', '48313', 'Macomb', 'rechargeable', '205379'),
    ('The Home Depot', '45301 Northpointe Blvd', 'Utica', 'MI', '48315-5818', 'Macomb', 'rechargeable', '42997'),
    ('Lowe''s', '2000 Metropolitan Pkwy', 'Sterling Heights', 'MI', '48310-4203', 'Macomb', 'rechargeable;cellphones;highenergybattery', '71622'),
    ('Lowe''s', '434 W 12 Mile Rd', 'Madison Heights', 'MI', '48071-2420', 'Oakland', 'rechargeable;cellphones;highenergybattery', '94683'),
    ('The Home Depot', '660 W 12 Mile Rd', 'Madison Heights', 'MI', '48071-2407', 'Oakland', 'rechargeable', '42996'),
    ('Sullivan''s Continental Bike Shop', '24436 John R. Road', 'Hazel Park', 'MI', '48030', 'Oakland', 'ebike', '215826'),
    ('Staples #0448', '17410 Mack Ave', 'Grosse Pointe', 'MI', '48230-6228', 'Wayne', 'rechargeable;singleuse;cellphones', '133676'),
    ('REI - Troy', '766 East Big Beaver Rd.', 'Troy', 'MI', '48083', 'Oakland', 'ebike', '210747'),
    ('Staples #0360', '1129 W 14 Mile Rd', 'Clawson', 'MI', '48017-2801', 'Oakland', 'rechargeable;singleuse;cellphones', '133673'),
    ('Lowe''s', '3277 S Rochester Rd', 'Rochester Hills', 'MI', '48307-5043', 'Oakland', 'rechargeable;cellphones;highenergybattery', '105556'),
    ('uBreakiFix', '3137 Crooks Rd', 'Troy', 'MI', '48084', 'Oakland', 'rechargeable;cellphones', '181852'),
    ('Metropolis Cycles - Ferndale', '504 Livernois St', 'ferndale', 'MI', '48220', 'Oakland', 'ebike', '218687'),
    ('Trek Bicycle of Royal Oak', '29428 Woodward Ave', 'ROYAL OAK', 'MI', '48073', 'Oakland', 'ebike', '223373'),
    ('Erik''s Bike Shop - Rochester Hills', '2680 S Rochester Rd', 'Rochester Hills', 'MI', '48307', 'Oakland', 'ebike', '220974'),
    ('uBreakiFix', '30274 Woodward Ave', 'Royal Oak', 'MI', '48073', 'Oakland', 'rechargeable;cellphones', '181849'),
    ('The Home Depot', '1177 Coolidge Hwy', 'Troy', 'MI', '48084-7019', 'Oakland', 'rechargeable', '62937'),
    ('Staples #0405', '1950 S Rochester Rd', 'Rochester Hills', 'MI', '48307-3534', 'Oakland', 'rechargeable;singleuse;cellphones', '65123'),
    ('The Home Depot', '8760 26 Mile Rd', 'Shelby Township', 'MI', '48316-1917', 'Macomb', 'rechargeable', '63322'),
    ('Erik''s Bike Shop - Birmingham', '33600 Woodward Ave', 'Birmingham', 'MI', '48009', 'Oakland', 'ebike', '220973'),
    ('The Home Depot', '225 W Avon Rd', 'Rochester Hills', 'MI', '48307-2768', 'Oakland', 'rechargeable', '42998'),
    ('Staples #1213', '43313 Woodward Ave', 'Bloomfield Hills', 'MI', '48302-5007', 'Oakland', 'rechargeable;singleuse;cellphones', '133720'),
    ('Lowe''s', '28650 Telegraph Rd', 'Southfield', 'MI', '48034-1934', 'Oakland', 'rechargeable;cellphones;highenergybattery', '69128'),
    ('uBreakiFix', '24508 Twelve Mile Rd', 'Southfield', 'MI', '48034', 'Oakland', 'rechargeable;cellphones', '181850'),
    ('Alpine Cycles - Port Huron', '726 Huron Avenue', 'Port Huron', 'MI', '48060', 'St. Clair', 'ebike', '207787'),
    ('The Home Depot', '4195 24th Ave', 'Fort Gratiot', 'MI', '48059-3855', 'St. Clair', 'rechargeable', '42977'),
    ('Lowe''s', '4200 24th Ave', 'Fort Gratiot', 'MI', '48059-3880', 'St. Clair', 'rechargeable;cellphones;highenergybattery', '69111'),
    ('Staples #0331', '4303 24th Ave', 'Fort Gratiot', 'MI', '48059-3805', 'St. Clair', 'rechargeable;singleuse;cellphones', '65054'),
    ('The Home Depot', '13500 Middlebelt Rd', 'Livonia', 'MI', '48150-2235', 'Wayne', 'rechargeable', '42965'),
    ('The Home Depot', '32525 Northwestern Hwy', 'Farmington Hills', 'MI', '48334-1447', 'Oakland', 'rechargeable', '70637'),
    ('uBreakiFix', '7415 Orchard Lake Road', 'West Bloomfield Township', 'MI', '48322', 'Oakland', 'rechargeable;cellphones', '181855'),
    ('REI - Northville', '17559 Haggerty Road', 'Northville', 'MI', '48168-9542', NULL, 'ebike', '211143'),
    ('uBreakiFix', '22370 Michigan Ave', 'Dearborn', 'MI', '48124', 'Wayne', 'rechargeable;cellphones', '181854'),
    ('Staples #0346', '23131 Michigan Ave', 'Dearborn', 'MI', '48124-2020', 'Wayne', 'rechargeable;singleuse;cellphones', '65067'),
    ('Sears', '35000 Warren Rd', 'Westland', 'MI', '48185-6223', 'Wayne', 'rechargeable;cellphones', '25344'),
    ('Lowe''s', '1801 S Telegraph Rd', 'Bloomfield Hills', 'MI', '48302-0163', 'Oakland', 'rechargeable;cellphones;highenergybattery', '69112'),
    ('Trek Bicycle Walled Lake', '39900 W. 14 Mile Rd.', 'Walled Lake', 'MI', '48390', 'Oakland', 'ebike', '208010'),
    ('Staples #0952', '335 Haggerty Hwy', 'Commerce Township', 'MI', '48390-3919', 'Oakland', 'rechargeable;singleuse;cellphones', '133703'),
    ('The Home Depot', '25451 One Michigan Ave', 'Dearborn Heights', 'MI', '48125-1033', 'Wayne', 'rechargeable', '42964'),
    ('The Home Depot', '355 Haggerty Hwy', 'Commerce Township', 'MI', '48390-3919', 'Oakland', 'rechargeable', '43006'),
    ('GLA 18510', '132 S Merriman Rd', 'Westland', 'MI', '48156', NULL, 'highenergybattery', '220618'),
    ('The Home Depot', '545 S Telegraph Rd', 'Pontiac', 'MI', '48341-2376', 'Oakland', 'rechargeable', '43002'),
    ('Lowe''s', '2745 W Maple Rd', 'Commerce Township', 'MI', '48382-4351', 'Oakland', 'rechargeable;cellphones;highenergybattery', '72826'),
    ('Lowe''s', '6555 N Newburgh Rd', 'Westland', 'MI', '48185-3747', 'Wayne', 'rechargeable;cellphones', '69116'),
    ('The Home Depot', '3163 Fairlane Dr', 'Allen Park', 'MI', '48101-2866', 'Wayne', 'rechargeable', '104799'),
    ('Lowe''s', '23111 Outer Dr', 'Allen Park', 'MI', '48101-3100', 'Wayne', 'rechargeable;cellphones;highenergybattery', '76560'),
    ('Town And Country Bike And Boards', '148 N. Center', 'Northville', 'MI', '48167', 'Wayne', 'ebike', '206696'),
    ('The Home Depot', '39825 Ford Rd', 'Canton', 'MI', '48187-4319', 'Wayne', 'rechargeable', '42963'),
    ('Cycletherapy Bicycles', '3545 Elizabeth Lake Road', 'Waterford', 'MI', '48328', 'Oakland', 'ebike', '206502'),
    ('Staples #1565', '47610 Grand River Ave', 'Novi', 'MI', '48374-1217', 'Oakland', 'rechargeable;singleuse;cellphones', '133721'),
    ('The Home Depot', '47950 Grand River Ave', 'Novi', 'MI', '48374-1220', 'Oakland', 'rechargeable', '43007'),
    ('The Home Depot', '47725 Five Mile Rd', 'Plymouth', 'MI', '48170-2418', 'Wayne', 'rechargeable', '62938'),
    ('Lowe''s', '44080 Ford Rd', 'Canton', 'MI', '48187-3175', 'Wayne', 'rechargeable;cellphones;highenergybattery', '78118'),
    ('The Home Depot', '11100 Telegraph Rd', 'Taylor', 'MI', '48180-6812', 'Wayne', 'rechargeable', '91458'),
    ('The Home Depot', '4150 Joslyn Rd', 'Auburn Hills', 'MI', '48326-1325', 'Oakland', 'rechargeable', '62939'),
    ('Lowe''s', '8550 Highland Rd', 'White Lake', 'MI', '48386-2020', 'Oakland', 'rechargeable;cellphones;highenergybattery', '74369'),
    ('The Home Depot', '21100 Penn St', 'Taylor', 'MI', '48180-6300', 'Wayne', 'rechargeable', '43127'),
    ('The Home Depot', '9078 Highland Rd', 'White Lake', 'MI', '48386-2030', 'Oakland', 'rechargeable', '42989'),
    ('uBreakiFix', '23630 Eureka Rd', 'Taylor', 'MI', '48180', 'Wayne', 'rechargeable;cellphones', '204707'),
    ('The Home Depot', '45900 Michigan Ave', 'Canton', 'MI', '48188-2304', 'Wayne', 'rechargeable', '42966'),
    ('The Home Depot', '2600 S Lapeer Rd', 'Orion', 'MI', '48360-2236', 'Oakland', 'rechargeable', '43001'),
    ('Kinetic Systems Bicycles', '60 S. Main St.', 'Clarkston', 'MI', '48346', 'Oakland', 'ebike', '206697'),
    ('Staples #1564', '2601 Jackson Ave', 'Ann Arbor', 'MI', '48103-3820', 'Washtenaw', 'rechargeable;singleuse;cellphones', '133679'),
    ('Lowe''s', '5900 Jackson Rd', 'Ann Arbor', 'MI', '48103-9573', 'Washtenaw', 'rechargeable;cellphones;highenergybattery', '71621'),
    ('REI - Ann Arbor', '970 West Eisenhower Parkway', 'Ann Arbor', 'MI', '48103', 'Washtenaw', 'ebike', '210693'),
    ('Human Electric Hybrids', '320 Miller Ave', 'Ann Arbor', 'MI', '48103', 'Washtenaw', 'ebike', '207891'),
    ('Urban Rider Cargo Bikes', '410 N. Fourth Ave.', 'Ann Arbor', 'MI', '48104', 'Washtenaw', 'ebike', '207890'),
    ('The Home Depot', '3300 Carpenter Rd', 'Ypsilanti', 'MI', '48197-9612', 'Washtenaw', 'rechargeable', '43128'),
    ('Lowe''s', '3900 Carpenter Rd', 'Ypsilanti', 'MI', '48197-9645', 'Washtenaw', 'rechargeable;cellphones;highenergybattery', '69113'),
    ('Aberdeen Bike & Fitness', '1101 South main Street', 'Chelsea', 'MI', '48118', 'Washtenaw', 'ebike', '223025'),
    ('South Lyon Cycle', '209 S Lafayette St', 'South Lyon', 'MI', '48178', 'Oakland', 'ebike', '211131'),
    ('Lowe''s', '21000 West Rd', 'Woodhaven', 'MI', '48183-3244', 'Wayne', 'rechargeable;cellphones', '105557'),
    ('The Home Depot', '23300 Allen Rd', 'Woodhaven', 'MI', '48183-3384', 'Wayne', 'rechargeable', '43129'),
    ('Al Petri & Sons', '22720 Allen Rd', 'Woodhaven', 'MI', '48183', 'Wayne', 'ebike', '209625'),
    ('Lowe''s', '16410 Trenton Rd', 'Southgate', 'MI', '48195-1404', 'Wayne', 'rechargeable;cellphones;highenergybattery', '69124'),
    ('Lowe''s', '2191 N Telegraph Rd', 'Monroe', 'MI', '48162-8947', 'Monroe', 'rechargeable;cellphones;highenergybattery', '69120'),
    ('Staples #0938', '2145 N Telegraph Rd', 'Monroe', 'MI', '48162-8947', 'Monroe', 'rechargeable;singleuse;cellphones', '133675'),
    ('The Home Depot', '8053 Challis Rd', 'Brighton', 'MI', '48116-7446', 'Livingston', 'rechargeable', '42987'),
    ('Staples #0773', '8063 Challis Rd', 'Brighton', 'MI', '48116-7446', 'Livingston', 'rechargeable;singleuse;cellphones', '65423'),
    ('Lowe''s', '1100 S Latson Rd', 'Howell', 'MI', '48843-4501', 'Livingston', 'rechargeable;cellphones;highenergybattery', '69118'),
    ('The Home Depot', '3330 E Grand River Ave', 'Howell', 'MI', '48843-8556', 'Livingston', 'rechargeable', '42992'),
    ('Lowe''s', '30547 Lyon Center Dr E', 'New Hudson', 'MI', '48165-8901', 'Oakland', 'rechargeable;cellphones;highenergybattery', '74628'),
    ('Great Lakes Ace - Milford, MI', '530 Highland Avenue', 'Milford', 'MI', '48381', 'Oakland', 'highenergybattery', '224456'),
    ('Staples #1699', '6272 S Saginaw Rd', 'Grand Blanc', 'MI', '48439-2705', 'Genesee', 'rechargeable;cellphones;singleuse', '133723'),
    ('Cyclefit Sports - Fenton', '1006 N Leroy St', 'Fenton', 'MI', '48430', 'Genesee', 'ebike', '210403'),
    ('The Home Depot', '15255 Silver Pkwy', 'Fenton', 'MI', '48430-3430', 'Genesee', 'rechargeable', '42990'),
    ('The Home Depot', '1500 Summit St', 'Lapeer', 'MI', '48446-3920', 'Lapeer', 'rechargeable', '42978'),
    ('Direct Tools Factory Outlet', '12158 South Beyer Road', 'Birch Run', 'MI', '48415', 'Saginaw', 'rechargeable;cellphones', '204611'),
    ('The Home Depot', '4245 E Court St', 'Burton', 'MI', '48509-1719', 'Genesee', 'rechargeable', '42976'),
    ('The Home Depot', '5300 W Pierson Rd', 'Flushing', 'MI', '48433-2449', 'Genesee', 'rechargeable', '63311'),
    ('The Home Depot', '4380 Corunna Rd', 'Flint', 'MI', '48532-4319', 'Genesee', 'rechargeable', '42975'),
    ('The Home Depot', '1222 W Hill Rd', 'Flint', 'MI', '48507-4762', 'Genesee', 'rechargeable', '63310'),
    ('The Home Depot', '2205 E M 21', 'Owosso', 'MI', '48867-9067', 'Shiawassee', 'rechargeable', '70642'),
    ('Shumaker''s @ The Stable', '300 S. Hamilton St', 'Saginaw', 'MI', '48602', 'Saginaw', 'ebike', '222585'),
    ('Lowe''s', '2258 Tittabawassee Rd', 'Saginaw', 'MI', '48604-9427', 'Saginaw', 'rechargeable;cellphones;highenergybattery', '69107'),
    ('Staples #0589', '2860 Tittabawassee Rd', 'Saginaw', 'MI', '48604-9417', 'Saginaw', 'rechargeable;singleuse;cellphones', '133699'),
    ('The Home Depot', '3132 N Bueker Dr', 'Saginaw', 'MI', '48604-2400', 'Saginaw', 'rechargeable', '42974'),
    ('The Home Depot', '8670 Gratiot Rd', 'Saginaw', 'MI', '48609-4877', 'Saginaw', 'rechargeable', '77912'),
    ('Staples #0315', '4021 N Euclid Ave', 'Bay City', 'MI', '48706-2406', 'Bay', 'rechargeable;singleuse;cellphones', '133718'),
    ('The Home Depot', '3860 State Street Rd', 'Bay City', 'MI', '48706-2111', 'Bay', 'rechargeable', '42979'),
    ('The Home Depot', '2892 Cook Rd', 'West Branch', 'MI', '48661-8769', 'Ogemaw', 'rechargeable', '76117'),
    ('Ace Hardware of Clare', '10316 S Clare Ave', 'Clare', 'MI', '48617-9733', 'Clare', 'rechargeable;cellphones', '76128'),
    ('The Home Depot', '5650 E Pickard St', 'Mount Pleasant', 'MI', '48858-5010', 'Isabella', 'rechargeable', '42981'),
    ('Ray''s Bike Shop City Forest', '7814 Eastman Ave', 'Midland', 'MI', '48640', 'Midland', 'ebike', '206510'),
    ('Lowe''s', '1918 Airport Rd', 'Midland', 'MI', '48642-7792', 'Midland', 'rechargeable;cellphones;highenergybattery', '69108'),
    ('Staples #0823', '1517 Joe Mann Blvd', 'Midland', 'MI', '48642-8902', 'Midland', 'rechargeable;singleuse;cellphones', '65466'),
    ('The Home Depot', '1100 Joe Mann Blvd', 'Midland', 'MI', '48642-8910', 'Midland', 'rechargeable', '70641'),
    ('Staples #0310', '2141 S Mission St', 'Mount Pleasant', 'MI', '48858-4426', 'Isabella', 'rechargeable;singleuse;cellphones', '65033'),
    ('Bicycle Headquarters', '3310 Bay City Rd.', 'Midland', 'MI', '48642', 'Midland', 'ebike', '220504'),
    ('Midland Recyclers', '4305 E ASHMAN ST', 'MIDLAND', 'MI', '48642-8882', 'Midland', 'rechargeable;cellphones', '86876'),
    ('Tuscola County Recycling', '987 ELLINGTON ST', 'CARO', 'MI', '48723-8922', 'Tuscola', 'rechargeable;cellphones', '44650'),
    ('Terry''s Cycle, LLC', '317 N. State St', 'Alma', 'MI', '48801', 'Gratiot', 'ebike', '213350'),
    ('Midwest Power Equipment', '7410 E Saginaw', 'Haslett', 'MI', '48840', 'Ingham', 'highenergybattery', '220584'),
    ('Staples #0324', '3003 E Michigan Ave', 'Lansing', 'MI', '48912-4616', 'Ingham', 'rechargeable;singleuse;cellphones', '65047'),
    ('Denny''s Central Park Bicycles', '1805 Central Park Dr.', 'Okemos', 'MI', '48864', 'Ingham', 'ebike', '206595'),
    ('The Home Depot', '1749 Newman Rd', 'Okemos', 'MI', '48864-1157', 'Ingham', 'rechargeable', '42986'),
    ('uBreakiFix', '4324 West Saginaw Highway', 'Lansing', 'MI', '48917', 'Eaton', 'rechargeable;cellphones', '181859'),
    ('The Home Depot', '936 S Waverly Rd', 'Lansing', 'MI', '48917-4255', 'Eaton', 'rechargeable', '42988'),
    ('Clinton County Department of Waste Management', '1307 E Townsend Rd Ste 102', 'Saint Johns', 'MI', '48879-9036', 'Clinton', 'rechargeable;cellphones', '55701'),
    ('Lowe''s', '6821 S Cedar St', 'Lansing', 'MI', '48911-6908', 'Ingham', 'rechargeable;cellphones;highenergybattery', '69127'),
    ('Lowe''s', '320 N Marketplace Blvd', 'Lansing', 'MI', '48917-7713', 'Eaton', 'rechargeable;cellphones;highenergybattery', '69117'),
    ('Pedego Grand Rapids', '6744 CASCADE RD SE', 'Grand Rapids', 'MI', '49546', 'Kent', 'ebike', '220720'),
    ('Grand Rapids Bicycle Company', '597 Ada Dr. S.E.', 'Ada', 'MI', '49301', 'Kent', 'ebike', '219995'),
    ('Dan''s Bike Shop', '350 W Main St', 'Ionia', 'MI', '48846', 'Ionia', 'ebike', '211677'),
    ('Staples #1637', '5110 28th St SE', 'Grand Rapids', 'MI', '49512-2049', 'Kent', 'rechargeable;singleuse;cellphones', '133722'),
    ('The Home Depot', '4646 28th St SE', 'Grand Rapids', 'MI', '49512-1914', 'Kent', 'rechargeable', '42969'),
    ('West Michigan Bike & Fitness - KW', '2830 East Paris ', 'Kentwood ', 'MI', '49512', 'Kent', 'ebike', '209148'),
    ('Lowe''s', '3330 28th St SE', 'Grand Rapids', 'MI', '49512-1633', 'Kent', 'rechargeable;cellphones;highenergybattery', '69126'),
    ('REI - Grand Rapids', '3149 28th St SE', 'Kentwood', 'MI', '49512', 'Kent', 'ebike', '211163'),
    ('Lowe''s', '5108 S Westnedge Ave', 'Portage', 'MI', '49002-0403', 'Kalamazoo', 'rechargeable;cellphones;highenergybattery', '69121'),
    ('Pedal Downtown', '611 West Michigan Ave ', 'Kalamazoo', 'MI', '49007', 'Kalamazoo', 'ebike', '209203'),
    ('The Home Depot', '6685 S Westnedge Ave', 'Portage', 'MI', '49002-3544', 'Kalamazoo', 'rechargeable', '42971'),
    ('Pedal', '185 Romence rd', 'portage', 'mi', '49024', 'Kalamazoo', 'ebike', '206576'),
    ('uBreakiFix', '4510 W Main Street', 'Kalamazoo', 'MI', '49006', 'Kalamazoo', 'rechargeable;cellphones', '181856'),
    ('Lowe''s', '5125 W Main St', 'Kalamazoo', 'MI', '49009-1003', 'Kalamazoo', 'rechargeable;cellphones;highenergybattery', '69115'),
    ('The Home Depot', '1227 M 89', 'Plainwell', 'MI', '49080-1135', 'Allegan', 'rechargeable', '70643'),
    ('Mike''s Team Active Bikes', '22 West Michigan Ave.', 'Battle Creek', 'MI', '49017', 'Calhoun', 'ebike', '206325'),
    ('UbreakiFix', '2545 Capital AVE SW', 'Battle Creek', 'MI', '49015', 'Calhoun', 'rechargeable', '207414'),
    ('Lowe''s', '6122 B Dr N', 'Battle Creek', 'MI', '49014-8367', 'Calhoun', 'rechargeable;cellphones;highenergybattery', '69102'),
    ('Staples #0379', '6128 Beckley Drive North', 'Battle Creek', 'MI', '49014', 'Calhoun', 'rechargeable;singleuse;cellphones', '65098'),
    ('Lowe''s', '2055 S 11th St', 'Niles', 'MI', '49120-4073', 'Berrien', 'rechargeable;cellphones;highenergybattery', '72811'),
    ('The Home Depot', '1301 S US Highway 131', 'Three Rivers', 'MI', '49093-8836', 'St. Joseph', 'rechargeable', '77934'),
    ('The Home Depot', '2075 Pipestone Rd', 'Benton Harbor', 'MI', '49022-2316', 'Berrien', 'rechargeable', '62941'),
    ('Lowe''s', '1300 Mall Dr', 'Benton Harbor', 'MI', '49022-2312', 'Berrien', 'rechargeable;cellphones;highenergybattery', '69101'),
    ('The Home Depot', '825 E Chicago St', 'Coldwater', 'MI', '49036', 'Branch', 'rechargeable;cellphones', '218613'),
    ('The Home Depot', '1400 N Wisner St', 'Jackson', 'MI', '49202-3120', 'Jackson', 'rechargeable', '70639'),
    ('Lowe''s', '1535 Boardman Rd', 'Jackson', 'MI', '49202-1973', 'Jackson', 'rechargeable;cellphones;highenergybattery', '69104'),
    ('Staples #0592', '1416 S Main St', 'Adrian', 'MI', '49221-4364', 'Lenawee', 'rechargeable;singleuse;cellphones', '133674'),
    ('Lowe''s', '1369 Division St', 'Adrian', 'MI', '49221-4204', 'Lenawee', 'rechargeable;cellphones', '69103'),
    ('Lowe''s', '4297 Plainfield Ave NE', 'Grand Rapids', 'MI', '49525-1611', 'Kent', 'rechargeable;cellphones;highenergybattery', '69125'),
    ('The Home Depot', '2727 Alpine Ave NW', 'Grand Rapids', 'MI', '49544-1962', 'Kent', 'rechargeable', '77902'),
    ('Auto Wares, Inc', '440 KIRTLAND ST SW', 'GRAND RAPIDS', 'MI', '49507-2331', 'Kent', 'rechargeable;cellphones', '18064'),
    ('Alger Bikes', '120 28th st sw', 'grand rapids', 'MI', '49548', 'Kent', 'ebike', '219716'),
    ('The Home Depot', '257 54th St SW', 'Grand Rapids', 'MI', '49548-5613', 'Kent', 'rechargeable', '62944'),
    ('uBreakiFix', '5751 Byron Center Ave SW', 'Wyoming', 'MI', '49519', NULL, 'rechargeable;cellphones', '181860'),
    ('Staples #1621', '3313 Century Center St SW', 'Grandville', 'MI', '49418-3109', 'Kent', 'rechargeable;singleuse;cellphones', '119733'),
    ('West Michigan Bike and Fitness', '4300 CHICAGO DR SW', 'GRANDVILLE', 'MI', '49418', 'Kent', 'ebike', '216372'),
    ('The Home Depot', '4900 Wilson Ave SW', 'Wyoming', 'MI', '49418-3135', 'Kent', 'rechargeable', '42972'),
    ('Lowe''s', '4705 Canal Ave SW', 'Grandville', 'MI', '49418-8752', 'Kent', 'rechargeable;cellphones', '69122'),
    ('Village Bike and Fitness - Jenison', '450 Baldwin St.', 'Jenison', 'MI', '49428', 'Ottawa', 'ebike', '212252'),
    ('Visser Ace Hardware', '835 Lincoln Ave', 'Holland', 'MI', '49423', 'Ottawa', 'highenergybattery', '222084'),
    ('West Michigan Bike and Fitness', '380 Chicago drive', 'Holland Michigan', 'MI', '49423', 'Ottawa', 'ebike', '215866'),
    ('Ottawa County', '12251 James St', 'Holland', 'MI', '49424-8942', 'Ottawa', 'rechargeable;cellphones', '58526'),
    ('Staples #0328', '2337 N Park Dr', 'Holland', 'MI', '49424-8522', 'Ottawa', 'rechargeable;singleuse;cellphones', '65051'),
    ('Velo City Cycles Holland, Michigan', '326 S. River Ave', 'Holland', 'MI', '49423', 'Ottawa', 'ebike', '209517'),
    ('Lowe''s', '12635 Felch St', 'Holland', 'MI', '49424-8275', 'Ottawa', 'rechargeable;cellphones;highenergybattery', '69106'),
    ('Cross Country Cycle', '345 Douglas Ave', 'Holland', 'MI', '49424', 'Ottawa', 'ebike', '206580'),
    ('The Home Depot', '900 Jackson St', 'Grand Haven', 'MI', '49417-1136', 'Ottawa', 'rechargeable', '76552'),
    ('Staples #1594', '840 Jackson St', 'Grand Haven', 'MI', '49417-1179', 'Ottawa', 'rechargeable;singleuse;cellphones', '133725'),
    ('Lowe''s', '2035 E Sherman Blvd', 'Muskegon', 'MI', '49444-1825', 'Muskegon', 'rechargeable;cellphones;highenergybattery', '69105'),
    ('The Home Depot', '2699 Henry St', 'Muskegon', 'MI', '49441-3507', 'Muskegon', 'rechargeable', '42973'),
    ('Northshore Ace Hardware', '605 Whitehall Rd', 'N Muskegon', 'MI', '49445', 'Muskegon', 'highenergybattery', '220602'),
    ('Larson & Son Ace', '4 Lincoln St', 'Hart', 'MI', '49420-1136', 'Oceana', 'rechargeable;cellphones', '15172'),
    ('The Home Depot', '3786 US Highway 131 S', 'Cadillac', 'MI', '49601-8842', 'Wexford', 'rechargeable', '42982'),
    ('PEDEGO TRAVERSE CITY', '823 SOUTH GARFIELD AVE', 'TRAVERSE CITY', 'MI', '49684', 'Grand Traverse', 'ebike', '222200'),
    ('City Bike Shop - Traverse City', '747 E. 8th St,', 'Traverse City', 'MI', '49684', 'Grand Traverse', 'ebike', '218466'),
    ('Brick Wheels', '736 EAST EIGHTH ST', 'TRAVERSE CITY', 'MI', '49686', 'Grand Traverse', 'ebike', '207607'),
    ('Brick Wheels', '736 E 8th Street', 'Traverse City', 'MI', '49686', 'Grand Traverse', 'ebike', '223214'),
    ('Erik''s Bike Shop - Traverse City', '2786 Garfield Rd N', 'Traverse City', 'MI', '49686', 'Grand Traverse', 'ebike', '220975'),
    ('Mclain Cycle and Fitness', '2786 Garfield Rd N', 'Traverse City', 'MI', '49686', 'Grand Traverse', 'ebike', '205842'),
    ('The Home Depot', '2522 Crossing Cir', 'Traverse City', 'MI', '49684-7955', 'Grand Traverse', 'rechargeable', '42980'),
    ('Staples #0364', '2632 Crossing Cir', 'Traverse City', 'MI', '49684-7930', 'Grand Traverse', 'rechargeable;singleuse;cellphones', '65083'),
    ('Einstein Cycles - Traverse City', '1990 N. U.S. 31 N., Ste. G', 'Traverse City', 'MI', '49686', 'Grand Traverse', 'ebike', '220982'),
    ('Lowe''s', '3150 N US Highway 31 S', 'Traverse City', 'MI', '49684-4535', 'Grand Traverse', 'rechargeable;cellphones;highenergybattery', '72860'),
    ('Bayfront Beach & Bike', '130 River St', 'Elk Rapids', 'MI', '49629', 'Antrim', 'ebike', '208444'),
    ('The Home Depot', '1381 W Main St', 'Gaylord', 'MI', '49735-7401', 'Otsego', 'rechargeable', '42984'),
    ('Lowe''s', '600 Edelweiss Village Pkwy', 'Gaylord', 'MI', '49735-7752', 'Otsego', 'rechargeable;cellphones;highenergybattery', '71915'),
    ('Mackinac Wheels', '6929 Main Street', 'Mackinac Island', 'MI', '49757', 'Mackinac', 'ebike', '221110'),
    ('Revolution Bike', '102 Mason St.', 'Charlevoix', 'MI', '49720', 'Charlevoix', 'ebike', '213240'),
    ('Lowe''s', '2140 Anderson Rd', 'Petoskey', 'MI', '49770-9255', 'Emmet', 'rechargeable;cellphones;highenergybattery', '91271'),
    ('The Home Depot', '1700 Anderson Rd', 'Petoskey', 'MI', '49770-8393', 'Emmet', 'rechargeable', '42983'),
    ('Latitude 45 Bicycles and Fitness', '476 W Mitchell St', 'Petoskey', 'MI', '49770', 'Emmet', 'ebike', '211596'),
    ('High Gear Sports', '1171 N US 31', 'Petoskey', 'MI', '49770', 'Emmet', 'ebike', '206244'),
    ('The Home Depot', 'W8141 US Highway 2/141', 'Iron Mountain', 'MI', '49801-9425', 'Dickinson', 'rechargeable', '70638'),
    ('Ace Hardware', '1307 8th Ave', 'Menominee', 'MI', '49858-2762', 'Menominee', 'rechargeable;cellphones', '134326'),
    ('Lakeshore Bike', '505 N Lakeshore Blvd', 'Marquette', 'MI', '49855', 'Marquette', 'ebike', '206553'),
    ('Marquette County Solid Waste', '600 County Road NP', 'Marquette', 'MI', '49855', 'Marquette', 'rechargeable;cellphones', '66253'),
    ('Down Wind Sports - Marquette', '514 N Third St', 'Marquette', 'MI', '49855', 'Marquette', 'ebike', '213340'),
    ('Lowe''s', '3500 US 41 W', 'Marquette', 'MI', '49855-9486', 'Marquette', 'rechargeable;cellphones;highenergybattery', '116021'),
    ('Cross Country Sports', '507 Oak St', 'Calumet', 'MI', '49913', 'Houghton', 'ebike', '220139');

-- ================================================================
-- ANALYTICAL QUERIES
-- ================================================================

-- Q1: Counties with zero drop-off sites, sorted by income
SELECT county, median_household_income, income_quartile, population, rural_urban_class
FROM county_access
WHERE dropoff_count = 0
ORDER BY median_household_income ASC;


-- Q2: Average drop-off sites by income quartile
SELECT
    income_quartile,
    COUNT(*)                                    AS num_counties,
    SUM(dropoff_count)                          AS total_sites,
    ROUND(AVG(dropoff_count)::NUMERIC, 2)       AS avg_sites_per_county,
    ROUND(AVG(sites_per_100k)::NUMERIC, 3)      AS avg_sites_per_100k
FROM county_access
GROUP BY income_quartile
ORDER BY income_quartile;


-- Q3: Full county ranking — income vs access
SELECT
    county, median_household_income, dropoff_count, sites_per_100k,
    income_quartile, rural_urban_class,
    RANK() OVER (ORDER BY median_household_income ASC)  AS income_rank_poorest_first,
    RANK() OVER (ORDER BY sites_per_100k ASC)           AS access_rank_fewest_first
FROM county_access
ORDER BY median_household_income ASC;


-- Q4: Battery desert counties — stakeholder targets
SELECT county, median_household_income, population, income_quartile, rural_urban_class
FROM county_access
WHERE dropoff_count = 0
  AND income_quartile IN ('Q1_lowest', 'Q2')
ORDER BY median_household_income ASC;


-- Q5: Materials available by income quartile
SELECT
    ca.income_quartile,
    UNNEST(STRING_TO_ARRAY(bl.accepted_materials, ';')) AS material,
    COUNT(*) AS site_count
FROM battery_locations bl
JOIN county_access ca ON bl.county = ca.county
GROUP BY ca.income_quartile, material
ORDER BY ca.income_quartile, site_count DESC;


-- Q6: Per capita sites by county — Wayne County callout
SELECT
    county, dropoff_count, population, sites_per_100k, income_quartile, rural_urban_class,
    RANK() OVER (ORDER BY sites_per_100k DESC) AS per_capita_rank
FROM county_access
ORDER BY sites_per_100k DESC;


-- Q7: Desert counties by rural/urban classification
SELECT
    rural_urban_class,
    COUNT(*) AS desert_counties,
    ROUND(AVG(median_household_income)) AS avg_income
FROM county_access
WHERE dropoff_count = 0
GROUP BY rural_urban_class
ORDER BY desert_counties DESC;
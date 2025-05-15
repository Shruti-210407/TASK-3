use rainfall;

CREATE TABLE RegionZone (
    subdivision VARCHAR(100),
    Zone VARCHAR(50)
);

INSERT INTO RegionZone (subdivision, Zone) VALUES
('Andaman & Nicobar Islands', 'South'),
('Arunachal Pradesh', 'Northeast'),
('Assam & Meghalaya', 'Northeast'),
('Bihar', 'East'),
('East Uttar Pradesh', 'North'),
('West Uttar Pradesh', 'North'),
('Rajasthan', 'West'),
('Madhya Maharashtra', 'West'),
('Tamil Nadu', 'South'),
('Punjab', 'North'),
('Kerala', 'South'),
('Konkan & Goa', 'West'),
('Nagaland, Manipur, Mizoram & Tripura', 'Northeast'),
('Orissa', 'East'),
('Haryana, Chandigarh & Delhi', 'North'),
('Gujarat Region', 'West'),
('Vidarbha', 'Central'),
('West Bengal', 'East');

/*INNER JOIN Show only subdivisions present in both tables.*/

SELECT rz.Zone, AVG(rd.annual) AS AvgAnnualRainfall
FROM rainfall_2017 rd
INNER JOIN RegionZone rz ON rd.Subdivision = rz.Subdivision
GROUP BY rz.Zone
ORDER BY AvgAnnualRainfall DESC;

/* LEFT JOIN*/
SELECT rd.Subdivision, rz.Zone, rd.Year, rd.annual
FROM rainfall_2017 rd
LEFT JOIN RegionZone rz ON rd.subdivision = rz.subdivision
ORDER BY rd.Subdivision, rd.Year;

/* Right join*/
SELECT rz.Zone, rz.Subdivision, rd.Year, rd.annual
FROM rainfall_2017 rd
RIGHT JOIN RegionZone rz ON rd.Subdivision = rz.Subdivision
ORDER BY rz.Zone;

/*
Use LEFT JOIN when your main table is rainfall data and you want to keep all rainfall rows (even if zone is missing).

Use RIGHT JOIN when your main table is zones and you want to see every zone, even if no rainfall data is available for it.
*/
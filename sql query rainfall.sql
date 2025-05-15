use rainfall;

/*Average Annual Rainfall per Subdivision */ 
SELECT subdivision, AVG(annual) AS avg_annual_rainfall
FROM rainfall_2017
GROUP BY subdivision 
ORDER BY avg_annual_rainfall DESC; 

/*Top 5 Wettest Years (Nationwide)*/
SELECT Year, SUM(annual) AS Total_Rainfall
FROM rainfall_2017
GROUP BY Year
ORDER BY Total_Rainfall DESC
LIMIT 5;

/* Rainfall Trend in a Specific Region*/
SELECT Year, annual
from rainfall_2017
WHERE subdivision = 'Andaman & Nicobar Islands'
ORDER BY Year; 

/* Create a View of Seasonal Averages*/ 
CREATE VIEW SeasonalAvgRainfall AS
SELECT subdivision,
       AVG(JF) AS Avg_JF,
       AVG(MAM) AS Avg_MAM,
       AVG(JJAS) AS Avg_JJAS,
       AVG(OND) AS Avg_OND
FROM rainfall_2017
GROUP BY subdivision;
SELECT * FROM SeasonalAvgRainfall; 

/*Subdivisions with annual rainfall above 3000 mm*/
SELECT subdivision, year, annual
FROM rainfall_2017
WHERE annual > 3000
ORDER BY annual DESC;
 
/*Subdivisions with rainfall greater than the overall average*/
SELECT subdivision, year, annual
from rainfall_2017
where annual > (
	select avg(annual) from rainfall_2017
);

/*Maximum Rainfall in July 2015 and Corresponding Subdivision*/
SELECT subdivision, 'Jul' as July_Rainfall
from rainfall_2017
where year = 2015
and 'Jul' = (
     select max('Jul')
     from rainfall_2017 
     where year = 2015
);  

/*Max rainfall in each subdivision*/ 
SELECT subdivision, MAX(Annual) AS MaxRainfall
FROM rainfall_2017
GROUP BY Subdivision;

CREATE INDEX idx_subdivision ON rainfall_2017(subdivision(50));





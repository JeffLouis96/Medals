-- View entire table
SELECT * FROM medals.summer_medals

-- This select statement retrieves distinct years from the "medals.summer_medals" table, assigns a row number to each year, and orders the result by year in ascending order.
SELECT
  year,
  ROW_NUMBER() OVER() AS Row_N
FROM (
  SELECT DISTINCT year 
  FROM medals.summer_medals
  ORDER BY year ASC
) AS Years
ORDER BY year ASC;

-- This select statement retrieves distinct years from the "medals.summer_medals" table, assigns a row number to each year, and orders the result by year in descending order.
SELECT
  year,
  ROW_NUMBER() OVER (ORDER BY year desc ) AS Row_N
FROM (
  SELECT DISTINCT year
  FROM medals.summer_medals
) AS Years
ORDER BY year;

-- This common table expression (CTE) named "Tennis_Gold" selects distinct gender, year, and country from the "medals.summer_medals" table where the year is greater than or equal to 2000, the event is 'Javelin Throw', and the medal is 'Gold'.
-- The main select statement retrieves the gender, year, country as champion, and the country of the last champion using the LAG function over the partition of gender and ordered by year in ascending order.
SELECT
  Gender, Year,
  Country AS Champion,
  LAG(Country) OVER (PARTITION BY Gender
                         ORDER BY Year ASC) AS Last_Champion
FROM Tennis_Gold
ORDER BY Gender ASC, Year ASC;

-- This common table expression (CTE) named "Athletics_Gold" selects distinct gender, year, event, and country from the "medals.summer_medals" table where the year is greater than or equal to 2000, the discipline is 'Athletics', the event is either '100M' or '10000M', and the medal is 'Gold'.
-- The main select statement retrieves the gender, year, event, and the country of the last champion using the LAG function over the partition of gender and event, ordered by year in ascending order.
SELECT
  Gender, Year, Event,
  lag(Country) OVER (partition by Gender,event
            ORDER BY Year ASC) AS Last_Champion
FROM Athletics_Gold
ORDER BY Event ASC, Gender ASC, Year ASC;

-- This common table expression (CTE) named "Discus_Medalists" selects distinct year and athlete from the "medals.summer_medals" table where the medal is 'Gold', the event is 'Discus Throw', the gender is 'Women', and the year is greater than or equal to 2000.
-- The main select statement retrieves the year, athlete, and the athlete of the future champion using the LEAD function over the order of year in ascending order, with a lead offset of 3.
SELECT
  year,
  Athlete,
  lead(Athlete,3) OVER (ORDER BY year ASC) AS Future_Champion
FROM Discus_Medalists
ORDER BY Year ASC;
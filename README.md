# Summer Olympics Medal 

Queries Overview
Retrieving Distinct Years with Row Numbers

Description: This query retrieves distinct years from the "medals.summer_medals" table, assigns a row number to each year, and orders the result by year in ascending order. It also includes a variation of the query that orders the years in descending order.

Analyzing Tennis Gold Medalists

Description: This query uses a Common Table Expression (CTE) named "Tennis_Gold" to select distinct gender, year, and country for tennis events where the medal is 'Gold'. It then identifies champions and the country of the last champion using the LAG function over the partition of gender and ordered by year in ascending order.

Analyzing Athletics Gold Medalists

Description: This query uses a Common Table Expression (CTE) named "Athletics_Gold" to select distinct gender, year, event, and country for athletics events ('100M' or '10000M') where the medal is 'Gold'. It then identifies champions and the country of the last champion using the LAG function over the partition of gender and event, ordered by year in ascending order.

Analyzing Discus Throw Gold Medalists

Description: This query uses a Common Table Expression (CTE) named "Discus_Medalists" to select distinct years and athletes for the 'Discus Throw' event where the medal is 'Gold', the gender is 'Women', and the year is greater than or equal to 2000. It then identifies athletes and the athlete of the future champion using the LEAD function over the order of years in ascending order, with a lead offset of 3.

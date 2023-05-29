-- 2. for each team print total silver medals and year in which they won maximum silver medal. output 3 columns team,total_silver_medals, year_of_max_silver


SELECT Y.team,
Y.total_silver_medals,
Y.year_of_max_silver
FROM (  
		SELECT X.team, 
		SUM(X.silver_medals) AS total_silver_medals,
		X.`year` AS year_of_max_silver,
		MAX(X.silver_medals) max_year_silver_medals
		FROM (
				SELECT 
				ats.team,
				eve.`year`,
				COUNT(eve.medal) as silver_medals
				FROM athlets AS ats
				LEFT JOIN athlete_events AS eve ON eve.athlete_id = ats.id
				WHERE eve.medal = "Silver"
				GROUP BY ats.team, eve.`year`
		) X
		GROUP BY X.team
) Y 
ORDER BY Y.total_silver_medals DESC;
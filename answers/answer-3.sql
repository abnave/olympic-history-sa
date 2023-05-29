-- 3. Which player has won maximum gold medals amongst the players which have won only gold medal (never won silver or bronze) over the years.
SELECT 
ats.name, 
Y.total_gold_medals,
Y.total_other_medals
FROM
athlets AS ats
LEFT JOIN (
	SELECT X.athlete_id, 
	SUM(X.gold_medal_count) AS total_gold_medals, 
	SUM(X.other_medal_count) AS total_other_medals
	FROM (
		SELECT 
		atev.athlete_id,  
		COUNT(*) AS gold_medal_count, 
		0 AS other_medal_count
		FROM athlete_events AS atev
		WHERE atev.medal = "Gold"
		GROUP BY atev.athlete_id
		
		UNION ALL
		
		SELECT 
		atev.athlete_id, 
		0 AS gold_medal_count, 
		COUNT(*) AS other_medal_count
		FROM athlete_events AS atev
		WHERE atev.medal = "Silver" OR atev.medal = "Bronze"
		GROUP BY atev.athlete_id
	) X
	GROUP BY X.athlete_id
	HAVING total_other_medals = 0
) Y ON Y.athlete_id = ats.id
ORDER BY Y.total_gold_medals DESC;
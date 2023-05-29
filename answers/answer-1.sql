-- 1. which team has won the maximum gold medals over the years.

SELECT X.team, X.gold_medals FROM (SELECT 
ats.team,
COUNT(eve.medal) as gold_medals 
FROM athlets AS ats
LEFT JOIN athlete_events AS eve ON eve.athlete_id = ats.id
WHERE eve.medal = "Gold"
GROUP BY team) X 
ORDER BY X.gold_medals DESC
LIMIT 1;
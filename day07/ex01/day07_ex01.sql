SELECT
    (SELECT name FROM person WHERE person.id = person_visits.person_id), 
    count (*) AS count_of_visits
FROM person_visits
GROUP BY 1
ORDER BY 2 DESC, 1
LIMIT 4;
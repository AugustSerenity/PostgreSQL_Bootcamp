SELECT 
COALESCE(person.name, '-') AS "person_name", 
d.visit_date AS "visit_date",
COALESCE (pizzeria.name, '-') AS "pizzeria_name"
FROM person FULL OUTER JOIN 
    (SELECT *
    FROM person_visits WHERE visit_date BETWEEN '2022-01-01' AND '2022-01-3') AS d
ON person.id=d.person_id
FULL OUTER JOIN pizzeria ON pizzeria.id = d.pizzeria_id
ORDER BY 1,2,3;





SELECT name 
FROM pizzeria
WHERE id NOT IN
    (SELECT pizzeria_id FROM person_visits);

SELECT name 
FROM pizzeria AS a
where not EXISTS
(SELECT distinct pizzeria_id FROM person_visits AS b where b.pizzeria_id=a.id );

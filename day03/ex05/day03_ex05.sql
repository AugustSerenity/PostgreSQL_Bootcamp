
WITH 
visit AS (
    SELECT 
    piz.name AS "pizzeria_name"
    FROM pizzeria AS piz 
    JOIN person_visits AS pv ON pv.pizzeria_id = piz.id 
    JOIN person AS p ON p.id = pv.person_id
    WHERE p.name = 'Andrey'
),
buy AS (
    SELECT 
    piz.name AS "pizzeria_name"
    FROM pizzeria AS piz 
    JOIN menu AS m ON m.pizzeria_id = piz.id
    JOIN person_order AS po ON po.menu_id = m.id 
    JOIN person AS p ON p.id = po.person_id
    WHERE p.name = 'Andrey'
)
SELECT
visit.pizzeria_name
FROM visit
EXCEPT
SELECT
buy.pizzeria_name
FROM buy
ORDER BY 1;

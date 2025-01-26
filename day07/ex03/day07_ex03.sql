WITH 
    pv AS (
        SELECT pizzeria.name, 
        count (*) AS count
        FROM person_visits
        JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
        GROUP BY 1
        ORDER BY 2 DESC, 1
    ),  
    po AS (
        SELECT pizzeria.name, 
        count(*) AS count
        FROM person_order
        JOIN menu ON menu.id = person_order.menu_id
        JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
        GROUP BY 1
        ORDER BY 2 DESC, 1
    )
SELECT po.name, 
(pv.count + po.count) AS total_count
FROM pv
JOIN po ON po.name = pv.name
ORDER BY 2 DESC, 1;




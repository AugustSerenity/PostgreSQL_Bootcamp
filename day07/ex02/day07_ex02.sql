WITH 
    pv AS (
        SELECT pizzeria.name, 
        count (*),
        'visit' AS action_type
        FROM person_visits
        JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
        GROUP BY 1
        ORDER BY 2 DESC, 1 
        LIMIT 3
    ),
    po AS (
        SELECT pizzeria.name, 
        count(*),
        'order' AS action_type
        FROM person_order
        JOIN menu ON menu.id = person_order.menu_id
        JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
        GROUP BY 1
        ORDER BY 2 DESC, 1 
        LIMIT 3
    )
SELECT * FROM pv 
UNION
SELECT * FROM po
ORDER BY 3,2 DESC;

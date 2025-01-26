
WITH m_id(menu_id) AS (
    (SELECT menu.id AS "menu_id"
    FROM menu
    EXCEPT SELECT person_order.menu_id
    FROM person_order
    ORDER BY 1)
)
SELECT 
menu.pizza_name AS "pizza_name",
menu.price AS "price",
pizzeria.name AS "pizzeria_name"
FROM menu
JOIN m_id ON menu.id = m_id.menu_id
JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
ORDER BY 1, 2;

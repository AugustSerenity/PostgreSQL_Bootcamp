

SELECT
menu.pizza_name AS "pizza_name",
pizzeria.name AS "pizzeria_name",
menu.price AS "price"
FROM menu 
JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
WHERE menu.pizza_name = 'mushroom pizza' OR menu.pizza_name = 'pepperoni pizza'
ORDER BY 1, 2;
SELECT 
    person.name AS name,
    menu.pizza_name,
    menu.price,
    ROUND (menu.price * (100 - person_discounts.discount) / 100, 2) AS discount_price,
    pizzeria.name AS pizzeria_name
FROM person
JOIN person_order ON person_order.person_id = person.id
JOIN menu ON menu.id = person_order.menu_id
JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
JOIN person_discounts 
    ON person_discounts.pizzeria_id = pizzeria.id 
    AND person_discounts.person_id = person.id 
ORDER BY 1, 2;
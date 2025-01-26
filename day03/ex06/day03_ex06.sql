
WITH
piz_1 AS (
    SELECT
    menu.pizza_name,
    piz_1.name AS "pizzeria_name_1",
    menu.price,
    piz_1.id
    FROM pizzeria AS piz_1
    JOIN menu ON menu.pizzeria_id = piz_1.id 
),
piz_2 AS (
    SELECT
    menu.pizza_name,
    piz_2.name AS "pizzeria_name_2",
    menu.price,
    piz_2.id
    FROM pizzeria AS piz_2
    JOIN menu ON menu.pizzeria_id = piz_2.id 
)
SELECT
piz_1.pizza_name,
piz_1.pizzeria_name_1,
piz_2.pizzeria_name_2,
piz_1.price
FROM piz_1
JOIN piz_2 ON piz_2.pizza_name = piz_1.pizza_name
WHERE piz_1.price = piz_2.price AND piz_2.pizza_name = piz_1.pizza_name 
AND piz_1.id > piz_2.id
ORDER BY 1;

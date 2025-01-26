
INSERT INTO person_discounts(id, person_id, pizzeria_id, discount)
SELECT ROW_NUMBER() OVER () AS id,
    (SELECT person_id FROM person WHERE id = person_id) AS person_id,
    (SELECT pizzeria_id FROM menu WHERE id = menu_id) AS pizzeria_id,
CASE 
    WHEN COUNT(person_order.person_id) = 1 THEN 10.5
    WHEN COUNT(person_order.person_id) = 2 THEN 22
    ELSE 30 
END
FROM person_order
GROUP BY 2, 3;

--DROP TABLE person_discounts;




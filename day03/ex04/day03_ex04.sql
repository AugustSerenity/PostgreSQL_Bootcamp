WITH sladkie_kiski AS (
   SELECT DISTINCT
    pizzeria.name AS "pizzeria",
    COUNT(*)
    FROM person 
    JOIN person_order ON person_order.person_id = person.id
    JOIN menu ON menu.id = person_order.menu_id
    JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
    WHERE person.gender = 'female' 
    GROUP BY pizzeria
),
    malchiki_fanera AS (
    SELECT DISTINCT
    pizzeria.name AS "pizzeria",
    COUNT(*)
    FROM person 
    JOIN person_order ON person_order.person_id = person.id
    JOIN menu ON menu.id = person_order.menu_id
    JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
    WHERE person.gender = 'male' 
    GROUP BY pizzeria
),
    k_m AS (SELECT * 
            FROM sladkie_kiski
            EXCEPT 
            SELECT  *
            FROM malchiki_fanera
),
    m_k AS (SELECT * 
        FROM malchiki_fanera
        EXCEPT 
        SELECT  *
        FROM sladkie_kiski
),
    kk_mm AS (SELECT *
           FROM k_m
           UNION 
           SELECT *
           FROM m_k
)
SELECT
sladkie_kiski.pizzeria AS "pizzeria_name"
FROM sladkie_kiski
EXCEPT
SELECT
malchiki_fanera.pizzeria AS "pizzeria_name"
FROM malchiki_fanera
ORDER BY 1;

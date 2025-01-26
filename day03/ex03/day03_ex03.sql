
WITH sladkie_kiski AS (
    SELECT
    piz.name AS "pizzeria",
    COUNT(*)
    FROM person AS vm
    JOIN person_visits AS pv ON pv.person_id = vm.id
    JOIN pizzeria AS piz ON piz.id = pv.pizzeria_id
    WHERE vm.gender = 'female'
    GROUP BY pizzeria
),
    malchiki_fanera AS (
    SELECT
    piz.name AS "pizzeria",
    COUNT(*)
    FROM person AS vm
    JOIN person_visits AS pv ON pv.person_id = vm.id
    JOIN pizzeria AS piz ON piz.id = pv.pizzeria_id
    WHERE vm.gender = 'male'
    GROUP BY pizzeria
),
    k_m AS (SELECT * 
            FROM sladkie_kiski
            EXCEPT ALL
            SELECT  *
            FROM malchiki_fanera
),
    m_k AS (SELECT * 
        FROM malchiki_fanera
        EXCEPT ALL
        SELECT  *
        FROM sladkie_kiski
),
    kk_mm AS (SELECT *
           FROM k_m
           UNION ALL
           SELECT *
           FROM m_k
)
SELECT
sladkie_kiski.pizzeria AS "pizzeria_name"
FROM sladkie_kiski
JOIN malchiki_fanera ON malchiki_fanera.pizzeria = sladkie_kiski.pizzeria
where malchiki_fanera.count <> sladkie_kiski.count
ORDER BY 1;

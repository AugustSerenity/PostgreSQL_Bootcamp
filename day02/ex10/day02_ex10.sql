SELECT
n1.name AS "person_name1",
n2.name AS "person_name2",
n1.address AS "common_address"
FROM person AS n1
CROSS JOIN person AS n2 
WHERE n1.name != n2.name AND n1.address = n2.address
AND n1.id > n2.id
ORDER BY 1, 2, 3;


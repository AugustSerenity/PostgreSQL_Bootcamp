WITH adress AS 
        (SELECT person.address,
        ROUND((MAX(person.age) - (MIN(person.age) * 1.0/MAX(person.age))), 2) AS formula,
        ROUND(AVG(person.age), 2) AS average
        FROM person
        GROUP BY 1
        ORDER BY 1
    )
SELECT *,
CASE 
    WHEN formula > average THEN true  
    ELSE false
END AS comparison
FROM adress;
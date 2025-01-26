
CREATE VIEW v_symmetric_union AS
((SELECT person_visits.person_id AS "person"
        FROM person_visits
        WHERE person_visits.visit_date BETWEEN '2022-01-01' AND ' 2022-01-02'
EXCEPT
SELECT person_visits.person_id AS "person"
        FROM person_visits
        WHERE person_visits.visit_date BETWEEN '2022-01-01' AND ' 2022-01-06')
UNION
(SELECT person_visits.person_id AS "person"
        FROM person_visits
        WHERE person_visits.visit_date BETWEEN '2022-01-01' AND ' 2022-01-06'
EXCEPT
SELECT person_visits.person_id AS "person"
        FROM person_visits
        WHERE person_visits.visit_date BETWEEN '2022-01-01' AND ' 2022-01-06'));
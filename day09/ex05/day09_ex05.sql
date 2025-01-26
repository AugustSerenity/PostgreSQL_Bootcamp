DROP FUNCTION fnc_persons_male() CASCADE;
DROP FUNCTION fnc_persons_female() CASCADE;

CREATE FUNCTION fnc_persons(pgender VARCHAR DEFAULT 'female')
    RETURNS TABLE(
                person_id bigint,
                name      varchar,
                age       integer,
                gender    varchar,
                address   varchar
            )
AS
$$
SELECT id, name, age, gender, address
FROM person
WHERE gender = pgender;
$$ LANGUAGE SQL;


select *
from fnc_persons(pgender := 'male');

select *
from fnc_persons();




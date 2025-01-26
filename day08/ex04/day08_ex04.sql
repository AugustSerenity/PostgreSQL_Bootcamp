-- сессия 1
BEGIN TRANSACTION ISOLATION LEVEL SERIALIZABLE;
-- сессия 2
BEGIN TRANSACTION ISOLATION LEVEL SERIALIZABLE;

-- сессия 1
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

-- сессия 2
UPDATE pizzeria SET rating = 3.0 WHERE name = 'Pizza Hut';
-- сессия 2
COMMIT;

-- сессия 1
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
-- сессия 1
COMMIT;
-- сессия 1
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

-- сессия 2
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';



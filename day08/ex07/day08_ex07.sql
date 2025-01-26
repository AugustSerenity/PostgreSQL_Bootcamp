-- сессия 1
BEGIN;

-- сессия 2
BEGIN;

-- сессия 1
UPDATE pizzeria SET rating = 1 WHERE id = 1;

-- сессия 2
UPDATE pizzeria SET rating = 2 WHERE id = 2;

-- сессия 1
UPDATE pizzeria SET rating = 3 WHERE id = 2;

-- сессия 2
UPDATE pizzeria SET rating = 2 WHERE id = 1;

-- сессия 1
COMMIT;

-- сессия 2
COMMIT;

-- сессия 1
BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;
-- сессия 2
BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;

-- сессия 1
SELECT SUM(rating) FROM pizzeria;

-- сессия 2
UPDATE pizzeria SET rating = 1 WHERE name = 'Pizza Hut';
-- сессия 2
COMMIT;

-- сессия 1
SELECT SUM(rating) FROM pizzeria;
-- сессия 1
COMMIT;
-- сессия 1
SELECT SUM(rating) FROM pizzeria;

-- сессия 2
SELECT SUM(rating) FROM pizzeria;
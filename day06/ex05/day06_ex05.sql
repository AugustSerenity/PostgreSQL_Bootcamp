COMMENT ON TABLE person_discounts IS 'Table with discounts for customers';
COMMENT ON COLUMN person_discounts.id IS 'PRIMARY KEY';
COMMENT ON COLUMN person_discounts.person_id IS 'FOREIGIN KEY from person table';
COMMENT ON COLUMN person_discounts.pizzeria_id IS 'FOREIGIN KEY from pizzeria table';
COMMENT ON COLUMN person_discounts.discount IS 'personal discount';

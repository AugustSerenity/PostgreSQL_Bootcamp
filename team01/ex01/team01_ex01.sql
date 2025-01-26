-- -- insert into currency values (100, 'EUR', 0.85, '2022-01-01 13:29');
-- -- insert into currency values (100, 'EUR', 0.79, '2022-01-08 13:29');

WITH cur AS 
(
    SELECT 
        balance.user_id,
        balance.money,
        currency.name,
        (
            SELECT rate_to_usd
            FROM currency
            WHERE currency.id = balance.currency_id
                AND currency.updated < balance.updated
            ORDER BY rate_to_usd
            LIMIT 1
        ) AS min, 
        (
            SELECT rate_to_usd
            FROM currency
            WHERE currency.id = balance.currency_id
                AND currency.updated > balance.updated
            ORDER BY rate_to_usd
            LIMIT 1
        ) AS max
    FROM currency
    JOIN balance ON balance.currency_id = currency.id
    GROUP BY balance.user_id, balance.money, currency.name, balance.currency_id, balance.updated
    ORDER BY min DESC, max, balance.updated
)

SELECT
    COALESCE(public.user.name, 'not defined') AS name,
    COALESCE(lastname, 'not defined') AS lastname, 
    cur.name AS currency_name,
    CAST(cur.money * COALESCE(min, max) AS FLOAT) AS currency_in_usd
FROM cur
LEFT JOIN public.user ON public.user.id = cur.user_id
ORDER BY name DESC, lastname, currency_name;
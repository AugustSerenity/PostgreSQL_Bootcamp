WITH 

RECURSIVE tour AS(
    SELECT * FROM initial

    UNION
    
    SELECT
        tour.point1,
        nodes.point2,
        tour.cost + nodes.cost,
        routes || ARRAY[nodes.point2::text]
    FROM tour
        JOIN nodes ON nodes.point1 = tour.point2
    WHERE
        nodes.point2 NOT IN (SELECT UNNEST(routes))
),

initial AS (
    SELECT *,
        ARRAY [point1::text, point2::text] AS routes
    FROM nodes 
    WHERE point1 = 'a'
),

make_circuit AS(
    SELECT
        cost + ( SELECT cost FROM nodes WHERE
                nodes.point1 = tour.point2
                AND nodes.point2 = 'a') AS total_cost,
        tour.routes || ARRAY['a'] AS tour
    FROM tour
    WHERE array_length(routes, 1) = 4
)

SELECT * FROM make_circuit
-- WHERE total_cost = (SELECT min(total_cost) FROM make_circuit) 
-- OR total_cost = (SELECT max(total_cost) FROM make_circuit)
ORDER BY 1, 2;
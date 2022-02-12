-- https://www.codewars.com/kata/5db5ff03d10bfa001da9cf2e/train/sql

SELECT
    id,
    network(ip_address)::text AS first_address,
    broadcast(ip_address)::text AS last_address
FROM connections
ORDER BY id;

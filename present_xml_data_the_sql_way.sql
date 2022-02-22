-- https://www.codewars.com/kata/5db039743affec0027375de0/train/sql

WITH parsed_xml AS (
    SELECT
        first_name,
        last_name,
        date_of_birth,
        email_address,
        private
    FROM
        users,
        xmltable(
            '/data/user' PASSING data
            COLUMNS
                first_name TEXT,
                last_name TEXT,
                date_of_birth TEXT,
                email_address TEXT PATH 'email_addresses/address[1]',
                private BOOL
    )
)
SELECT
    first_name,
    last_name,
    extract('year' from age(now(), date_of_birth::timestamp)) AS age,
    CASE
        WHEN private IS true THEN 'Hidden'
        WHEN email_address LIKE '%@%' THEN email_address
        ELSE 'None'
    END AS email_address
FROM parsed_xml
ORDER BY first_name, last_name;


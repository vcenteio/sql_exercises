-- https://www.codewars.com/kata/5a3fe3dde1ce0e8ed6000097/train/sql

SELECT
    CAST(
        LEFT(
            CAST(
                DATE_TRUNC(
                    'century',
                    TO_TIMESTAMP(CAST(yr AS text), 'YYYY')
                ) AS text
            ),
            2
        ) AS integer
    ) + 1 AS century
FROM years;
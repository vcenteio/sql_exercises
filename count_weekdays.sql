-- https://www.codewars.com/kata/58241d05e7a162c5b100010f/train/sql

CREATE OR REPLACE FUNCTION weekdays(date1 date, date2 date) RETURNS INTEGER
    LANGUAGE plpgsql
    AS $$
        DECLARE
            monday integer := 0;
            saturday integer := 6;
            days_between integer := abs(date1::date - date2::date) - 1;
        BEGIN
            RETURN(
                SELECT
                    count(*)
                FROM generate_series(0, days_between) AS i
                WHERE extract(dow FROM (date1::date + i)::timestamp) NOT IN (monday, saturday)
            );
        END;
    $$;

-- https://www.codewars.com/kata/55f9bca8ecaa9eac7100004a/solutions/sql

CREATE FUNCTION to_milliseconds(h integer, m integer, s integer) RETURNS bigint
    LANGUAGE plpgsql
    IMMUTABLE
    AS $$
        BEGIN
            RETURN (h * 3600 + m * 60 + s) * 1000;
        END;
    $$;

SELECT to_milliseconds(h, m, s) AS res FROM past;

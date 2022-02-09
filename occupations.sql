-- https://www.hackerrank.com/challenges/occupations/

-- For MS SQL Server
select d, p, s, a
from
    (select name d, row_number() over (order by name) rn from occupations where occupation = 'Doctor') as doctors
full join
    (select name p, row_number() over (order by name) rn from occupations where occupation = 'Professor') as professors
    on doctors.rn = professors.rn
full join
    (select name s, row_number() over (order by name) rn from occupations where occupation = 'Singer') as singers
    on professors.rn = singers.rn
full join
    (select name a, row_number() over (order by name) rn from occupations where occupation = 'Actor') as actors
    on singers.rn = actors.rn
;


-- For PostgreSQL (local exercise)
select d, p, s, a
from
    (select distinct name d, row_number() over (order by name) rn from occupations where occupation = 'Doctor' order by rn NULLS LAST) as doctors
full join
    (select distinct name p, row_number() over (order by name) rn from occupations where occupation = 'Professor' order by rn NULLS LAST) as professors
    on doctors.rn = professors.rn
full join
    (select distinct name s, row_number() over (order by name) rn from occupations where occupation = 'Singer' order by rn NULLS LAST) as singers
    on professors.rn = singers.rn
full join
    (select distinct name a, row_number() over (order by name) rn from occupations where occupation = 'Actor' order by rn NULLS LAST) as actors
    on singers.rn = actors.rn
;


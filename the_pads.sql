-- https://www.hackerrank.com/challenges/the-pads/

select concat(o.name, '(', left(o.occupation, 1), ')')
from occupations o
order by o.name;

select concat('There are a total of ', count(o.occupation) , ' ', lower(o.occupation), 's.')
from occupations o
group by o.occupation
order by count(o.occupation);

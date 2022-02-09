-- https://www.hackerrank.com/challenges/what-type-of-triangle/

select
    case
        when not a + b > c and a + c > b and b + c > a then 'Not A Triangle'
        when a in (b, c) or b = c then
            case
                when a = b and b = c then 'Equilateral'
                else 'Isosceles'
            end
        else 'Scalene'
    end
from triangles;

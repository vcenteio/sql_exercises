-- https://www.codewars.com/kata/5c0ae69d5f72394e130025f6/train/sql

SELECT name, greeting, SUBSTRING(SUBSTRING(greeting, '#\d+') from 2) user_id
FROM greetings;

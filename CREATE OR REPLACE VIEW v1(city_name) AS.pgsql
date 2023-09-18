CREATE OR REPLACE VIEW v1(city_name) AS
SELECT name as city_name
FROM Cities
WHERE population>10000000
AND capital='primary'
;

CREATE OR REPLACE VIEW v2 (country_name, capital_count) AS
With capital_num as
 (SELECT c.name as country_name, count(*) as capital_count
 FROM countries c, cities t
 Where c.iso2=t.country_iso2
 and t.capital='primary'
 group by c.name)
select *
from capital_num
where capital_count>1
;

CREATE OR REPLACE VIEW v3 (country_name) AS
select a1.name as country_name
from countries a1, countries a2
where (a1.gdp/a1.population)>
(a2.gdp/a2.population)
and a2.iso2='SG'
and a1.continent='Europe'
;



CREATE OR REPLACE VIEW v4 (country_name) AS
with city_num as
 (select c.name, count(*) as num_city
 from countries c, cities t
 where c.iso2=t.country_iso2
 group by c.iso2),

 capital_num as
 (SELECT c.name, count(*) as num_capital
 FROM countries c, cities t
 Where c.iso2=t.country_iso2
 and t.capital='primary'
 group by c.name)

select ct.name as country_name
from city_num ct inner join capital_num cp
    on ct.num_city=cp.num_capital
where ct.name=cp.name
;

CREATE OR REPLACE VIEW v5 (country_name, num_domestic_flights) AS
select c1.name as country_name, num_domestic_flights
from (select country_iso2, count(*) as num_domestic_flights
from (select a1.country_iso2
from airports a1, airports a2, connections c
where c.from_code=a1.code
and c.to_code=a2.code
and a1.country_iso2=a2.country_iso2) domestic 
group by country_iso2) d, countries c1
where c1.iso2=d.country_iso2
and num_domestic_flights>100
order by num_domestic_flights desc
;

CREATE OR REPLACE VIEW v6 (country_name1, country_name2) AS

select c2.name as country_name1, c3.name as country_name2
from (
select country1_iso2,country2_iso2
from 
(select country1_iso2,country2_iso2 
from borders b, countries c
where b.country1_iso2=c.iso2
and c.continent='Asia') a, countries c1
where a.country2_iso2=c1.iso2
and c1.continent='Asia') aa, countries c2, countries c3
where aa.country1_iso2=c2.iso2
and aa.country2_iso2=c3.iso2
and c2.population<c3.population
;

CREATE OR REPLACE VIEW v7 (country_name) AS

select c2.name as country_name
from countries c2
where c2.continent='Asia'
and c2.iso2 not in(
select DISTINCT v.iso2
from visited v, countries c, users u
where v.iso2=c.iso2
and c.continent='Asia'
and v.user_id=u.user_id
and u.name in('Marie','Bill','Sam','Sarah'))
;


CREATE OR REPLACE VIEW v8 (city_name) AS
select city as city_name
from airports
where code in((select r2.to_code
from routes r1, routes r2
where r1.from_code='SIN'
and r1.airline_code='SQ'
and r2.airline_code='SQ'
and r1.to_code in(select code from airports where country_iso2 in(
    select iso2 from countries where continent='Europe'
))
and r2.from_code=r1.to_code
and r2.to_code in(select code from airports where country_iso2='US'))
union
(select to_code
from routes
where from_code='SIN'
and airline_code='SQ'
and to_code in(select code from airports where country_iso2='US')))
;

CREATE OR REPLACE VIEW v9 (country_name, crossing_count) AS
with RECURSIVE path as(
    select country1_iso2, country2_iso2, 1 as stops
    from borders
    WHERE country1_iso2='MY'
    union all
    SELECT b.country1_iso2,b.country2_iso2,p.stops+1
    from path p,borders b
    where p.country2_iso2=b.country1_iso2
    and p.stops<=9
)
select country_name, min(crossing_count) as crossing_count
from(SELECT distinct c.name as country_name, stops as crossing_count
from path p1, countries c
where c.iso2=p1.country2_iso2
and c.continent='Africa'
order by stops asc) s
group by country_name
order by crossing_count asc
;


CREATE OR REPLACE VIEW v10 (airport_name) AS
select name as airport_name
from airports
where code in
((select c.from_code
from connections c, airports a, countries cn
where c.to_code=a.code
and a.country_iso2=cn.iso2
and cn.continent='Africa')
INTERSECT
(select c.from_code
from connections c, airports a, countries cn
where c.to_code=a.code
and a.country_iso2=cn.iso2
and cn.continent='Asia')
INTERSECT
(select c.from_code
from connections c, airports a, countries cn
where c.to_code=a.code
and a.country_iso2=cn.iso2
and cn.continent='South America')
INTERSECT
(select c.from_code
from connections c, airports a, countries cn
where c.to_code=a.code
and a.country_iso2=cn.iso2
and cn.continent='North America')
INTERSECT
(select c.from_code
from connections c, airports a, countries cn
where c.to_code=a.code
and a.country_iso2=cn.iso2
and cn.continent='Europe')
INTERSECT
(select c.from_code
from connections c, airports a, countries cn
where c.to_code=a.code
and a.country_iso2=cn.iso2
and cn.continent='Oceania'))
;



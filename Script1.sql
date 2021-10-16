create temp table percent as (select final_finding, count(*) as cnt 
from data_officerallegation 
group by final_finding); select * from percent; 
select final_finding, cnt, cnt * 100/ (select sum(cnt) as s from percent) 
from percent;

/*3 a*/
drop table if exists allegation3_all;
create temp table allegation3_all as(
select count(*) as count1, da.category,dao.final_outcome from
data_officerallegation dao
INNER JOIN data_allegationcategory da
on dao.allegation_category_id = da.id
where dao.final_outcome = 'Administrative Termination'
       or dao.final_outcome = 'Resigned' or
      dao.final_outcome = 'Resigned -Not Served' or dao.final_outcome = 'Suspended Indefinitely'
group by da.category, dao.final_outcome);

select sum(count1) as count,category from allegation3_all group by category order by count;
select sum(count1) as count,category from allegation3_all group by category order by count desc;




/*b) What are the complaint categories with no severe consequences (no action taken, penalty not served, reprimand,
  separated other case, separation, sustained - no penalty, violation noted)?*/

drop table if exists allegation4_all;
create temp table allegation4_all as(
select count(*) as count1, da.category,dao.final_outcome from
data_officerallegation dao
INNER JOIN data_allegationcategory da
on dao.allegation_category_id = da.id
where dao.final_outcome = 'No Action Taken' or dao.final_outcome = 'Penalty Not Served' or
      dao.final_outcome = 'Reprimand' or dao.final_outcome = 'Separated Other Case' or
      dao.final_outcome = 'Separation' or dao.final_outcome = 'Sustained-No Penalty' or
      dao.final_outcome = 'Violation Noted'
group by da.category, dao.final_outcome);

select sum(count1) as count,category from allegation4_all group by category order by count;
select sum(count1) as count,category from allegation4_all group by category order by count desc;
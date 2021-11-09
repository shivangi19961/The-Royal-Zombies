/*1. What percent of total complaints are sustained depending on the allegation
category?*/
drop table  if exists allegation_su;
create temp table allegation_su as(
select count(*) as count1, da.category from
data_officerallegation dao
INNER JOIN data_allegationcategory da
on dao.allegation_category_id = da.id
WHERE dao.final_finding = 'SU'
group by da.category);

drop table if exists allegation_all;
create temp table allegation_all as(
select count(*) as count2, da.category from
data_officerallegation dao
INNER JOIN data_allegationcategory da
on dao.allegation_category_id = da.id
group by da.category);

drop table if exists allegations;
create temp table allegations as(
select aas.count1,aa.count2, aas.category from
allegation_su aas
INNER JOIN allegation_all aa
on aas.category = aa.category);

select (count1 * 100/count2) as percentage,category from allegations order by percentage;
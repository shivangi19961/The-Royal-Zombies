# The-Royal-Zombies
# This is a read me file 
1. What percent of disciplinary actions are sustained over a period of time?

create temp table percent as (select final_finding, count(*) as cnt from data_officerallegation group by final_finding);
select * from percent;
select final_finding, cnt,
cnt * 100/ (select sum(cnt) as s from percent)
from percent;


2. What is the difference between sustained and unsustained complaints from civilian and police officers?
select is_officer_complaint, count(*) from data_allegation group by is_officer_complaint;
select data_officerallegation.final_finding, data_allegation.is_officer_complaint, count(*) as cnt
from data_officerallegation full join data_allegation
on data_officerallegation.updated_at = data_allegation.updated_at
group by data_officerallegation.final_finding, data_allegation.is_officer_complaint;


3. What is the background (age, race, location, rank) of police officers for which complaints were sustained against? 

--for race
select data_officer.race, data_officerallegation.final_finding, count(*) as total
from data_officer
INNER JOIN data_officerallegation
ON data_officer.id = data_officerallegation.id
where data_officerallegation.final_finding = 'SU'
group by data_officer.race,data_officerallegation.final_finding
order by data_officer.race;

--for age
select (2021 - data_officer.birth_year) as Age, data_officerallegation.final_finding, count(*) as total
from data_officer
INNER JOIN data_officerallegation
ON data_officer.id = data_officerallegation.id
where data_officerallegation.final_finding = 'SU'
group by data_officer.birth_year,data_officerallegation.final_finding
order by data_officer.birth_year desc;

--for rank
select data_officer.rank, data_officerallegation.final_finding, count(*) as total
from data_officer
INNER JOIN data_officerallegation
ON data_officer.id = data_officerallegation.id
where data_officerallegation.final_finding = 'SU'
group by data_officer.rank,data_officerallegation.final_finding
order by data_officer.rank;


4. Were the promotions, ranks or awards given to police officers affected by the sustainment (or not) of the complaints against them?

select data_award.id, award_type, data_award.end_date from data_award
join data_officerallegation d on data_award.officer_id = d.officer_id and final_finding = 'SU';
create temp table sustained as (select data_award.id, award_type, data_award.end_date from data_award
join data_officerallegation d on data_award.officer_id = d.officer_id and final_finding = 'SU');
select count(*) from sustained;
select data_award.id, award_type, data_award.end_date from data_award
join data_officerallegation d on data_award.officer_id = d.officer_id and final_finding = 'NS';
create temp table unsustained as (select data_award.id, award_type, data_award.end_date from data_award
join data_officerallegation d on data_award.officer_id = d.officer_id and final_finding = 'NS');
select count(*) from unsustained;

select last_promotion_date, (extract(year from last_promotion_date)) from data_award
join data_officerallegation d on data_award.officer_id = d.officer_id
where (extract(year from last_promotion_date)) = (extract(year from d.start_date));

create temp table promotion as (select last_promotion_date, (extract(year from last_promotion_date)) from data_award
join data_officerallegation d on data_award.officer_id = d.officer_id
where (extract(year from last_promotion_date)) = (extract(year from d.start_date)));
select count(*) from promotion;


5. What were the changes in sustainment of complaints before and after COPA came into place? 

select * from data_officerallegation;
select extract (year from start_date) as year from data_officerallegation
select id, (extract (year from start_date)), final_finding from data_officerallegation
where final_finding = 'SU' and (extract(year from start_date) >='2017');
create temp table COPA as (select id, (extract (year from start_date)), final_finding from data_officerallegation
where final_finding = 'SU' and (extract(year from start_date) >='2017'));
select * from COPA;
select count(*) from COPA;
select id, (extract (year from start_date)), final_finding from data_officerallegation
where final_finding = 'SU' and (extract(year from start_date) between '2007' and '2017');
create temp table IPRA as (select id, (extract (year from start_date)), final_finding from data_officerallegation
where final_finding = 'SU' and (extract(year from start_date) between '2007' and '2017'));
select * from IPRA;
select count(*) from IPRA;

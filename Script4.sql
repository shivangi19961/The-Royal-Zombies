select data_award.id, award_type, data_award.end_date from data_award 
join data_officerallegation d on data_award.officer_id = d.officer_id and final_finding = 'SU'; 
create temp table sustained as (select data_award.id, award_type, data_award.end_date 
from data_award 
join data_officerallegation d on data_award.officer_id = d.officer_id and final_finding = 'SU'); 
select count() from sustained; 
select data_award.id, award_type, data_award.end_date from data_award 
join data_officerallegation d on data_award.officer_id = d.officer_id and final_finding = 'NS'; 
create temp table unsustained as (select data_award.id, award_type, data_award.end_date 
from data_award 
join data_officerallegation d on data_award.officer_id = d.officer_id and final_finding = 'NS'); 
select count() from unsustained;
select last_promotion_date, (extract(year from last_promotion_date)) from data_award 
join data_officerallegation d on data_award.officer_id = d.officer_id where (extract(year from last_promotion_date)) = (extract(year from d.start_date));
create temp table promotion as (select last_promotion_date, (extract(year from last_promotion_date)) from data_award
join data_officerallegation d on data_award.officer_id = d.officer_id where (extract(year from last_promotion_date)) = (extract(year from d.start_date))); 
select count(*) from promotion;

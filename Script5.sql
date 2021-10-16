select * from data_officerallegation; 
select extract (year from start_date) as year from data_officerallegation 
select id, (extract (year from start_date)), final_finding from data_officerallegation 
where final_finding = 'SU' and (extract(year from start_date) >='2017');
create temp table COPA as (select id, (extract (year from start_date)), final_finding from data_officerallegation 
where final_finding = 'SU' and (extract(year from start_date) >='2017')); 
select * from COPA; select count() from COPA; 
select id, (extract (year from start_date)), final_finding from data_officerallegation where final_finding = 'SU' and (extract(year from start_date) between '2007' and '2017'); 
create temp table IPRA as (select id, (extract (year from start_date)), final_finding from data_officerallegation where final_finding = 'SU' and (extract(year from start_date) between '2007' and '2017')); 
select * from IPRA; select count() from IPRA;

--for race
 select data_officer.race, data_officerallegation.final_finding, count(*) 
 as total from data_officer INNER JOIN data_officerallegation ON data_officer.id = data_officerallegation.id 
 where data_officerallegation.final_finding = 'SU' 
 group by data_officer.race,data_officerallegation.final_finding 
 order by data_officer.race;
--for age 
select (2021 - data_officer.birth_year) as 
Age, data_officerallegation.final_finding, count(*) as total 
from data_officer INNER JOIN data_officerallegation ON data_officer.id = data_officerallegation.id 
where data_officerallegation.final_finding = 'SU' group by data_officer.birth_year,data_officerallegation.final_finding order by data_officer.birth_year desc;
--for rank 
select data_officer.rank, data_officerallegation.final_finding, count(*) 
as total 
from data_officer INNER JOIN data_officerallegation ON data_officer.id = data_officerallegation.id 
where data_officerallegation.final_finding = 'SU' group by data_officer.rank,data_officerallegation.final_finding 
order by data_officer.rank;

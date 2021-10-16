select is_officer_complaint, count() 
from data_allegation 
group by is_officer_complaint; 
select data_officerallegation.final_finding, data_allegation.is_officer_complaint, count() 
as cnt 
from data_officerallegation full join data_allegation on data_officerallegation.updated_at = data_allegation.updated_at 
group by data_officerallegation.final_finding, data_allegation.is_officer_complaint;

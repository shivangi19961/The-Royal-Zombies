drop table if exists allegation1_su;
create temp table allegation1_su as(
select count(*) as count1, da.is_officer_complaint from
data_officerallegation doa
INNER JOIN data_allegation da
on doa.allegation_id = da.crid
WHERE doa.final_finding = 'SU'
group by da.is_officer_complaint);

drop table if exists allegation1_all;
create temp table allegation1_all as(
select count(*) as count2, da.is_officer_complaint from
data_officerallegation doa
INNER JOIN data_allegation da
on doa.allegation_id = da.crid
group by da.is_officer_complaint);

drop table if exists allegations1;
create temp table allegations1 as(
select aas.count1,aa.count2, aas.is_officer_complaint from
allegation1_su aas
INNER JOIN allegation1_all aa
on aas.is_officer_complaint = aa.is_officer_complaint);

select (count1 * 100/count2) as percentofsustainedcomplaints ,is_officer_complaint from allegations1;
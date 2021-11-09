create temp table allegation4_su as(
select doa.officer_id, doc.actual_crew, doc.crew_id from
data_officerallegation doa
INNER JOIN data_officercrew doc
on doa.officer_id = doc.id
WHERE doa.final_finding = 'SU');

select (select count(*) from allegation4_su where crew_id is not NULL) * 100 /
       (select count(*) from allegation4_su) as percentage;
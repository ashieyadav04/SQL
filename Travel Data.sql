
#----------------------------------PROBLEM STATEMENT--------------------------------

# -----you have a given travel  data for each cust in no particular order. ------
#------you need to find start loc and end loc of cust along with no of loc they visisted-----

use aashi;
create table Travel_Data (customer varchar (30), start_loc varchar (30), end_loc varchar (30));

insert into Travel_Data 
value ("C-1","New York","Lima"),
("C-1","London","New York"),
("C-1","Lima","Sao Paulo"),
("C-1","Sao Paulo","New Delhi"),
("C-2","Mumbai","Hydrabad"),
("C-2","Surat","Pune"),
("C-2","Hydrabad","Surat"),
("C-3","Kochi","Kurnool"),
("C-3","Lucknow","Agra"),
("C-3","Agra","Jaipur"),
("C-3","Jaipur","Kochi");

desc Travel_data;
select * from Travel_data;

with  cte as 
(select customer, start_loc, end_loc, 'start' tag from Travel_data
union
select  customer, end_loc ,start_loc , 'end' tag  from Travel_data)

cte2 as
(select customer, start_loc, count(start_loc) from cte
group by 1,2
having count(start_loc)=1)

select c.customer,
      max(case when tag='start' then c2.start_loc else null end) as start_point,
      max(case when tag='end' then c2.start_loc else null end) as end_point,
      count(distinct c.start_loc) total_visits
from cte c 
left join cte2 c2
on c.customer=c2. customer and c.start_loc=c2.start_loc
group by c.customer;

select customer, start_loc, count(start_loc) from cte
group by 1,2
having count(start_loc)=1;
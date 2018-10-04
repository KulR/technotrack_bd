USE track_lect2;

select * from users inner join (
select user_id
from payments
group by user_id
order by sum(payment_sum) desc
limit 3) as t1
using(user_id);


select (select count(*) from sessions) / 
(select count(user_id) from users) as avg_sessions;

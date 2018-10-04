USE track_lect2;

select * from users inner join (
select user_id
from payments
group by user_id
order by sum(payment_sum) desc
limit 3)
using(user_id);

-- user_id	login		reg_dttm
-- 82		login_82	2018-09-28 15:17:46
-- 38		login_38	2018-09-23 20:27:39
-- 85		login_85	2018-08-27 02:36:25


select (select count(*) from sessions) / 
(select count(user_id) from users) as avg_sessions;
-- avg_sessions
-- 35.9100

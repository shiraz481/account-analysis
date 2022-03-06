select t.customer_id, t.days_to_pro
from
(select z.*, case when z.customer_id= lead(z.customer_id) over(order by customer_id)
then datediff(z.next_date, z.start_date)
else null
end as days_to_pro
from
(select y.*, lead(y.start_date) over(order by customer_id) as next_date
 from
(select x.*
from
(SELECT *,
case when customer_id=lead(customer_id) over(order by customer_id)
then start_date
else null	
end as st
FROM foodie_fi.subscriptions)x
where 
 x.plan_id= 0 or x.plan_id=3)y)z)t
 where t.days_to_pro is not null;

#show the customerswho have churned straight after their initial free trial ?
select y.* from
(select x.*,
lead(x.plan_id) over(order by x.num ) as next_plan
from
(SELECT *,row_number() over(order by customer_id asc) as num
 FROM foodie_fi.subscriptions)x)y
 where y.plan_id=0 and y.next_plan=4
 
 
 
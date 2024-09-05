-- calculate the percentage contribution of each pizza type to total revenue 
select pizza_types.category , 
round((
sum(orders_details.quantity * pizzas.price) / 
(select sum(orders_details.quantity*pizzas.price)
from orders_details join pizzas 
on orders_details.pizza_id = pizzas.pizza_id )
)*100,2) as revenue_percentage
from pizza_types join pizzas 
on pizza_types.pizza_type_id = pizzas.pizza_type_id
join orders_details 
on orders_details.pizza_id = pizzas.pizza_id 
group by pizza_types.category
order by revenue_percentage  desc

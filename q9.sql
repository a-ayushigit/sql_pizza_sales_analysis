-- find category wise distribution of pizzas 

select category , count(name) as count
from pizza_types
group by category 
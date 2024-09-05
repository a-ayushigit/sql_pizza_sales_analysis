-- find the total quantity of each pizza category ordered 
SELECT 
    pizza_types.category AS category,
    SUM(orders_details.quantity) AS total_quantity
FROM
    pizza_types
        JOIN
    pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
        JOIN
    orders_details ON pizzas.pizza_id = orders_details.pizza_id
GROUP BY category
ORDER BY total_quantity DESC
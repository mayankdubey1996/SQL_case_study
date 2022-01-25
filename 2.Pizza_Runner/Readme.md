# Case Study #2 - Pizza Runner 🍕 #
![](images/Banner.png)

### Inroduction ###
 - This case study has 5 parts
	- **A. Pizza Metrics: 10 Questions**
	- **B. Runner and Customer Experience: 7 Questions**
	- **C. Ingredient Optimisation: 6 Questions**
	- **D. Pricing and Ratings: 5 Questions**
	- **E. Bonus Question: 1 Question**
## ER Diagram
![](images/er_diagram.png)
	
### 4 File description 📂 ###
**Data creation and Inserting Values**
- customer_orders.sql

- pizza_names.sql

- pizza_recipes.sql

- pizza_toppings.sql

- runner_orders.sql

- runners.sql

**Data Cleaning file**
- data_cleaning.sql -> Data Transformation and cleaning file.

**Solution file**
- a.pizza_metrics.sql

- b.runner_customer_experience.sql

- c.Ingredient_optimization.sql

- d.pricing_ratings.sql

## A. Pizza Metrics ##
1. How many pizzas were ordered?
2. How many unique customer orders were made?
3.. How many successful orders were delivered by each runner?
4. How many of each type of pizza was delivered?
5. How many Vegetarian and Meatlovers were ordered by each customer?
6. What was the maximum number of pizzas delivered in a single order?
7. For each customer, how many delivered pizzas had at least 1 change and how many had no changes?
8. How many pizzas were delivered that had both exclusions and extras?
9. What was the total volume of pizzas ordered for each hour of the day?
10. What was the volume of orders for each day of the week?

## B. Runner and Customer Experience ##
1. How many runners signed up for each 1 week period? (i.e. week starts 2021-01-01)
2. What was the average time in minutes it took for each runner to arrive at the Pizza Runner HQ to pickup the order?
3. Is there any relationship between the number of pizzas and how long the order takes to prepare?
4. What was the average distance travelled for each customer?
5. What was the difference between the longest and shortest delivery times for all orders?
6. What was the average speed for each runner for each delivery and do you notice any trend for these values?
7. What is the successful delivery percentage for each runner?

## C. Ingredient Optimisation ##
1. What are the standard ingredients for each pizza?
2. What was the most commonly added extra?
3. What was the most common exclusion?
4. Generate an order item for each record in the customers_orders table in the format of one of the following:
	- Meat Lovers
	- Meat Lovers - Exclude Beef
	- Meat Lovers - Extra Bacon
	- Meat Lovers - Exclude Cheese, Bacon - Extra Mushroom, Peppers
5. Generate an alphabetically ordered comma separated ingredient list for each pizza order from the customer_orders table and add a 2x in front of any relevant ingredients
	- For example: "Meat Lovers: 2xBacon, Beef, ... , Salami"
6. What is the total quantity of each ingredient used in all delivered pizzas sorted by most frequent first?


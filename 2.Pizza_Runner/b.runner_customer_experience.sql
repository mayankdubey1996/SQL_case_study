/*B. Runner and Customer Experience */
--1. How many runners signed up for each 1 week period? (i.e. week starts 2021-01-01)

SELECT datepart(WEEK, registration_date) AS week_no,
       count(runner_id) AS no_runners_signed_up
FROM runners GROUP  BY datepart(WEEK, registration_date);

--2. What was the average time in minutes it took for each runner to arrive at the Pizza Runner HQ to pickup the order?

SELECT runner_id,
       avg(datediff(MINUTE, order_time, pickup_time)) AS avg_time_to_pick_up_order_in_minutes
FROM runner_orders_clean r,
     customer_orders_clean c
WHERE r.order_id = c.order_id
GROUP BY runner_id;

--3. Is there any relationship between the number of pizzas and how long the order takes to prepare?

WITH time_cte_as AS
  (SELECT c.order_id,
          count(c.order_id) no_orders,
          datediff(MINUTE, c.order_time, r.pickup_time) AS time_to_prepare_orders
   FROM customer_orders_clean c,
        runner_orders_clean r
   WHERE r.order_id = c.order_id
   GROUP BY c.order_id,
            datediff(MINUTE, c.order_time, r.pickup_time))
SELECT no_orders,
       avg(time_to_prepare_orders) AS avg_time_to_prepare_order
FROM time_cte_as
GROUP BY no_orders;

--4. What was the average distance travelled for each customer?

SELECT c.customer_id,
       avg(r.distance) AS avg_distance_travelled
FROM customer_orders_clean c,
     runner_orders_clean r
WHERE r.order_id = c.order_id
GROUP BY c.customer_id;

--5. What was the difference between the longest and shortest delivery times for all orders?

select * from runner_orders_clean

--6. What was the average speed for each runner for each delivery and do you notice any trend for these values?

SELECT *,
       round((distance/(duration/60)),2) AS speed
FROM runner_orders_clean;

--7. What is the successful delivery percentage for each runner?

WITH delivery_cte AS
  (SELECT runner_id,
          sum(CASE
                  WHEN cancellation IS NULL THEN 1
                  ELSE 0
              END) AS total_not_cancelled_orders,
          count(cancellation) AS total_cancelled_orders
   FROM runner_orders_clean GROUP  BY runner_id)
SELECT runner_id,
       (cast(total_not_cancelled_orders AS float)/(total_not_cancelled_orders+total_cancelled_orders)) * 100 AS success_delivery_percent
FROM delivery_cte

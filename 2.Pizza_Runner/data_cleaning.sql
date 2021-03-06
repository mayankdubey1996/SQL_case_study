/*Tranforming Customer_orders Table
1. Exclusions column: Replacing '' and 'null' (string) with NULL
2. Extras column: Replacing '' and 'null' (string) with NULL

Note: creating new table called customer_orders_clean which has cleaned and tranformed data.
*/
SELECT * INTO customer_orders_clean
FROM
  (SELECT order_id,
          customer_id,
          pizza_id,
          CASE
              WHEN exclusions = ''
                   OR exclusions = 'null' THEN NULL
              ELSE exclusions
          END AS exclusions,
          CASE
              WHEN extras = ''
                   OR extras = 'null' THEN NULL
              ELSE extras
          END AS extras,
          order_time
   FROM customer_orders) AS vals;


ALTER TABLE customer_orders_clean
ALTER COLUMN exclusions varchar(20);


ALTER TABLE customer_orders_clean
ALTER COLUMN extras varchar(20);

/*
Transforming runner_orders Table
1. pickup_time column: Replacing 'null'(string) to NULL
2. distance column: Replacing 'null'(string) to NULL
3. duration column: Replacing 'null'(string) to NULL
4. cancellation column: Replacing 'null'(string) to NULL
*/
SELECT * INTO runner_orders_clean
FROM
  (SELECT order_id,
          runner_id,
          CASE
              WHEN pickup_time = 'null' THEN NULL
              ELSE pickup_time
          END AS pickup_time,
          CASE
              WHEN distance = 'null' THEN NULL
              WHEN distance LIKE '%km' THEN TRIM('km'
                                                 FROM distance)
              ELSE distance
          END AS distance,
          CASE
              WHEN duration = 'null' THEN NULL
              WHEN duration LIKE '%mins' THEN TRIM('mins'
                                                   FROM duration)
              WHEN duration LIKE '%minute' THEN TRIM('minute'
                                                     FROM duration)
              WHEN duration LIKE '%minutes' THEN TRIM('minutes'
                                                      FROM duration)
          END AS duration,
          CASE
              WHEN cancellation = 'null'
                   OR cancellation = '' THEN NULL
              ELSE cancellation
          END AS cancellation
   FROM runner_orders) AS vals;

-- ALTERING DATA TYPE

ALTER TABLE runner_orders_clean
ALTER COLUMN pickup_time datetime;


ALTER TABLE runner_orders_clean
ALTER COLUMN distance numeric;


ALTER TABLE runner_orders_clean
ALTER COLUMN duration numeric;


ALTER TABLE runner_orders_clean
ALTER COLUMN cancellation varchar(30);

/*
changing column type of pizza names table pizza_name column from text to varchar(20)
*/
ALTER TABLE pizza_names
ALTER COLUMN pizza_name varchar(20);


/*
changing column type of pizza recipes table toppings column from text to varchar(30)
*/
ALTER TABLE pizza_recipes
ALTER COLUMN toppings varchar(30);

/*
changing column type of pizza_toppings table topping_name column from text to varchar(30)
*/
ALTER TABLE pizza_toppings
ALTER COLUMN topping_name varchar(30);


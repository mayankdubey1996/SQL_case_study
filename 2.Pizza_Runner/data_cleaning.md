## Tranforming Customer_orders table ##
1. **Exclusions column:** Replacing '' and 'null' (string) with NULL
2. **Extras column:** Replacing '' and 'null' (string) with NULL

**Note:** creating new table called customer_orders_clean which has cleaned and tranformed data.

````sql
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
````

### changing data type of exclusions columns from text to varchar ###
````sql
ALTER TABLE customer_orders_clean
ALTER COLUMN exclusions varchar(20);
````

### changing data type of extras columns from text to varchar ###
````sql
ALTER TABLE customer_orders_clean
ALTER COLUMN extras varchar(20);
````


## Transforming runner_orders Table ##
1. **pickup_time column:** Replacing 'null'(string) to NULL
2. **distance column:** Replacing 'null'(string) to NULL
3. **duration column:** Replacing 'null'(string) to NULL
4. **cancellation column:** Replacing 'null'(string) to NULL


````sql
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
````

### changing data type of exclusions columns to datetime ###

````sql
ALTER TABLE runner_orders_clean
ALTER COLUMN pickup_time datetime;
````

### changing data type of distance column to numeric ###

````sql
ALTER TABLE runner_orders_clean
ALTER COLUMN distance numeric;
````

### changing data type of `duration` column to numeric ###

````sql
ALTER TABLE runner_orders_clean
ALTER COLUMN duration numeric;
````

````sql
ALTER TABLE runner_orders_clean
ALTER COLUMN cancellation varchar(30);
````

/*
Transforming pizza_names_clean Table
1. pizza_name column: Changing data type of column from "TEXT" to "VARCHAR" (compatible with sql server)
*/

````sql
SELECT * INTO pizza_names_clean
FROM
  (SELECT pizza_id,
          cast(pizza_name AS varchar(20)) AS pizza_name
   FROM pizza_names) AS vals;
````
/*
changing column type of pizza recipes table toppings column from text to varchar(30)
*/

````sql
ALTER TABLE pizza_recipes
ALTER COLUMN toppings varchar(30);
````

/*
changing column type of pizza_toppings table topping_name column from text to varchar(30)
*/

````sql
ALTER TABLE pizza_toppings
ALTER COLUMN topping_name varchar(30);
````

/*
changing column type of pizza names table pizza_name column from text to varchar(20)
*/

````sql
ALTER TABLE pizza_names
ALTER COLUMN pizza_name varchar(20);
````

## Tranforming customer_orders table ##
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

### changing data type of `exclusions` columns from text to varchar ###
````sql
ALTER TABLE customer_orders_clean
ALTER COLUMN exclusions varchar(20);
````

### changing data type of `extras` columns from text to varchar ###
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

### changing data type of `exclusions` columns to datetime ###

````sql
ALTER TABLE runner_orders_clean
ALTER COLUMN pickup_time datetime;
````

### changing data type of `distance` column to numeric ###

````sql
ALTER TABLE runner_orders_clean
ALTER COLUMN distance numeric;
````

### changing data type of `duration` column to numeric ###

````sql
ALTER TABLE runner_orders_clean
ALTER COLUMN duration numeric;
````

### changing data type of `cancellation` column to numeric ###


````sql
ALTER TABLE runner_orders_clean
ALTER COLUMN cancellation varchar(30);
````

## Transforming pizza_names Table ##

### changing data type of `pizza_name` column from text to varchar ###
 
 ````sql
ALTER TABLE pizza_names
ALTER COLUMN pizza_name varchar(30);
````

## Transforming pizza_recipes Table ##
 
### changing data type of `topping` column from text to varchar ###

````sql
ALTER TABLE pizza_recipes
ALTER COLUMN toppings varchar(30);
````

## Transforming pizza_toppings Table ##
 
### changing data type of `topping_name` column from text to varchar ###


````sql
ALTER TABLE pizza_toppings
ALTER COLUMN topping_name varchar(30);
````



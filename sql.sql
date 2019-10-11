-- Look at the following examples, and write out in order /explain what order the code runs. 

SELECT payment_date 
From payment
WHERE payment_date > '2007-05-01'
ORDER BY payment_date DESC;

--Q1. The query above first looks at the FROM clause and isolates the table 'payment'. Then it filters out all dates
-- occuring after 05-01 via the WHERE clause. It then SELECTS and displays the queried columns and finally ORDERS
-- the selected columns in descending order.

SELECT payment_id, payment_date
From payment
WHERE amount < 3;

--Q2. The query above first looks at WHERE amounts are less than 3 from the payment table, and then it SELECTS the 
-- requested columns. 

SELECT customer_id, email, active
From customer
WHERE store_id = 1 AND active = 0
ORDER BY last_update;

--Q3. The query above first looks at WHERE the conditions of storeid=1 AND active=0 in the customer table before
-- it displays the requested columns. Then it ORDERS the values last.


-- THESE TWO ARE A BIT TRICKIER
SELECT c.name, COUNT(f.film_id) as total
FROM film as f
JOIN film_category AS fc  ON f.film_id=fc.film_id
JOIN category AS c ON fc.category_id=c.category_id
GROUP BY c.category_id
ORDER BY total DESC ;

--Q4. The query above will JOIN all the tables first. Then it will GROUP BY the category ids and SELECT the requested
-- columns. Finally, it will ORDER BY the values in descending order. 

SELECT *
FROM payment
WHERE amount > (SELECT AVG(amount) FROM payment);

--Q5. The query above first calculates the subquery. Then using that value it will use it to filter out the original
-- WHERE clause from the payment table and finally display the requested columns. 
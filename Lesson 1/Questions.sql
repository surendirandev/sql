SELECT * FROM dannys_diner.members;
# Question 1:
SELECT SALES.customer_id, SUM(MENU.price) FROM dannys_diner.sales SALES
INNER JOIN dannys_diner.menu MENU ON MENU.product_id = SALES.product_id
GROUP BY SALES.customer_id;

# Question 2: How many days has each customer visited the restaurant?
SELECT customer_id, count(order_date) from (
	SELECT customer_id, order_date FROM dannys_diner.sales 
	GROUP BY customer_id, order_date
) sal GROUP BY customer_id;

# Question 3: What was the first item from the menu purchased by each customer?
SELECT SAL.CUSTOMER_ID, menu.product_id, menu.product_name FROM (
	SELECT CUSTOMER_ID, PRODUCT_ID, ROW_NUMBER() OVER(
		PARTITION BY CUSTOMER_ID ORDER BY ORDER_DATE
	) ROW_NUM FROM dannys_diner.sales SALES
) SAL
INNER JOIN dannys_diner.menu menu ON menu.product_id = SAL.PRODUCT_ID
WHERE SAL.ROW_NUM = 1;

# Question 4: What is the most purchased item on the menu and how many times was it purchased by all customers?
SELECT sales.product_id, menu.product_name, count(sales.product_id) prod_cnt 
FROM dannys_diner.sales sales 
INNER JOIN dannys_diner.menu menu ON sales.product_id = menu.product_id
GROUP BY sales.product_id, menu.product_name
ORDER BY prod_cnt desc
LIMIT 1;

# Question 5: Which item was the most popular for each customer?
SELECT customer_id, product_id  FROM (
	SELECT customer_id, product_id, row_number() OVER(PARTITION BY customer_id ORDER BY count(product_id) DESC) ROW_NUM
	FROM dannys_diner.sales 
	GROUP BY customer_id, product_id
	ORDER BY customer_id asc) MOST
WHERE ROW_NUM = 1;

# Question 6: Which item was purchased first by the customer after they became a member?
# Question 7: Which item was purchased just before the customer became a member?
# Question 8: What is the total items and amount spent for each member before they became a member?
# Question 9: If each $1 spent equates to 10 points and sushi has a 2x points multiplier - how many points would each customer have?
# Question 10: In the first week after a customer joins the program (including their join date) they earn 2x points on all items, not just sushi - how many points do customer A and B have at the end of January?
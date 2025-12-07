SELECT * FROM dannys_diner.members;
# Question 1:
SELECT SALES.customer_id, SUM(MENU.price) FROM dannys_diner.sales SALES
INNER JOIN dannys_diner.menu MENU ON MENU.product_id = SALES.product_id
GROUP BY SALES.customer_id;

# Question 2: How many days has each customer visited the restaurant?
# Question 3: What was the first item from the menu purchased by each customer?
# Question 4: What is the most purchased item on the menu and how many times was it purchased by all customers?
# Question 5: Which item was the most popular for each customer?
# Question 6: Which item was purchased first by the customer after they became a member?
# Question 7: Which item was purchased just before the customer became a member?
# Question 8: What is the total items and amount spent for each member before they became a member?
# Question 9: If each $1 spent equates to 10 points and sushi has a 2x points multiplier - how many points would each customer have?
# Question 10: In the first week after a customer joins the program (including their join date) they earn 2x points on all items, not just sushi - how many points do customer A and B have at the end of January?
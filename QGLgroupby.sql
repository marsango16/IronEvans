#In this lab, you will be using the Sakila database of movie rentals. You can follow the steps listed here to get the data locally: 
#Sakila sample database - installation. You can work with two sql query files - sakila-schema.sql (creates the schema) + sakila-data.sql which inserts the data.

USE sakila;
#1. Review the tables in the database

#2. Explore tables by selecting all columns from each table or using the in built review features for your client.
SELECT *
FROM actor,address,category,city,country;

#3. Select one column from a table. Get film titles.
SELECT category_id FROM category;
GROUP BY name;#16


#4. Select one column from a table and alias it. Get unique list of film languages under the alias language. Note that we are not asking
#you to obtain the language per each film, but this is a good time to think about how you might get that information in the future.
SELECT actor_id FROM actor ;
SELECT DISTINCT language_id FROM language;#6

#5.1 Find out how many stores does the company have?
SELECT store_id FROM store;#3

#5.2 Find out how many employees staff does the company have?
SELECT DISTINCT sum(staff_id) FROM staff;#2
GROUP BY staff_id

#5.3 Return a list of employee first names only?
SELECT first_name FROM staff;#Mike, Jon


#Lab | SQL basics (selection and aggregation)

#In this lab, you will be using the Bank database.

#Here, we will practice selecting and projecting data. You can finish all questions with only those clauses:

#SELECT
#SELECT DISTINCT
#FROM
#WHERE
#ORDER BY
#LIMIT
#You can save your solutions into a sql file that you can submit via Github Url.

USE bank;
#Query 1
#Get the id values of the first 5 clients from district_id with a value equals to 1.

SELECT client_id FROM client
#WHERE district_id=1
ORDER BY district_id
LIMIT 5;#22  2  3  28  23

#Query 2
#In the client table, get an id value of the last client where the district_id equals to 72.
SELECT client_id  FROM bank.client
WHERE district_id = 72
ORDER BY client_id DESC
LIMIT 1;#13576

#Query 3
#Get the 3 lowest amounts in the loan table.
SELECT amount FROM loan
ORDER BY amount
LIMIT 3;#4980  5148  7656


#Query 4
#What are the possible values for status, ordered alphabetically in ascending order in the loan table?
SELECT DISTINCT status FROM loan
ORDER BY status;#A B C D

#Query 5
#What is the loan_id of the highest payment received in the loan table?
SELECT loan_id FROM loan
ORDER BY amount DESC
LIMIT 1;#6534


#Query 6
#What is the loan amount of the lowest 5 account_ids in the loan table? Show the account_id and the corresponding amount
SELECT account_id, amount FROM loan
ORDER BY account_id
LIMIT 5; # 
#id     amount
#2	    80952
#19	    30276
#25	    30276
#37	    318480
#38	    110736

#Query 7
#What are the top 5 account_ids with the lowest loan amount that have a loan duration of 60 in the loan table?
SELECT account_id,amount FROM loan
WHERE duration = 60
ORDER BY amount
LIMIT 5;
#10954
#938
#10711
#1766
#10799


#Query 8
#What are the unique values of k_symbol in the order table?
#Note: There shouldn't be a table name order, since order is reserved from the ORDER BY clause. You have to use backticks to escape the order table name.
SELECT DISTINCT k_symbol FROM bank.order;#use back tick to escape
#SIPO
#UVER
#POJISTNE
#LEASING

#Query 9
#In the order table, what are the order_ids of the client with the account_id 34?
SELECT order_id FROM bank.order
WHERE account_id = 34;
#29445
#29446
#29447

#Query 10
#In the order table, which account_ids were responsible for orders between order_id 29540 and order_id 29560 (inclusive)?
SELECT DISTINCT account_id FROM bank.order
WHERE (order_id >=29540 AND order_id <= 29560);


#Query 11
#In the order table, what are the individual amounts that were sent to (account_to) id 30067122?
SELECT * FROM bank.order
WHERE account_to = 30067122;#29617

#Query 12
#In the trans table, show the trans_id, date, type and amount of the 10 first transactions from account_id 793 in chronological order, from newest to oldest.
SELECT trans_id, `date`, `type`, amount FROM trans
WHERE account_id = 793
ORDER BY `date` DESC
LIMIT 10;
#3556468	981231	PRIJEM	78.6
#233254	981216	VYDAJ	600
#233104	981212	VYDAJ	1212
#233248	981211	VYDAJ	851
#233176	981207	VYDAJ	204
#3556467	981130	PRIJEM	75.1
#233395	981130	VYDAJ	14.6
#233103	981112	VYDAJ	1212
#233247	981111	VYDAJ	851
#233175	981107	VYDAJ	204

#Optional
#Query 13
#In the client table, of all districts with a district_id lower than 10, how many clients are from each district_id? 
#Show the results sorted by the district_id in ascending order.
SELECT district_id, count(client_id) FROM client
WHERE district_id <10
GROUP BY district_id
ORDER BY district_id;#
#1	663
#2	46
#3	63
#4	50
#5	71
#6	53
#7	45
#8	69
#9	60

#Query 14
#In the card table, how many cards exist for each type? Rank the result starting with the most frequent type.
SELECT `type` FROM card;
ORDER BY `type`;

#Query 15
#Using the loan table, print the top 10 account_ids based on the sum of all of their loan amounts.
SELECT account_id, sum(amount) FROM loan
ORDER BY account_id DESC
LIMIT 10;

#Query 16
#In the loan table, retrieve the number of loans issued for each day, before (excl) 930907, ordered by date in descending order.
SELECT count(loan), `date` FROM loan
WHERE date <930907
GROUP BY loan;










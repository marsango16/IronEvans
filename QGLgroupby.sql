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
SELECT `type`, count(`type`) FROM card
GROUP BY `type`; 
#classic	659
#junior	145
#gold	88


#Query 15
#Using the loan table, print the top 10 account_ids based on the sum of all of their loan amounts.
SELECT account_id, amount FROM loan
ORDER BY amount DESC
LIMIT 10;

#7542	590820
#8926	566640
#2335	541200
#817	538500
#2936	504000
#7049	495180
#10451	482940
#6950	475680
#7966	473280
#339	468060

#Query 16
#In the loan table, retrieve the number of loans issued for each day, before (excl) 930907, ordered by date in descending order.
SELECT `date`,loan_id FROM loan
WHERE `date` <930907
ORDER BY `date` DESC;
#930906	7240
#930803	5325
#930728	6863
#930711	5316
#930705	5314

#Query 17
#In the loan table, for each day in December 1997, count the number of loans issued for each unique loan duration, 
#ordered by date and duration, both in ascending order. You can ignore days without any loans in your output.
SELECT `date`, duration  FROM loan #count(loan)
WHERE `date` >=971201 and `date` <=971231 
#GROUP BY  loan_id
ORDER BY `date` and duration;#counting loan_id did not work out
#971206	24	1
#971206	36	1
#971208	12	3
#971209	12	1
#971209	24	1
#971210	12	1
#971211	24	1
#971211	48	1
#971213	24	1
#971220	36	1
#971221	36	1
#971224	60	1
#971225	24	1
#971225	60	1

#Query 18
#In the trans table, for account_id 396, sum the amount of transactions for each type (VYDAJ = Outgoing, PRIJEM = Incoming). 
#Your output should have the account_id, the type and the sum of amount, named as total_amount. Sort alphabetically by type.
SELECT account_id,type, SUM(amount) AS total_amount  FROM trans
WHERE account_id = 396# and type = VYDAJ and PRIJEM;
GROUP BY type;
#396	PRIJEM	1028138.6999740601
#396	VYDAJ	1485814.400024414

#Query 19
#From the previous output, translate the values for type to English, rename the column to transaction_type, round total_amount down to an integer
SELECT  account_id,type, floor(SUM(amount)) AS total_amount  FROM trans
#SELECT TRANSLATE(type,"PRIJEM", "INCOMING"), TRANSLATE (type,"VYDAJ", "OUTGOING") FROM trans
#SELECT  account_id,type, floor(SUM(amount)) AS total_amount  FROM trans
WHERE account_id = 396# and type = VYDAJ and PRIJEM;
GROUP BY type;
#SELECT TRANSLATE(type, "PRIJEM", "INCOMING") FROM trans;# did not suucced i the translation to English
#SELECT TRANSLATE (type, "VYDAJ", "OUTGOING") FROM trans
#SELECT TRANSLATE('Hello world','aeiou,','AEIOU') as message
#396	INCOMING	1028138
#396	OUTGOING	148581

#Query 20
#From the previous result, modify your query so that it returns only one row, with a column for incoming amount, outgoing amount and the difference.
SELECT 


#396	1028138	1485814	-457676


#Query 21
#Continuing with the previous example, rank the top 10 account_ids based on their difference.


#9707	869527
#3424	816372
#3260	803055
#2486	735219
#1801	725382
#4470	707243
#3674	703531
#9656	702786
#2227	696564
#6473	692580






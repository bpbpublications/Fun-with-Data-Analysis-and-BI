	CREATE TABLE customers ( customer_id INT PRIMARY KEY, first_name VARCHAR(50), last_name VARCHAR(50), email VARCHAR(100), phone VARCHAR(20) );

	INSERT INTO customers (customer_id, first_name, last_name, email, phone) VALUES (1, 'John', 'Doe', 'johndoe@example.com', '555-555-1212');

	SELECT * FROM customers;

	UPDATE customers SET email = 'newemail@example.com' WHERE customer_id = 1;

	DELETE FROM customers WHERE customer_id = 1;

	SELECT customers.first_name, customers.last_name, orders.order_date, orders.total_amount FROM customers JOIN orders ON customers.customer_id = orders.customer_id;

	SELECT customers.first_name, customers.last_name, SUM(orders.total_amount) AS total_sales FROM customers JOIN orders ON customers.customer_id = orders.customer_id GROUP BY customers.customer_id;


--Project
	CREATE TABLE Users (
	  user_id INT PRIMARY KEY,
	  first_name VARCHAR(50),
	  last_name VARCHAR(50),
	  email VARCHAR(100),
	  password VARCHAR(50)
	);
	
	CREATE TABLE Events (
	  event_id INT PRIMARY KEY,
	  event_name VARCHAR(100),
	  event_date DATE,
	  event_time TIME,
	  event_location VARCHAR(100)
	);
	
	CREATE TABLE Tickets (
	  ticket_id INT PRIMARY KEY,
	  event_id INT,
	  user_id INT,
	  ticket_type VARCHAR(50),
	  ticket_price DECIMAL(10, 2),
	  ticket_quantity INT,
	  FOREIGN KEY (event_id) REFERENCES Events(event_id),
	  FOREIGN KEY (user_id) REFERENCES Users(user_id)
	);


	INSERT INTO Users (user_id, first_name, last_name, email, password)
	VALUES (1, 'John', 'Doe', 'johndoe@email.com', 'password123');


	INSERT INTO Events (event_id, event_name, event_date, event_time, event_location)
	VALUES (1, 'Concert', '2023-06-15', '19:00:00', 'Madison Square Garden');

	INSERT INTO Tickets (ticket_id, event_id, user_id, ticket_type, ticket_price, ticket_quantity)
	VALUES (1, 1, 1, 'General Admission', 50.00, 2);

	INSERT INTO Users (user_id, first_name, last_name, email, password)
	VALUES (2, 'Jane', 'Doe', 'janedoe@email.com', 'password456'),
	       (3, 'Bob', 'Smith', 'bobsmith@email.com', 'password789');

	SELECT * FROM Users;

	SELECT * FROM Users;

	SELECT * FROM Tickets;


	SELECT user_id, first_name, last_name FROM Users;

	SELECT event_id, event_name, event_date, event_time, event_location FROM Events;

	SELECT ticket_id, event_id, user_id, ticket_type, ticket_price FROM Tickets;

	SELECT * FROM Tickets WHERE user_id = 1;


	SELECT * FROM Tickets ORDER BY ticket_price ASC;

	UPDATE Users SET first_name = 'Jane', last_name = 'Doe' WHERE user_id = 1;

	UPDATE Events SET event_location = 'Barclays Center' WHERE event_id = 1;

	UPDATE Tickets SET ticket_type = 'VIP', ticket_price = 100.00 WHERE ticket_id = 1;

	UPDATE Users SET password = 'newpassword' WHERE email LIKE '%@email.com';

	DELETE FROM Users WHERE user_id = 1;

	DELETE FROM Events WHERE user_id = 1;

	DELETE FROM Tickets WHERE user_id = 1;

	SELECT Tickets.ticket_id, Events.event_name, Events.event_date, Events.event_time, Events.event_location, Tickets.ticket_type, Tickets.ticket_price
	FROM Tickets
	JOIN Events ON Tickets.event_id = Events.event_id
	WHERE Tickets.user_id = 1;

	CREATE VIEW UserTickets AS
	SELECT Tickets.ticket_id, Events.event_name, Events.event_date, Events.event_time, Events.event_location, Tickets.ticket_type, Tickets.ticket_price
	FROM Tickets
	JOIN Events ON Tickets.event_id = Events.event_id;


	SELECT * FROM UserTickets WHERE user_id = 1;





Codes with comments 

-- Creating a table 'customers' with columns customer_id, first_name, last_name, email, and phone
CREATE TABLE customers (customer_id INT PRIMARY KEY, first_name VARCHAR(50), last_name VARCHAR(50), email VARCHAR(100), phone VARCHAR(20));

-- Inserting data into the 'customers' table
INSERT INTO customers (customer_id, first_name, last_name, email, phone) VALUES (1, 'John', 'Doe', 'johndoe@example.com', '555-555-1212');

-- Retrieving all records from the 'customers' table
SELECT * FROM customers;

-- Updating the email of a customer with customer_id = 1
UPDATE customers SET email = 'newemail@example.com' WHERE customer_id = 1;

-- Deleting a customer with customer_id = 1 from the 'customers' table
DELETE FROM customers WHERE customer_id = 1;

-- Retrieving specific columns from 'customers' table and 'orders' table using JOIN
SELECT customers.first_name, customers.last_name, orders.order_date, orders.total_amount FROM customers JOIN orders ON customers.customer_id = orders.customer_id;

-- Retrieving specific columns from 'customers' table and 'orders' table using JOIN and calculating total sales
SELECT customers.first_name, customers.last_name, SUM(orders.total_amount) AS total_sales FROM customers JOIN orders ON customers.customer_id = orders.customer_id GROUP BY customers.customer_id;

-- Creating tables 'Users', 'Events', and 'Tickets' with their respective columns and foreign key constraints
CREATE TABLE Users (user_id INT PRIMARY KEY, first_name VARCHAR(50), last_name VARCHAR(50), email VARCHAR(100), password VARCHAR(50));
CREATE TABLE Events (event_id INT PRIMARY KEY, event_name VARCHAR(100), event_date DATE, event_time TIME, event_location VARCHAR(100));
CREATE TABLE Tickets (ticket_id INT PRIMARY KEY, event_id INT, user_id INT, ticket_type VARCHAR(50), ticket_price DECIMAL(10, 2), ticket_quantity INT, FOREIGN KEY (event_id) REFERENCES Events(event_id), FOREIGN KEY (user_id) REFERENCES Users(user_id));

-- Inserting data into the 'Users' table
INSERT INTO Users (user_id, first_name, last_name, email, password) VALUES (1, 'John', 'Doe', 'johndoe@email.com', 'password123');
INSERT INTO Users (user_id, first_name, last_name, email, password) VALUES (2, 'Jane', 'Doe', 'janedoe@email.com', 'password456'), (3, 'Bob', 'Smith', 'bobsmith@email.com', 'password789');

-- Inserting data into the 'Events' table
INSERT INTO Events (event_id, event_name, event_date, event_time, event_location) VALUES (1, 'Concert', '2023-06-15', '19:00:00', 'Madison Square Garden');

-- Inserting data into the 'Tickets' table
INSERT INTO Tickets (ticket_id, event_id, user_id, ticket_type, ticket_price, ticket_quantity) VALUES (1, 1, 1, 'General Admission', 50.00, 2);

-- Retrieving all records from the 'Users' table
SELECT * FROM Users;

-- Retrieving all records from the 'Users' table
SELECT * FROM Users;

-- Retrieving all records from the 'Tickets' table
SELECT * FROM Tickets;

-- Retrieving specific columns from the 'Users' table
SELECT user_id, first_name, last_name FROM Users;

-- Retrieving specific columns from the 'Events' table
SELECT event_id, event_name, event_date, event_time, event_location FROM Events;

-- Retrieving specific columns from the 'Tickets' table
SELECT ticket_id, event_id, user_id, ticket_type, ticket_price FROM Tickets;

-- Retrieving records from the 'Tickets' table where user_id is 1
SELECT * FROM Tickets WHERE user_id = 1;

-- Retrieving records from the 'Tickets' table sorted by ticket_price in ascending order
SELECT * FROM Tickets ORDER BY ticket_price ASC;

-- Updating a record in the 'Users' table
UPDATE Users SET first_name = 'Jane', last_name = 'Doe' WHERE user_id = 1;

-- Updating a record in the 'Events' table
UPDATE Events SET event_location = 'Barclays Center' WHERE event_id = 1;

-- Updating a record in the 'Tickets' table
UPDATE Tickets SET ticket_type = 'VIP', ticket_price = 100.00 WHERE ticket_id = 1;

-- Updating records in the 'Users' table based on email pattern
UPDATE Users SET password = 'newpassword' WHERE email LIKE '%@email.com';

-- Deleting a record from the 'Users' table with user_id = 1
DELETE FROM Users WHERE user_id = 1;

-- Deleting a record from the 'Events' table with user_id = 1
DELETE FROM Events WHERE user_id = 1;

-- Deleting a record from the 'Tickets' table with user_id = 1
DELETE FROM Tickets WHERE user_id = 1;

-- Retrieving specific columns from the 'Tickets' and 'Events' table using JOIN
SELECT Tickets.ticket_id, Events.event_name, Events.event_date, Events.event_time, Events.event_location, Tickets.ticket_type, Tickets.ticket_price FROM Tickets JOIN Events ON Tickets.event_id = Events.event_id WHERE Tickets.user_id = 1;

-- Creating a view named 'UserTickets' to retrieve specific columns from the 'Tickets' and 'Events' table using JOIN
CREATE VIEW UserTickets AS SELECT Tickets.ticket_id, Events.event_name, Events.event_date, Events.event_time, Events.event_location, Tickets.ticket_type, Tickets.ticket_price FROM Tickets JOIN Events ON Tickets.event_id = Events.event_id;

-- Retrieving records from the 'UserTickets' view where user_id is 1
SELECT * FROM UserTickets WHERE user_id = 1;

DROP DATABASE IF EXISTS Bookstore;
CREATE DATABASE Bookstore;
USE Bookstore;

CREATE TABLE Authors (
	author_id INT PRIMARY KEY,
	name VARCHAR(50)
);

CREATE TABLE Books (
	book_id INT PRIMARY KEY,
	title VARCHAR(50),
	author_id INT,
	price DECIMAL(19, 4), 
	FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);

CREATE TABLE Customers (
	customer_id INT PRIMARY KEY,
	name VARCHAR(50),
	email VARCHAR(100),
	address VARCHAR(255) 
);

CREATE TABLE Orders (
	order_id INT PRIMARY KEY,
	customer_id INT,
	order_date DATE, -- YYYY-MM-DD
	FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

CREATE TABLE OrderDetails (
	order_id INT,
	book_id INT,
	quantity INT,
	FOREIGN KEY (order_id) REFERENCES Orders(order_id),
	FOREIGN KEY (book_id) REFERENCES Books(book_id),
	PRIMARY KEY (order_id, book_id)
);


INSERT INTO Authors (author_id, name) 
VALUES
	(327, 'Homer'),
	(548, 'Ernst Hemmingway'),
	(173, 'F. Scott Fitzgerald'),
	(621, 'Albert Camus'),
	(895, 'Herman Melville'),
	(432, 'George Orwell'),
	(756, 'Mark Twain'),
	(289, 'Victor Hugo'),
	(604, 'J.D. Salinger'),
	(137, 'J.R.R. Tolkien');

INSERT INTO Books (book_id, title, author_id, price)
VALUES
	(3271, 'The Iliad', 327, 5.500),
	(5482, 'For Whom the Bell Tolls', 548, 7.250),
	(1733, 'The Great Gatsby', 173, 9.990),
	(6214, 'The Stranger', 621, 12.750),
	(8955, 'Moby-Dick', 895, 15.000),
	(4326, '1984', 432, 18.400),
	(7567, 'The Adventures of Tom Sawyer', 756, 27.250),
	(2898, 'Les Misérables', 289, 30.500),
	(6049, 'The Catcher in the Rye', 604, 23.990),
	(13710, 'The Lord of the Rings', 137, 20.750);

INSERT INTO Customers (customer_id, name, email, address)
VALUES
	(22081959, 'Anthony John Soprano, Sr.', 'waste_management_NJ@aol.com', '14 Aspen Drive, North Caldwell, New Jersey, USA'),
	(20071969, 'Christopher Moltisanti', 'cleaver_movie@aol.com', '3 Baldwin Court in Fairview, New Jersey, USA'),
	(15041959, 'Arthur Bucco, Jr.', 'vesuvio@aoauthorsl.com', '15 Pine Road, West Caldwell, New Jersey, USA'),
	(07061972, 'Benito Fazio Jr', 'criminal_mastermind@aol.com', '12 Oak Street, Newark, New Jersey, USA'),
	(29071942, 'Peter Paul Gualtieri', 'paulie_walnuts@aol.com', '23 W Park Drive, Newark, New Jersey, USA'),
	(22111947, 'Silvio Manfred Dante', 'e_street_band@aol.com', '45 Somewhere Ave, North Caldwell, New Jersey, USA'),
	(12061964, 'Robert Baccalieri, Jr.', 'i_like_trains@aol.com', '11 I Dont Know, West Caldwell, New Jersey, USA'),
	(16031957, 'Anthony Blundetto', 'animal_blundetto@aol.com', '12 Fake Address, West Caldwell, New Jersey, USA'),
	(01021960, 'James Altieri', 'totally_not_a_rat@aol.com', '86 Rat Avenue, Newark, New Jersey, USA'),
	(29031966, 'Furio Giunta', 'mr_williams@aol.com', '44 Essex street, Belleville, New Jersey, USA');

INSERT INTO Orders (order_id, customer_id, order_date)
VALUES
	(001, 22081959, '2004-04-21'),
	(002, 22081959, '2004-04-22'),
	(003, 20071969, '2004-04-22'),
	(004, 29031966, '2004-04-30'),
	(005, 22111947, '2004-05-01'),
	(006, 15041959, '2004-05-03'),
	(007, 20071969, '2004-05-05'),
	(008, 29071942, '2004-05-06'),
	(009, 12061964, '2004-05-07'),
	(010, 22081959, '2004-05-10');

INSERT INTO OrderDetails (order_id, book_id, quantity)
VALUES
	(001, 3271, 1),
	(002, 6214, 2),
	(003, 1733, 100),
	(004, 6049, 4),
	(005, 7567, 1),
	(006, 5482, 1),
	(007, 4326, 2),
	(008, 4326, 3),
	(009, 3271, 2),
	(010, 6049, 1);

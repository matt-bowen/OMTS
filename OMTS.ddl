create database OMTS;

CREATE TABLE Complex
(
	name		VARCHAR(15)	NOT NULL,
	street_num	INTEGER,
	street_name	VARCHAR(15),
	city		VARCHAR(15),
	prov		VARCHAR(15),
	postal		VARCHAR(7),
	phone_num	INTEGER,
	PRIMARY KEY(name)
);

CREATE TABLE Theater
(
	th_num		INTEGER		NOT NULL,
	complex_name	VARCHAR(15)	NOT NULL,
	max_seats	INTEGER		NOT NULL,
	screen_size	VARCHAR(6),
	PRIMARY KEY(th_num),
	FOREIGN KEY(complex_name) REFERENCES Complex(name)
);

CREATE TABLE Company
(	
	name		VARCHAR(15)	NOT NULL,
	street_num	INTEGER,
	street_name	VARCHAR(15),
	city		VARCHAR(15),
	prov		VARCHAR(15),
	postal		VARCHAR(7),
	phone_num	INTEGER,
	contact		VARCHAR(30),
	PRIMARY KEY(name)
):

CREATE TABLE Movie
(
	title		VARCHAR(30)	NOT NULL,
	run_time	INTEGER,
	rating		VARCHAR(4),
	director	VARCHAR(30),
	actors		VARCHAR(100),
	synopsis	VARCHAR(200),
	supplier	VARCHAR(15),
	prod_company	VARCHAR(15)	NOT NULL,
	PRIMARY KEY(title),
	FOREIGN KEY(prod_company) REFERENCES Company(name)
);

CREATE TABLE Start_Dates
(
	complex_name	VARCHAR(15)	NOT NULL,
	movie_title	VARCHAR(30)	NOT NULL,
	date		DATE		NOT NULL,
	FOREIGN KEY(complex_name) REFERENCES Complex(name),
	FOREIGN KEY(movie_title) REFERENCES Movie(title)
);

CREATE TABLE End_Dates
(
	complex_name	VARCHAR(15)	NOT NULL,
	movie_title	VARCHAR(30)	NOT NULL,
	date		DATE		NOT NULL,
	FOREIGN KEY(complex_name) REFERENCES Complex(name),
	FOREIGN KEY(movie_title) REFERENCES Movie(title)
);

CREATE TABLE Customer
(
	acct_num	INTEGER		NOT NULL,
	password	VARCHAR(30)	NOT NULL,
	f_name		VARCHAR(15),
	l_name		VARCHAR(15),
	street_num	INTEGER,
	street_name	VARCHAR(15),
	city		VARCHAR(15),
	prov		VARCHAR(15),
	postal		VARCHAR(7),
	phone_num	INTEGER,
	email		VARCHAR(25),
	cc_num		INTEGER		NOT NULL,
	cc_exp		DATE		NOT NULL,
	PRIMARY KEY(acct_num)
);

CREATE TABLE Reviews
(
	movie_title	VARCHAR(30)	NOT NULL,
	cust_num	INTEGER		NOT NULL,
	review		VARCHAR(300)	NOT NULL,
	FOREIGN KEY(movie_title) REFERENCES Movie(title),
	FOREIGN KEY(cust_num) REFERENCES Customer(acct_num)
);

CREATE TABLE Showing
(
	start_time	INTEGER		NOT NULL,
	complex		VARCHAR(15) 	NOT NULL,
	th_num		INTEGER		NOT NULL,
	movie_title	VARHCAR(30)	NOT NULL,
	total_seats_res	INTEGER		NOT NULL,
	PRIMARY KEY(start_time),
	FOREIGN KEY(complex) REFERENCES Complex(name),
	FOREIGN KEY(th_num) REFERENCES Theater(th_num),
	FOREIGN KEY(movie_title) REFERENCES Movie(title)
);

CREATE TABLE Reservation
(
	cust_num	INTEGER		NOT NULL,
	seats		INTEGER		NOT NULL,
	start_time	INTEGER		NOT NULL,
	movie_title	VARCHAR(30)	NOT NULL,
	th_num		INTEGER		NOT NULL,
	complex		VARCHAR(15)	NOT NULL,
	PRIMARY KEY(seats),
	FOREIGN KEY(cust_num) REFERENCES Customer(acct_num),
	FOREIGN KEY(start_time) REFERENCES Showing(start_time),
	FOREIGN KEY(movie_title) REFERENCES Movie(title),
	FOREIGN KEY(th_num) REFERENCES Theater(th_num),
	FOREIGN KEY(complex) REFERENCES Complex(name)
);






























	

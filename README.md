Library Management System Database
This repository contains the SQL script for a simple relational database designed to manage a library's collection, including books, authors, publishers, members, and book loans.

Project Description
The database schema is built to model the core relationships and data flow within a typical library. It includes the following tables:

Authors: Stores information about book authors.

Publishers: Stores information about publishing houses.

Books: The central table for all books, linked to a publisher.

Book_Authors: A junction table to manage the many-to-many relationship between books and authors.

Members: Stores details about library patrons.

Loans: Tracks which books are currently checked out by which members.

The schema uses proper primary and foreign keys to ensure data integrity and prevent errors.

How to Set Up the Database
To use this database, you will need a MySQL environment (or another compatible SQL database system).

Step 1: Set up MySQL
Ensure you have a running MySQL server. If not, you can install a local version using tools like XAMPP, WAMP, or by installing the MySQL Community Server directly.

Step 2: Create the Database
Open your MySQL client (e.g., MySQL Workbench, a terminal with the mysql command, or any other GUI tool). Execute the following command to create an empty database named library_db:

CREATE DATABASE library_db;

Step 3: Import the Schema
Navigate to the directory where your .sql file is saved. From your terminal, you can import the schema into your newly created database using this command:

mysql -u your_username -p library_db < your_filename.sql

You will be prompted to enter your MySQL password. Once the command completes, all the tables will be created in the library_db database.

Alternatively, if you are using a GUI tool like MySQL Workbench, you can simply open the .sql file and execute all the queries.

Once the schema is imported, you'll be ready to add data and perform queries. Let me know if you'd like to see examples of INSERT statements to populate the tables!

ERD :   <img width="561" height="552" alt="image" src="https://github.com/user-attachments/assets/e2f17b28-fbde-4e7c-b68c-153d06bdaf0f" />



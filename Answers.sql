--
-- This SQL script creates the database schema for a simple Library Management System.
-- It includes tables for books, authors, publishers, members, and loans.
--
-- The schema is designed with proper constraints and relationships to maintain data integrity.
--

-- -----------------------------------------------------------------------------
-- Table: Authors
-- Description: Stores information about the authors of books.
-- Relationship: Many-to-many with Books (via the Book_Authors table).
-- -----------------------------------------------------------------------------
CREATE TABLE Authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    birth_year YEAR
);

-- -----------------------------------------------------------------------------
-- Table: Publishers
-- Description: Stores information about book publishers.
-- Relationship: One-to-many with Books (one publisher can publish many books).
-- -----------------------------------------------------------------------------
CREATE TABLE Publishers (
    publisher_id INT AUTO_INCREMENT PRIMARY KEY,
    publisher_name VARCHAR(255) NOT NULL UNIQUE,
    city VARCHAR(100)
);

-- -----------------------------------------------------------------------------
-- Table: Books
-- Description: Stores information about the books in the library's collection.
-- Relationship: One-to-many with Publishers, many-to-many with Authors.
-- -----------------------------------------------------------------------------
CREATE TABLE Books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    publication_year YEAR,
    publisher_id INT,
    FOREIGN KEY (publisher_id) REFERENCES Publishers(publisher_id)
);

-- -----------------------------------------------------------------------------
-- Table: Book_Authors
-- Description: A junction table to handle the many-to-many relationship
--              between Books and Authors.
-- Relationship: Many-to-many.
-- -----------------------------------------------------------------------------
CREATE TABLE Book_Authors (
    book_id INT,
    author_id INT,
    PRIMARY KEY (book_id, author_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id),
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);

-- -----------------------------------------------------------------------------
-- Table: Members
-- Description: Stores information about library members.
-- Relationship: One-to-many with Loans (one member can have many loans).
-- -----------------------------------------------------------------------------
CREATE TABLE Members (
    member_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    join_date DATE DEFAULT (CURRENT_DATE)
);

-- -----------------------------------------------------------------------------
-- Table: Loans
-- Description: Tracks books that have been checked out by members.
-- Relationship: Many-to-one with Books, Many-to-one with Members.
-- -----------------------------------------------------------------------------
CREATE TABLE Loans (
    loan_id INT AUTO_INCREMENT PRIMARY KEY,
    book_id INT,
    member_id INT,
    loan_date DATE NOT NULL,
    due_date DATE NOT NULL,
    return_date DATE,
    FOREIGN KEY (book_id) REFERENCES Books(book_id),
    FOREIGN KEY (member_id) REFERENCES Members(member_id)
);

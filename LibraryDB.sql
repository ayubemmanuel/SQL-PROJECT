-- ===========================================
-- Library Management System - Complete SQL
-- ===========================================

-- 1. Create Database
DROP DATABASE IF EXISTS LibraryDB;
CREATE DATABASE LibraryDB;
USE LibraryDB;

-- 2. Create Tables

-- Authors Table
CREATE TABLE Authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    UNIQUE(first_name, last_name)
);

-- Books Table
CREATE TABLE Books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    isbn VARCHAR(20) UNIQUE NOT NULL,
    publication_year YEAR,
    copies_available INT DEFAULT 1 CHECK (copies_available >= 0)
);

-- Members Table
CREATE TABLE Members (
    member_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(20)
);

-- Loans Table
CREATE TABLE Loans (
    loan_id INT AUTO_INCREMENT PRIMARY KEY,
    member_id INT NOT NULL,
    book_id INT NOT NULL,
    loan_date DATE NOT NULL,
    return_date DATE,
    FOREIGN KEY (member_id) REFERENCES Members(member_id) ON DELETE CASCADE,
    FOREIGN KEY (book_id) REFERENCES Books(book_id) ON DELETE CASCADE
);

-- BookAuthors Table (Many-to-Many)
CREATE TABLE BookAuthors (
    book_id INT NOT NULL,
    author_id INT NOT NULL,
    PRIMARY KEY (book_id, author_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id) ON DELETE CASCADE,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id) ON DELETE CASCADE
);

-- 3. Insert Sample Data

-- Authors
INSERT INTO Authors (first_name, last_name) VALUES
('J.K.', 'Rowling'),
('George', 'Orwell'),
('Jane', 'Austen');

-- Books
INSERT INTO Books (title, isbn, publication_year, copies_available) VALUES
('Harry Potter and the Sorcerer''s Stone', '9780747532743', 1997, 5),
('1984', '9780451524935', 1949, 3),
('Pride and Prejudice', '9781503290563', 1813, 4);

-- BookAuthors (Many-to-Many)
INSERT INTO BookAuthors (book_id, author_id) VALUES
(1, 1),  -- Harry Potter by J.K. Rowling
(2, 2),  -- 1984 by George Orwell
(3, 3);  -- Pride and Prejudice by Jane Austen

-- Members
INSERT INTO Members (first_name, last_name, email, phone) VALUES
('John', 'Doe', 'john.doe@example.com', '0712345678'),
('Mary', 'Smith', 'mary.smith@example.com', '0723456789');

-- Loans
INSERT INTO Loans (member_id, book_id, loan_date, return_date) VALUES
(1, 1, '2025-09-01', '2025-09-15'),
(2, 2, '2025-09-05', NULL);  -- Book not yet returned

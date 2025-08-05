-- Create the database and select it
CREATE DATABASE library_db;
USE library_db;
-- Create tables
CREATE TABLE authors (
    author_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    country VARCHAR(50)
);

CREATE TABLE books (
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    author_id INT,
    genre VARCHAR(100),
    pub_year INT,
    copies INT DEFAULT 1,
    FOREIGN KEY (author_id) REFERENCES authors(author_id)
);

CREATE TABLE borrowers (
    borrower_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    join_date DATE
);

CREATE TABLE transactions (
    txn_id INT PRIMARY KEY AUTO_INCREMENT,
    book_id INT,
    borrower_id INT,
    issue_date DATE,
    due_date DATE,
    return_date DATE,
    FOREIGN KEY (book_id) REFERENCES books(book_id),
    FOREIGN KEY (borrower_id) REFERENCES borrowers(borrower_id)
);

-- Insert sample data
INSERT INTO authors (name, country) VALUES
  ('J.K. Rowling', 'UK'),
  ('George Orwell', 'UK'),
  ('Jane Austen', 'UK');

INSERT INTO books (title, author_id, genre, pub_year, copies) VALUES
  ('Harry Potter', 1, 'Fantasy', 1997, 3),
  ('1984', 2, 'Dystopian', 1949, 2),
  ('Pride and Prejudice', 3, 'Romance', 1813, 1);

INSERT INTO borrowers (name, email, join_date) VALUES
  ('Alice Smith', 'alice@mail.com', '2023-01-10'),
  ('Bob Lee', 'bob@mail.com', '2023-04-20');

INSERT INTO transactions (book_id, borrower_id, issue_date, due_date, return_date) VALUES
  (1, 1, '2023-08-01', '2023-08-15', '2023-08-10'),
  (2, 2, '2023-08-02', '2023-08-16', NULL);

-- Example Queries
    -- Find overdue books
SELECT borrowers.name, books.title, transactions.due_date
FROM transactions
JOIN borrowers ON transactions.borrower_id = borrowers.borrower_id
JOIN books ON transactions.book_id = books.book_id
WHERE transactions.return_date IS NULL AND transactions.due_date < CURDATE();

    -- Find most borrowed books
SELECT books.title, COUNT(*) AS times_borrowed
FROM transactions
JOIN books ON transactions.book_id = books.book_id
GROUP BY books.title
ORDER BY times_borrowed DESC;

    -- Find books by a specific author
SELECT books.title
FROM books
JOIN authors ON books.author_id = authors.author_id
WHERE authors.name = 'J.K. Rowling';

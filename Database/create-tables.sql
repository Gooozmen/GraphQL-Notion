-- Drop tables if they already exist (respect foreign key order)
DROP TABLE IF EXISTS loans;
DROP TABLE IF EXISTS books;
DROP TABLE IF EXISTS members;
DROP TABLE IF EXISTS authors;
DROP TABLE IF EXISTS genres;

-- Authors
CREATE TABLE authors (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    country VARCHAR(100)
);

-- Genres
CREATE TABLE genres (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

-- Books
CREATE TABLE books (
    id SERIAL PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    author_id INT NOT NULL REFERENCES authors(id),
    genre_id INT NOT NULL REFERENCES genres(id),
    published_year INT NOT NULL
);

-- Members
CREATE TABLE members (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    joined_date DATE NOT NULL
);

-- Loans
CREATE TABLE loans (
    id SERIAL PRIMARY KEY,
    book_id INT NOT NULL REFERENCES books(id),
    member_id INT NOT NULL REFERENCES members(id),
    loan_date DATE NOT NULL,
    return_date DATE
);
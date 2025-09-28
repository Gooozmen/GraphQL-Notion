INSERT INTO authors (name, country) VALUES
('Robert C. Martin', 'USA'),
('Eric Evans', 'USA'),
('J.K. Rowling', 'UK'),
('George R.R. Martin', 'USA'),
('Isaac Asimov', 'Russia/USA');

INSERT INTO genres (name) VALUES
('Programming'),
('Fantasy'),
('Science Fiction'),
('Non-Fiction'),
('Mystery');

INSERT INTO books (title, author_id, genre_id, published_year) VALUES
('Clean Code', 1, 1, 2008),
('Clean Architecture', 1, 1, 2017),
('Domain-Driven Design', 2, 1, 2003),
('Harry Potter and the Philosopher''s Stone', 3, 2, 1997),
('Harry Potter and the Chamber of Secrets', 3, 2, 1998),
('A Game of Thrones', 4, 2, 1996),
('A Clash of Kings', 4, 2, 1998),
('Foundation', 5, 3, 1951),
('I, Robot', 5, 3, 1950);

INSERT INTO members (name, email, joined_date) VALUES
('Alice Johnson', 'alice@example.com', '2021-01-15'),
('Bob Smith', 'bob@example.com', '2021-03-10'),
('Charlie Brown', 'charlie@example.com', '2022-07-20'),
('Diana Prince', 'diana@example.com', '2023-05-11');

INSERT INTO loans (book_id, member_id, loan_date, return_date) VALUES
(1, 1, '2023-01-01', '2023-01-20'),
(2, 2, '2023-02-15', NULL), -- still borrowed
(4, 1, '2023-03-05', '2023-03-25'),
(6, 3, '2023-04-10', NULL), -- still borrowed
(8, 4, '2023-05-01', '2023-05-20');
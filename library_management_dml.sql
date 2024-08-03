-- DML
INSERT INTO authors (author_name) VALUES
('J.K. Rowling'),
('George Orwell'),
('Philip K. Dick');

INSERT INTO genres (genre_name) VALUES
('Fantasy'),
('Dystopia'),
('Science Fiction');

INSERT INTO books (title, publication_year, author_id, genre_id) VALUES
('Harry Potter and the Philosopher''s Stone', 1997, 1, 1),
('1984', 1949, 2, 2),
('Ubik', 1969, 3, 3);

INSERT INTO users (username, email) VALUES
('john_doe', 'john.doe@example.com'),
('jane_smith', 'jane.smith@example.com'),
('bob_johnson', 'bob.johnson@example.com');

INSERT INTO borrowed_books (book_id, user_id, borrow_date, return_date) VALUES
(1, 1, '2024-08-01', '2024-08-03'),
(2, 2, '2024-07-05', '2024-07-19'),
(3, 3, '2024-07-10', NULL);

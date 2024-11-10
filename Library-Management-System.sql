-- Create a database named 'library'
CREATE DATABASE library;

-- Select the 'library' database for use
USE library;

-- Create a table for branches
CREATE TABLE Branch (
    Branch_no INT PRIMARY KEY AUTO_INCREMENT,     -- Unique branch number set as primary key
    Manager_id VARCHAR(5),                 -- ID of the branch manager
    Branch_address VARCHAR(50),     -- Address of the branch, up to 50 characters
    Contact_no VARCHAR(10)                 -- Contact number of the branch (as an integer)
)AUTO_INCREMENT= 101;

-- Inserting values into Branch table
INSERT INTO Branch ( Manager_id, Branch_address, Contact_no) VALUES
('M001', '123 Main St', 9874561230),
('M002', '456 Oak St', 9874561231),
('M003', '789 Pine St', 9874561232),
('M004', '135 Maple St', 9876543213),
('M005', '246 Elm St', 9876543214),
('M006', '357 Cedar St', 9876543215),
('M007', '468 Walnut St', 9876543216),
('M008', '579 Ash St', 9876543217),
('M009','680 Birch St', 9876543218),
('M010', '791 Cherry St', 9876543219);

-- To view the contents of the Branch table
SELECT * FROM Branch;


-- Create a table for employees
CREATE TABLE Employee (
    Emp_id INT PRIMARY KEY AUTO_INCREMENT,         -- Unique employee ID set as primary key
    Emp_name VARCHAR(50),           -- Name of the employee, up to 50 characters
    Position VARCHAR(25),           -- Position/job title of the employee, up to 25 characters
    Salary INT,                     -- Salary of the employee (integer value)
    Branch_no INT,                  -- Branch number indicating the branch employee works at
    FOREIGN KEY (Branch_no) REFERENCES Branch(Branch_no)  -- Foreign key linking to Branch table
)AUTO_INCREMENT= 201;

-- Inserting values into Employee table
INSERT INTO Employee ( Emp_name, Position, Salary, Branch_no) VALUES
('Jackie Howard', 'Librarian', 65000, 101),
('Cole Walter', 'Assistant', 28000, 102),
('Alex Walter', 'Manager', 54000, 101),
('Will Walter', 'Clerk', 25000, 101),
('Nathan Walter', 'Librarian', 33000, 105),
('Danny Walter', 'Assistant', 57000, 101),
('George Walter', 'Manager', 41000, 101),
('Katherine Walter', 'Librarian', 34000, 101),
('Lee Garcia', 'Assistant', 69000, 102),
('Lsaac Garcia', 'Clerk', 26000, 102);

-- To view the contents of the Employee table
SELECT * FROM Employee;

-- Create a table for books
CREATE TABLE Books (
    ISBN VARCHAR(5) PRIMARY KEY,   -- ISBN as primary key, assuming up to 15 characters
    Book_title VARCHAR(100),        -- Title of the book
    Category VARCHAR(50),           -- Category of the book (e.g., Fiction, Science)
    Rental_Price DECIMAL(6, 2),     -- Price with two decimal places (e.g., 19.99)
    Status ENUM('yes', 'no'),       -- Availability status: 'yes' if available, 'no' if not
    Author VARCHAR(50),             -- Author's name
    Publisher VARCHAR(50)           -- Publisher's name
);

-- Inserting values into Books table
INSERT INTO Books (ISBN, Book_title, Category, Rental_Price, Status, Author, Publisher) VALUES
('B001', 'Vampire Diaries', 'Fantasy', 25.99, 'yes', 'L. J. Smith', 'HarperTeen'),
('B002', 'Twilight', 'Fantasy', 32.99, 'no', 'Stephenie Meyer', 'Little, Brown and Company'),
('B003', 'To All the Boys I\'ve Loved Before', 'Romance', 10.99, 'yes', 'Jenny Han', 'Simon & Schuster'),
('B004', 'Kissing Booth', 'Romance', 11.99, 'no', 'Beth Reekles', 'Penguin Random House'),
('B005', 'The Tearsmith', 'Mystery', 14.50, 'yes', 'Chris Redding', 'Indie Press'),
('B006', 'My Life with the Water Boys', 'Drama', 13.75, 'yes', 'Sally Smith', 'Green Books Publishing'),
('B007', 'It Ends with Us', 'Romance', 14.99, 'no', 'Colleen Hoover', 'Atria Books'),
('B008', 'The Hunger Games', 'Dystopian', 25.00, 'yes', 'Suzanne Collins', 'Scholastic Press'),
('B009', 'Divergent', 'Dystopian', 26.00, 'no', 'Veronica Roth', 'Katherine Tegen Books'),
('B010', 'Harry Potter and the Sorcerer\'s Stone', 'Fantasy', 16.99, 'yes', 'J.K. Rowling', 'Bloomsbury');


-- Create a table for customers
CREATE TABLE Customer (
    Customer_id INT PRIMARY KEY,    -- Customer's ID as primary key
    Customer_name VARCHAR(50),      -- Customer's name
    Customer_address VARCHAR(50),   -- Customer's address
    Reg_date DATETIME               -- Registration date
);

-- Inserting values into Customer table 
INSERT INTO Customer (Customer_id, Customer_name, Customer_address, Reg_date) VALUES
(1, 'Alice Johnson', '789 Maple St', '2021-12-15 10:30:00'), -- Updated date
(2, 'Bob Smith', '456 Oak St', '2021-11-10 14:45:00'),       -- Updated date
(3, 'Catherine Lee', '123 Birch St', '2024-03-10 09:15:00'),
(4, 'David Brown', '102 Pine St', '2024-01-20 11:30:00'),
(5, 'Eva White', '67 Cedar St', '2024-02-28 16:00:00'),
(6, 'Frank Green', '234 Elm St', '2021-10-05 13:15:00'),     -- Updated date
(7, 'Grace Adams', '345 Oak St', '2024-04-01 10:00:00'),
(8, 'Helen Miller', '543 Maple St', '2024-04-07 14:25:00'),
(9, 'Isaac Taylor', '678 Birch St', '2024-03-22 09:45:00'),
(10, 'Jack Walker', '890 Cedar St', '2024-02-15 15:00:00');


-- Create a table for issue status
CREATE TABLE IssueStatus (
    Issue_id INT PRIMARY KEY,              -- Unique identifier for each issue record
    Issued_cust INT,                       -- Customer ID referencing the customer who issued the book
    Issued_book_name VARCHAR(100),         -- Name of the issued book
    Issue_date DATETIME,                   -- Date and time the book was issued
    ISBN_book VARCHAR(15),                 -- ISBN of the book being issued, linking to Books table
    FOREIGN KEY (Issued_cust) REFERENCES Customer(Customer_id),   -- Foreign key to Customer table
    FOREIGN KEY (ISBN_book) REFERENCES Books(ISBN)                -- Foreign key to Books table
);

-- Inserting values into IssueStatus table
INSERT INTO IssueStatus (Issue_id, Issued_cust, Issued_book_name, Issue_date, ISBN_book) VALUES
(101, 1, 'The Hunger Games', '2024-04-05 11:00:00', 'B008'),
(102, 2, 'Harry Potter and the Sorcerer\'s Stone', '2024-04-06 13:00:00', 'B010'),
(103, 3, 'Twilight', '2024-04-07 15:30:00', 'B002'),
(104, 4, 'Vampire Diaries', '2024-04-08 14:15:00', 'B001'),
(105, 5, 'The Tearsmith', '2023-06-09 12:00:00', 'B005'),
(106, 6, 'It Ends with Us', '2024-04-10 09:45:00', 'B007'),
(107, 7, 'Kissing Booth', '2023-06-11 10:30:00', 'B004'),
(108, 8, 'To All the Boys I\'ve Loved Before', '2024-04-12 11:15:00', 'B003'),
(109, 9, 'My Life with the Water Boys', '2024-04-13 12:00:00', 'B006'),
(110, 10, 'Divergent', '2023-06-14 10:15:00', 'B009');


-- Create a table for return status
CREATE TABLE ReturnStatus (
    Return_id INT PRIMARY KEY,             -- Unique identifier for each return record
    Return_cust INT,                       -- Customer ID referencing the customer who returned the book
    Return_book_name VARCHAR(100),         -- Name of the returned book
    Return_date DATETIME,                  -- Date and time the book was returned
    ISBN_book2 VARCHAR(15),                -- ISBN of the book being returned, linking to Books table
    FOREIGN KEY (Return_cust) REFERENCES Customer(Customer_id),   -- Foreign key to Customer table
    FOREIGN KEY (ISBN_book2) REFERENCES Books(ISBN)               -- Foreign key to Books table
);

-- Inserting values into ReturnStatus table
INSERT INTO ReturnStatus (Return_id, Return_cust, Return_book_name, Return_date, ISBN_book2) VALUES
(201, 1, 'The Hunger Games', '2024-04-20 10:00:00', 'B008'),
(202, 2, 'Harry Potter and the Sorcerer\'s Stone', '2024-04-21 11:00:00', 'B010'),
(203, 3, 'Twilight', '2024-04-22 12:30:00', 'B002'),
(204, 4, 'Vampire Diaries', '2024-04-23 14:45:00', 'B001'),
(205, 5, 'The Tearsmith', '2024-04-24 15:00:00', 'B005'),
(206, 6, 'It Ends with Us', '2024-04-25 10:15:00', 'B007'),
(207, 7, 'Kissing Booth', '2024-04-26 16:30:00', 'B004'),
(208, 8, 'To All the Boys I\'ve Loved Before', '2024-04-27 11:45:00', 'B003'),
(209, 9, 'My Life with the Water Boys', '2024-04-28 09:30:00', 'B006'),
(210, 10, 'Divergent', '2024-04-29 13:00:00', 'B009');


-- 1.Retrieve the book title, category, and rental price of all available books
SELECT Book_title, Category, Rental_Price 
FROM Books
WHERE Status = 'yes';

-- 2.List the employee names and their respective salaries in descending order of salary.
SELECT Emp_name, Salary 
FROM Employee 
ORDER BY Salary DESC;

-- 3.Retrieve the book titles and the corresponding customers who have issued those books.
SELECT B.Book_title, C.Customer_name
FROM IssueStatus I
JOIN Books B ON I.ISBN_book = B.ISBN
JOIN Customer C ON I.Issued_cust = C.Customer_id;

     
-- 4.Display the total count of books in each category
SELECT Category, COUNT(*)
FROM Books
GROUP BY Category;


-- 5.Retrieve the employee names and their positions form the employees whose salaries are above Rs.50,000. 
SELECT Emp_name, Position FROM Employee WHERE Salary <'50000';

-- 6.List the customer names who registered before 2022-01-01 and have not issued any books yet.
SELECT C.Customer_name, I.Issue_id
FROM Customer C
LEFT JOIN IssueStatus I ON C.Customer_id = I.Issued_cust
WHERE C.Reg_date < '2022-01-01';

-- 7.Display the branch numbers and the total count of employees in each branch:
SELECT Branch_no,COUNT(*) FROM Employee GROUP BY Branch_no;

-- 8. Display the names of customers who have issued books in the month of June 2023:
SELECT DISTINCT C.Customer_name
FROM IssueStatus I 
JOIN Customer C ON I.Issued_cust = C.Customer_id
WHERE YEAR(Issue_date)=2023
AND MONTH(Issue_date)=6;

-- 9.Retrieve book_title from the book table containing Fantasy (assuming Fantasy books are identified by 'Fantasy' in the title):
SELECT Book_title
FROM Books
WHERE Category LIKE '%Fantasy%';

-- 10.Retrieve the branch numbers along with the count of employees for branches having more than 5 employees:
SELECT Branch_no, COUNT(*) 
FROM Employee 
GROUP BY Branch_no
HAVING COUNT(*) > 5;

-- 11. Retrieve the names of employees who manage branches and their respective branch addresses:
SELECT E.Emp_name,B.Branch_address
FROM Employee E
JOIN Branch B on E.Branch_no=B.Branch_no
WHERE E.Position='Manager';

-- 12. Display the names of customers who have issued books with a rental price higher than Rs. 25:
SELECT DISTINCT C.Customer_name
FROM IssueStatus I
JOIN Books B ON I.ISBN_book = B.ISBN
JOIN Customer C ON I.Issued_cust = C.Customer_id
WHERE B.Rental_Price > 25;



     










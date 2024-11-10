#  📚 Library Management System - MySQL Project

This project is based on a Library Management System designed to track book information, costs, status, and the total number of available books. The project involves setting up a database with several tables, performing data management operations, and running queries to retrieve specific information.


## Project Overview
The Library Management System includes the following features:
*  Keeps track of books and their availability status.
*  Stores branch and employee details.
*  Manages customer information and book transactions, including issuance and return status.

## Database Schema
1. Branch
  * `Branch_no` (PRIMARY KEY)
  * `Manager_Id`
  * `Branch_address`
  * `Contact_no`

2. Employee
  * `Emp_Id` (PRIMARY KEY)
  * `Emp_name`
  * `Position`
  * `Salary`
  * `Branch_no` (FOREIGN KEY referring to `Branch_no` in `Branch` table)

3. Books
  * `ISBN` (PRIMARY KEY)
  * `Book_title`
  * `Category`
  * `Rental_Price`
  * `Status` (set as "yes" if available, "no" otherwise)
  * `Author`
  * `Publisher`

4. Customer
  * `Customer_Id` (PRIMARY KEY)
  * `Customer_name`
  * `Customer_address`
  * `Reg_date`


5. IssueStatus
  * `Issue_Id` (PRIMARY KEY)
  * `Issued_cust` (FOREIGN KEY referring to `Customer_Id` in `Customer` table)
  * `Issued_book_name`
  * `Issue_date`
  * `Isbn_book` (FOREIGN KEY referring to `ISBN` in `Books` table)

6. ReturnStatus
  * `Return_Id` (PRIMARY KEY)
  * `Return_cust`
  * `Return_book_name`
  * `Return_date`
  * `Isbn_book2` (FOREIGN KEY referring to `ISBN` in `Books` table)

    ## SQL Operations Used
* **CREATE DATABASE**: To set up the `library` database.
* **CREATE TABLE**: To define the tables (`Branch`, `Employee`, `Books`, `Customer`, `IssueStatus`, `ReturnStatus`) and their columns.
* **PRIMARY KEY and FOREIGN KEY Constraints**: Establish unique identifiers and relationships between tables (e.g.,` Branch_no` as the primary key in` Branch` and as a foreign key in `Employee`).
* **INSERT INTO**: Add initial data entries into each table for testing and query purposes.
* **SELECT**: To retrieve data based on specific conditions and requirements.
* **JOIN**: To combine data from multiple tables, especially when retrieving details across related entities like `Books`, `Customer`, and `IssueStatus`.
* **WHERE**: To filter records based on specified conditions (e.g., finding available books or employees with salaries above a certain amount).
* **ORDER BY**: To sort query results in ascending or descending order, such as ordering employees by salary.
* **GROUP BY**: To aggregate data by specific columns, such as counting books by category.
* **COUNT**: To calculate the number of records that meet specific criteria (e.g., total count of books in each category).
* **LIKE**: To search for patterns within text columns, such as finding book titles containing "history."
* **DATE Filtering**: This allows you to filter records by date, such as finding customers registered before a certain date or booking issues in a specific month.
* **HAVING**: To filter groups after aggregation, like displaying branches with more than 5 employees.

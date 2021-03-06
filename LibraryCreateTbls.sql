-----------------------------------------------------------
----------------- Create Library Tables -------------------
-----------------------------------------------------------

-----------------------------------------------------------
-- Create Database / Use it
-----------------------------------------------------------
--CREATE DATABASE db_library;
USE db_library;

-----------------------------------------------------------
-- If the tables already exist, drop and recreate them
-----------------------------------------------------------
--IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES tbl_book)
--	DROP TABLE tbl_book_loans, tbl_book_copies, tbl_book_authors, tbl_book, tbl_borrower, tbl_publisher, tbl_book, tbl_library_branch;	
		
-----------------------------------------------------------
-- Build database tables and define the schema
-----------------------------------------------------------
CREATE TABLE tbl_borrower (
	borrower_cardNo INT PRIMARY KEY NOT NULL IDENTITY (236100,1),
	borrower_name VARCHAR(50) NOT NULL,
	borrower_address VARCHAR(100) NOT NULL,
	borrower_phone VARCHAR(30) NOT NULL
);

CREATE TABLE tbl_publisher (
	publisher_name VARCHAR(75) PRIMARY KEY NOT NULL,
	publisher_address VARCHAR(100) NOT NULL,
	publisher_phone VARCHAR(30) NOT NULL
);

CREATE TABLE tbl_library_branch (
	library_branch_ID INT PRIMARY KEY NOT NULL IDENTITY (100,1),
	library_branchName VARCHAR(75) NOT NULL,
	library_address VARCHAR(100) NOT NULL
);

CREATE TABLE tbl_book (
	book_ID INT PRIMARY KEY NOT NULL IDENTITY (5000,1),
	book_title VARCHAR(200) NOT NULL,
	book_publisherName VARCHAR(75) NOT NULL
);

CREATE TABLE tbl_book_authors (
	book_authors_bookID INT NOT NULL CONSTRAINT fk_authors_bookID FOREIGN KEY REFERENCES tbl_book(book_ID) ON UPDATE CASCADE ON DELETE CASCADE,
	book_authors_authorname VARCHAR(75) NOT NULL
);

CREATE TABLE tbl_book_copies (
	book_copies_bookID INT NOT NULL CONSTRAINT fk_copies_bookID FOREIGN KEY REFERENCES tbl_book(book_ID) ON UPDATE CASCADE ON DELETE CASCADE,
	book_copies_branchID INT NOT NULL CONSTRAINT fk_copies_branchID FOREIGN KEY REFERENCES tbl_library_branch(library_branch_ID) ON UPDATE CASCADE ON DELETE CASCADE,
	book_copies_numCopies INT NOT NULL
);

CREATE TABLE tbl_book_loans (
	book_loans_bookID INT NOT NULL CONSTRAINT fk_loans_book_ID FOREIGN KEY REFERENCES tbl_book(book_ID) ON UPDATE CASCADE ON DELETE CASCADE,
	book_loans_branchID INT NOT NULL CONSTRAINT fk_loans_branch_ID FOREIGN KEY REFERENCES tbl_library_branch(library_branch_ID) ON UPDATE CASCADE ON DELETE CASCADE,
	book_loans_cardNo INT NOT NULL CONSTRAINT fk__loans_borrower_cardNo FOREIGN KEY REFERENCES tbl_borrower(borrower_cardNo) ON UPDATE CASCADE ON DELETE CASCADE,
	book_loans_DateOut DATE NOT NULL,
	book_loans_DueDate DATE NOT NULL
);


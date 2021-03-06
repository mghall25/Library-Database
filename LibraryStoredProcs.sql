------------------------------------------------------------------------------------------------------------------------------------
-- Library Stored Procs
------------------------------------------------------------------------------------------------------------------------------------

USE db_library;
GO

------------------------------------------------------------------------------------------------------------------------------------
-- 1 - BookCountForTitleInBranch - # books with a specified title in a specified branch
------------------------------------------------------------------------------------------------------------------------------------

-- Verify that the stored procedure does not exist.
IF OBJECT_ID ('usp_BookCountForTitleInBranch', 'P') IS NOT NULL
    DROP PROCEDURE usp_BookCountForTitleInBranch;
GO

-- Create procedure with parameters BookTitle and BranchName
CREATE PROCEDURE usp_BookCountForTitleInBranch @BookTitle VARCHAR(200), @BranchName VARCHAR(75)
AS
	SELECT
		SUM(bc.book_copies_numCopies) AS '# of Copies'
		FROM tbl_book b
		LEFT JOIN tbl_book_copies bc ON b.book_ID = bc.book_copies_bookID
		LEFT JOIN tbl_library_branch l ON bc.book_copies_branchID = l.library_branch_ID
		WHERE b.book_title = @BookTitle AND l.library_branchName = @BranchName
	;
GO


-- Execute procedure. Catch any errors
BEGIN TRY
	EXEC usp_BookCountForTitleInBranch 'The Lost Tribe','Sharpstown'
END TRY
BEGIN CATCH
    SELECT ERROR_MESSAGE() AS ErrorMessage;
END CATCH;
GO

------------------------------------------------------------------------------------------------------------------------------------
-- 2 - BookCountForTitlePerBranch - # books with title in each library branch
------------------------------------------------------------------------------------------------------------------------------------

-- Verify that the stored procedure does not exist.
IF OBJECT_ID ('usp_BookCountForTitlePerBranch', 'P') IS NOT NULL
    DROP PROCEDURE usp_BookCountForTitlePerBranch;
GO

-- Create procedure with parameter BookTitle
CREATE PROCEDURE usp_BookCountForTitlePerBranch @BookTitle VARCHAR(200)
AS
	SELECT
		l.library_branchName AS 'Branch', SUM(bc.book_copies_numCopies) AS '# of Copies'
		FROM tbl_book b
		LEFT JOIN tbl_book_copies bc ON b.book_ID = bc.book_copies_bookID
		LEFT JOIN tbl_library_branch l ON bc.book_copies_branchID = l.library_branch_ID
		WHERE b.book_title = @BookTitle
		GROUP BY l.library_branchName
	;
GO

-- Execute procedure. Catch any errors
BEGIN TRY
	EXEC usp_BookCountForTitlePerBranch 'The Lost Tribe'
END TRY
BEGIN CATCH
    SELECT ERROR_MESSAGE() AS ErrorMessage;
END CATCH;
GO

------------------------------------------------------------------------------------------------------------------------------------
-- 3 - BorrowersNoLoans - borrowers with no book loans
------------------------------------------------------------------------------------------------------------------------------------

-- Verify that the stored procedure does not exist.
IF OBJECT_ID ('usp_BorrowersNoLoans', 'P') IS NOT NULL
    DROP PROCEDURE usp_BorrowersNoLoans;
GO

-- Create procedure
CREATE PROCEDURE usp_BorrowersNoLoans
AS
	SELECT 
		b.borrower_name AS 'Borrowers With No Book Loans'
		FROM tbl_borrower b
		LEFT JOIN tbl_book_loans bl on b.borrower_cardNo = bl.book_loans_cardNo
		WHERE bl.book_loans_bookID IS NULL
		ORDER BY b.borrower_name
	;
GO

-- Execute procedure. Catch any errors
BEGIN TRY
	EXEC usp_BorrowersNoLoans
END TRY
BEGIN CATCH
    SELECT ERROR_MESSAGE() AS ErrorMessage;
END CATCH;
GO

------------------------------------------------------------------------------------------------------------------------------------
-- 4 - DueTodayInBranch - book title, borrow's name and address due today for a specified branch
------------------------------------------------------------------------------------------------------------------------------------
SELECT
	b.book_title AS 'Title', br.borrower_name AS 'Borrower', br.borrower_address AS 'Address'
	FROM tbl_book_loans bl
	LEFT JOIN tbl_borrower br ON bl.book_loans_cardNo = br.borrower_cardNo
	LEFT JOIN tbl_book b ON bl.book_loans_bookID = b.book_ID
	LEFT JOIN tbl_library_branch l ON bl.book_loans_branchID = l.library_branch_ID
	WHERE bl.book_loans_DueDate = CAST(GETDATE() AS DATE) AND l.library_branchName = 'Sharpstown'
	ORDER BY b.book_title
;

-- Verify that the stored procedure does not exist.
IF OBJECT_ID ('usp_DueTodayInBranch', 'P') IS NOT NULL
    DROP PROCEDURE usp_DueTodayInBranch;
GO

-- Create procedure with parameters BookTitle and BranchName
CREATE PROCEDURE usp_DueTodayInBranch @BranchName VARCHAR(75)
AS
	SELECT
		b.book_title AS 'Title', br.borrower_name AS 'Borrower', br.borrower_address AS 'Address'
		FROM tbl_book_loans bl
		LEFT JOIN tbl_borrower br ON bl.book_loans_cardNo = br.borrower_cardNo
		LEFT JOIN tbl_book b ON bl.book_loans_bookID = b.book_ID
		LEFT JOIN tbl_library_branch l ON bl.book_loans_branchID = l.library_branch_ID
		WHERE bl.book_loans_DueDate = CAST(GETDATE() AS DATE) AND l.library_branchName = @BranchName
		ORDER BY b.book_title
	;	
GO


-- Execute procedure. Catch any errors
BEGIN TRY
	EXEC usp_DueTodayInBranch 'Sharpstown'
END TRY
BEGIN CATCH
    SELECT ERROR_MESSAGE() AS ErrorMessage;
END CATCH;
GO

------------------------------------------------------------------------------------------------------------------------------------
-- 5 - BooksLoanedPerBranch - branch name and number of books loaned out from each branch
------------------------------------------------------------------------------------------------------------------------------------

-- Verify that the stored procedure does not exist.
IF OBJECT_ID ('usp_BooksLoanedPerBranch', 'P') IS NOT NULL
    DROP PROCEDURE usp_BooksLoanedPerBranch;
GO

-- Create procedure
CREATE PROCEDURE usp_BooksLoanedPerBranch
AS
	SELECT 
		l.library_branchName AS 'Branch', COUNT(bl.book_loans_bookID) AS 'Books Loaned'
		FROM tbl_library_branch l
		RIGHT JOIN tbl_book_loans bl ON l.library_branch_ID = bl.book_loans_branchID
		GROUP BY l.library_branchName
	;	
GO

-- Execute procedure. Catch any errors
BEGIN TRY
	EXEC usp_BooksLoanedPerBranch
END TRY
BEGIN CATCH
    SELECT ERROR_MESSAGE() AS ErrorMessage;
END CATCH;
GO

------------------------------------------------------------------------------------------------------------------------------------
-- 6 - BorrowersWithLargeBookLoans - borrow name, address, and number of books loaned if more than 5 books checked out
------------------------------------------------------------------------------------------------------------------------------------

-- Verify that the stored procedure does not exist.
IF OBJECT_ID ('usp_BorrowersWithLargeBookLoans', 'P') IS NOT NULL
    DROP PROCEDURE usp_BorrowersWithLargeBookLoans;
GO

-- Create procedure
CREATE PROCEDURE usp_BorrowersWithLargeBookLoans
AS
	SELECT
		br.borrower_name AS 'Name', br.borrower_address AS 'Address', COUNT(bl.book_loans_bookID) AS 'Books Loaned'
		FROM tbl_book_loans bl
		LEFT JOIN tbl_borrower br ON bl.book_loans_cardNo = br.borrower_cardNo
		GROUP BY br.borrower_name, br.borrower_address
		HAVING COUNT(bl.book_loans_bookID) > 5
	;	
GO

-- Execute procedure. Catch any errors
BEGIN TRY
	EXEC usp_BorrowersWithLargeBookLoans
END TRY
BEGIN CATCH
    SELECT ERROR_MESSAGE() AS ErrorMessage;
END CATCH;
GO

------------------------------------------------------------------------------------------------------------------------------------
-- 7 - BookCountPerAuthorInBranch - title and number of copies of books by a specified author at a specified branch
------------------------------------------------------------------------------------------------------------------------------------

-- Verify that the stored procedure does not exist.
IF OBJECT_ID ('usp_BookCountPerAuthorInBranch', 'P') IS NOT NULL
    DROP PROCEDURE usp_BookCountPerAuthorInBranch;
GO

-- Create procedure with parameters BookAuthor and BranchName
CREATE PROCEDURE usp_BookCountPerAuthorInBranch @BookAuthor VARCHAR(75), @BranchName VARCHAR(75)
AS
	SELECT
		b.book_title AS 'Title', SUM(bc.book_copies_numCopies) AS '# Books', ba.book_authors_authorname AS 'Author', l.library_branchName AS 'Branch'
		FROM tbl_book b
		LEFT JOIN tbl_book_authors ba ON b.book_ID = ba.book_authors_bookID
		LEFT JOIN tbl_book_copies bc ON b.book_ID = bc.book_copies_bookID
		LEFT JOIN tbl_library_branch l ON bc.book_copies_branchID = l.library_branch_ID
		WHERE ba.book_authors_authorname = @BookAuthor AND l.library_branchName = @BranchName
		GROUP BY b.book_title, ba.book_authors_authorname, l.library_branchName
		ORDER BY b.book_title, ba.book_authors_authorname, l.library_branchName
	;
GO

-- Execute procedure. Catch any errors
BEGIN TRY
	EXEC usp_BookCountPerAuthorInBranch 'Stephen King','Central'
END TRY
BEGIN CATCH
    SELECT ERROR_MESSAGE() AS ErrorMessage;
END CATCH;
GO
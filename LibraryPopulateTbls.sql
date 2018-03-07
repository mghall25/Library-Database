-----------------------------------------------------------
-- Populate Library Tables
-----------------------------------------------------------
INSERT INTO tbl_borrower
	(borrower_name,borrower_address,borrower_phone)
	VALUES 
	('Anna Hale','3615 Knoll Dr, Newberg, OR 97132','503.564.9658'),
	('Emily Rummel','123 Bentwood Ct, Newberg, OR 97132','587.254.1236'),
	('Grace Leone','215 The Greens Ave, Newberg, OR 97132','859.654.7415'),
	('Anthony Leone','215 The Greens Ave, Newberg, OR 97132','859.654.7415'),
	('Sam Ng','258 Pioneer Place, Portland, OR 87458','458.254.1254'),
	('Josiah Ng','854 Center St, Sherwood, OR 97140','456.587.1254'),
	('Daniel Kane','784 Madison St, Canby, OR 78945','697.452.4569'),
	('Michael Franklin','584 Sunset St, Dundee, OR 97115','458.125.1568')
;
SELECT * FROM tbl_borrower;


INSERT INTO tbl_publisher
	(publisher_name, publisher_address,publisher_phone)
	VALUES 
	('Wolfe Publishing Limited','543 5th Avenue, New York, NY 76543','743.325.2369'),
	('Galaxy Press, Inc.','7051 Hollywood Blvd, Hollywood, CA 90028','978.159.2587'),
	('Reformist Trust','400 Technology Park, Lake Mary, FL 32741','456.852.1596'),
	('Gold ''n'' Honey Books','PO Box 1720, Sisters, OR 97759','258.456.7895'),
	('Penguin Books','325 Lake View, Chicago, IL 78985','558.258.4569')
;
SELECT * FROM tbl_publisher;


INSERT INTO tbl_library_branch
	(library_branchName, library_address)
	VALUES 
	('Sharpstown','321 Sherwood Ave, Sherwood, OR 97140'),
	('Central','258 Main St, Portland, OR 97258'),
	('Portland','456 5th Ave., Portland, OR 97258'),
	('Camas','3214 Reese Way, Camas, WA 78945')
;
SELECT * FROM tbl_library_branch;


INSERT INTO tbl_book
	(book_title,book_publisherName)
	VALUES 
	('The Lightlings','Reformist Trust'),
	('The Prince''s Poison Cup','Reformist Trust'),
	('Battlefield Earth','Galaxy Press, Inc.'),
	('Great Fairy Taled of Ireland','Wolfe Publishing Limited'),
	('A Tale of Two Princes','Gold ''n'' Honey Books'),
	('Pride and Prejudice','Penguin Books'),
	('The Green Mile','Galaxy Press, Inc.'),
	('Under the Dome','Galaxy Press, Inc.'),
	('Different Seasons','Galaxy Press, Inc.'),
	('To Kill a Mockingbird','Penguin Books'),
	('1984','Penguin Books'),
	('The Great Gatsby','Penguin Books'),
	('Jane Eyre','Penguin Books'),
	('Wuthering Heights','Penguin Books'),
	('The Catcher in the Rye','Penguin Books'),
	('Little Women','Penguin Books'),
	('Huckleberry Finn','Penguin Books'),
	('Moby Dick','Penguin Books'),
	('Emma','Penguin Books'),
	('A Tale of Two Cities','Penguin Books'),
	('The Lost Tribe','Reformist Trust')
;
SELECT * FROM tbl_book;

INSERT INTO tbl_book_authors
	(book_authors_bookID, book_authors_authorname)
	VALUES 
	(5000,'R.C. Sproul'),
	(5001,'R.C. Sproul'),
	(5002,'L. Ron Hubbard'),
	(5003,'Mary McGarry'),
	(5004,'Gisela Scheer'),
	(5005,'Jane Austen'),
	(5006,'Stephen King'),
	(5007,'Stephen King'),
	(5008,'Stephen King'),
	(5009,'Harper Lee'),
	(5010,'George Orwell'),
	(5011,'F. Scott Fitzgerald'),
	(5012,'Jane Eyre'),
	(5013,'Emily Bronte'),
	(5014,'J.D. Salinger'),
	(5015,'Louisa May Alcott'),
	(5016,'Mark Twain'),
	(5017,'Herman Melville'),
	(5018,'Jane Eyre'),
	(5019,'Charles Dickens'),
	(5020,'John Smith')
;
SELECT * FROM tbl_book_authors;

INSERT INTO tbl_book_copies
	(book_copies_bookID, book_copies_branchID, book_copies_numCopies)
	VALUES 
	(5000,100,4),
	(5001,100,3),
	(5002,100,2),
	(5003,100,7),
	(5004,100,6),
	(5005,100,5),
	(5006,100,12),
	(5007,100,6),
	(5008,100,8),
	(5009,100,9),
	(5010,100,6),
	(5000,101,3),
	(5001,101,7),
	(5002,101,5),
	(5003,101,2),
	(5004,101,8),
	(5005,101,4),
	(5006,101,3),
	(5007,101,2),
	(5008,101,5),
	(5009,101,6),
	(5010,101,8),
	(5011,100,2),
	(5012,101,4),
	(5013,100,1),
	(5014,101,2),
	(5015,100,8),
	(5016,101,2),
	(5017,100,9),
	(5018,101,3),
	(5019,100,3),
	(5020,100,3)
;
SELECT * FROM tbl_book_copies;


INSERT INTO tbl_book_loans
	(book_loans_bookID, book_loans_branchID, book_loans_cardNo, book_loans_DateOut, book_loans_DueDate)
	VALUES 
	(5000,100,236100,'2018-02-01','2018-02-22'),
	(5001,100,236100,'2018-02-01','2018-02-22'),
	(5002,100,236100,'2018-02-01','2018-02-22'),
	(5003,100,236100,'2018-02-01','2018-02-22'),
	(5015,100,236100,'2018-02-01','2018-02-22'),
	(5016,100,236100,'2018-02-07','2018-02-28'),
	(5019,100,236107,'2018-02-07','2018-02-28'),
	(5011,100,236107,'2018-02-07','2018-02-28'),
	(5010,100,236107,'2018-02-07','2018-02-28'),
	(5013,100,236107,'2018-02-07','2018-02-28'),
	(5016,100,236107,'2018-02-07','2018-02-28'),
	(5017,100,236107,'2018-02-07','2018-02-28'),
	(5009,100,236107,'2018-02-07','2018-02-28'),
	(5001,100,236107,'2018-02-07','2018-02-28'),
	(5000,100,236107,'2018-02-07','2018-02-28'),
	(5003,100,236107,'2018-02-07','2018-02-28'),
	(5000,100,236105,'2018-01-25','2018-02-15'),
	(5001,101,236105,'2018-01-25','2018-02-15'),
	(5002,100,236105,'2018-01-25','2018-02-15'),
	(5003,100,236105,'2018-01-25','2018-02-15'),
	(5015,100,236105,'2018-01-25','2018-02-15'),
	(5016,101,236105,'2018-01-25','2018-02-15'),
	(5019,100,236105,'2018-01-25','2018-02-15'),
	(5011,100,236103,'2018-01-26','2018-02-16'),
	(5010,101,236102,'2018-01-26','2018-02-16'),
	(5013,100,236107,'2018-01-26','2018-02-16'),
	(5016,100,236100,'2018-01-26','2018-02-16'),
	(5017,101,236102,'2018-01-26','2018-02-16'),
	(5009,100,236106,'2018-01-26','2018-02-16'),
	(5001,100,236105,'2018-01-26','2018-02-16'),
	(5000,101,236103,'2018-01-26','2018-02-16'),
	(5003,100,236102,'2018-01-26','2018-02-16'),
	(5000,101,236103,'2018-02-01','2018-02-22'),
	(5001,101,236103,'2018-02-01','2018-02-22'),
	(5002,101,236104,'2018-02-01','2018-02-22'),
	(5003,101,236103,'2018-02-01','2018-02-22'),
	(5015,101,236103,'2018-02-01','2018-02-22'),
	(5016,101,236103,'2018-02-07','2018-02-28'),
	(5019,101,236104,'2018-02-07','2018-02-28'),
	(5011,101,236104,'2018-02-07','2018-02-28'),
	(5010,101,236105,'2018-02-07','2018-02-28'),
	(5013,100,236106,'2018-02-07','2018-02-28'),
	(5016,100,236107,'2018-02-07','2018-02-28'),
	(5017,100,236107,'2018-02-07','2018-02-28'),
	(5009,100,236107,'2018-02-07','2018-02-28'),
	(5006,101,236107,'2018-02-07','2018-02-28'),
	(5007,101,236107,'2018-02-07','2018-02-28'),
	(5008,101,236107,'2018-02-07','2018-02-28'),
	(5006,101,236106,'2018-02-07','2018-02-28'),
	(5007,101,236106,'2018-02-07','2018-02-28'),
	(5008,101,236106,'2018-02-07','2018-02-28'),
	(5006,101,236105,'2018-02-07','2018-02-28'),
	(5007,101,236105,'2018-02-07','2018-02-28'),
	(5008,101,236105,'2018-02-07','2018-02-28'),
	(5006,101,236104,'2018-02-07','2018-02-28'),
	(5007,101,236104,'2018-02-07','2018-02-28'),
	(5006,101,236103,'2018-02-07','2018-02-28')
;
SELECT * FROM tbl_book_loans;


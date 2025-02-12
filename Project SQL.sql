Create Database LibraryManagementSystem;
Use LibraryManagementSystem
 Create Table Books 
 ( 
   ID INT PRIMARY KEY IDENTITY,
    Title NVARCHAR (255) Not Null ,
    Author NVARCHAR (255) Not Null ,
    Genre NVARCHAR (255) Not Null ,
	PuplicationYear date Not Null ,
	AvailabilityStatus VARCHAR (255) Not Null

 );

  Create Table Categories 
 ( 
   ID INT PRIMARY KEY IDENTITY,
	Name VARCHAR   (255) Not Null,
	Description VARCHAR  (255) Not Null
 );

  Create Table Book_Categories 
 ( 
   ID INT PRIMARY KEY IDENTITY,
	BookID int,
	CategoryID int,
	FOREIGN KEY (BookID) REFERENCES Books(ID), 
	FOREIGN KEY (CategoryID) REFERENCES Categories (ID) 
	
 );

 -- Insert data into Categories
INSERT INTO Categories (Name, Description) 
VALUES 
('Science Fiction', 'Books that explore futuristic concepts, space travel, and advanced technology.'),
('Programming', 'Books related to software development and coding.'),
('Database', 'Books covering database management, SQL, and data structures.'),
('Technology', 'Books about advancements in technology and computing.'),
('Machine Learning', 'Books on artificial intelligence and data science.'),
('Networking', 'Books about computer networking and security.'),
('Mathematics', 'Books covering mathematical theories and applications.'),
('Cybersecurity', 'Books on information security and ethical hacking.'),
('Physics', 'Books about physical sciences and theoretical physics.'),
('Engineering', 'Books on various engineering disciplines and concepts.');

-- Insert data into Books
INSERT INTO Books (Title, Author, Genre, PuplicationYear, AvailabilityStatus) 
VALUES 
('SQL for Beginners', 'John Doe', 'Database', '2022-06-15', 'Reserved'),
('Database Fundamentals', 'Jane Smith', 'Database', '2021-04-10', 'Reserved'),
('C# Programming', 'Mark Johnson', 'Programming', '2020-09-25', 'Reserved'),
('The Future of AI', 'Elon West', 'Technology', '2023-01-12', 'Available'),
('Neural Networks Explained', 'Sarah Brown', 'Machine Learning', '2022-11-05', ' Pending'),
('Cybersecurity Essentials', 'Robert White', 'Cybersecurity', '2019-07-20', 'Available'),
('The Quantum Realm', 'Albert Ken', 'Science Fiction', '2024-02-01', 'Available'),
('Networking Basics', 'Emily Davis', 'Networking', '2018-03-17', ' Reserved'),
('Advanced Mathematics', 'Michael Green', 'Mathematics', '2017-08-22', 'Available'),
('Space Colonization', 'Liam Parker', 'Science Fiction', '2023-05-30', 'Available');



-- Insert data into BookCategories (Assigning multiple categories to some books)
INSERT INTO Book_Categories (BookID, CategoryID)
VALUES 
-- Assign SQL for Beginners to Database and Technology
(1, 3), (1, 4),

-- Assign Database Fundamentals to Database and Engineering
(2, 3), (2, 10),

-- Assign C# Programming to Programming and Technology
(3, 2), (3, 4),

-- Assign The Future of AI to Technology and Machine Learning
(4, 4), (4, 5),

-- Assign Neural Networks Explained to Machine Learning and Mathematics
(5, 5), (5, 7),

-- Assign Cybersecurity Essentials to Cybersecurity and Networking
(6, 8), (6, 6),

-- Assign The Quantum Realm to Science Fiction and Physics
(7, 1), (7, 9),

-- Assign Networking Basics to Networking and Cybersecurity
(8, 6), (8, 8),

-- Assign Advanced Mathematics to Mathematics and Engineering
(9, 7), (9, 10),

-- Assign Space Colonization to Science Fiction and Engineering
(10, 1), (10, 10);


 Create Table Members  
 ( 
   ID INT PRIMARY KEY IDENTITY,
    Name Varchar (255) Not Null ,
    Phone Varchar (255) unique ,
	MembershipType Varchar (255) Not Null ,
	RegestrationDate Date  Not Null
 );
   Create Table Borrowing  
 ( 
   ID INT PRIMARY KEY IDENTITY,
   BorrowingDate Date Not Null,
   DueDate Date Not Null,
   ReturnDate Date ,
   BookID int,
   MemberID int,
   FOREIGN KEY (BookID) REFERENCES Books(ID), 
   FOREIGN KEY (MemberID) REFERENCES Members (ID) 
 );

 -- Insert data into Members
INSERT INTO Members (Name, Phone, MembershipType, RegestrationDate) 
VALUES 
('Ali Ahmed', '0771234567', 'Student', '2025-01-01'),
('Sara Khalid', '0792345678', 'Teacher', '2025-01-01'),
('Omar Hasan', '0783456789', 'Visitor', '2025-01-01'),
('Lina Saeed', '0774567890', 'Student', '2025-01-02'),
('Hassan Mahmoud', '0795678901', 'Teacher', '2025-01-03'),
('Noor Adel', '0786789012', 'Visitor', '2025-01-05'),
('Yousef Tarek', '0777890123', 'Student', '2025-01-06'),
('Hala Nasser', '0798901234', 'Teacher', '2025-01-07'),
('Faris Emad', '0789012345', 'Visitor', '2025-01-08'),
('Dana Ibrahim', '0770123456', 'Student', '2025-01-09');


-- Insert data into Borrowing table
INSERT INTO Borrowing (BorrowingDate, DueDate, ReturnDate, BookID, MemberID) 
VALUES 
-- Borrowed "SQL for Beginners" (ID: 1)
('2024-02-01', '2024-02-10', NULL, 1, 1), -- Not returned
('2024-01-05', '2024-01-15', '2024-01-14', 1, 2), -- Returned on time
('2024-01-08', '2024-01-18', '2024-01-20', 1, 3), -- Returned late
('2024-02-02', '2024-02-12', NULL, 1, 4), -- Not returned

-- Borrowed & Returned "C# Programming" (ID: 3)
('2024-01-10', '2024-01-20', '2024-01-18', 3, 5), -- Returned on time
('2024-02-03', '2024-02-13', '2024-02-16', 3, 6), -- Returned late
('2024-01-02', '2024-01-12', '2024-01-11', 3, 7), -- Returned on time

-- Borrowed more than 3 times (e.g., "Neural Networks Explained" ID: 5)
('2024-01-04', '2024-01-14', '2024-01-13', 5, 8), -- Returned on time
('2024-02-06', '2024-02-16', NULL, 5, 9), -- Not returned
('2024-02-07', '2024-02-17', '2024-02-19', 5, 10), -- Returned late
('2024-02-08', '2024-02-18', '2024-02-15', 5, 1), -- Returned on time

-- Borrowed between Jan 1, 2024 – Jan 10, 2024
('2024-01-03', '2024-01-13', '2024-01-12', 6, 2), -- Returned on time
('2024-01-07', '2024-01-17', NULL, 7, 3), -- Not returned

-- Borrowed "Science Fiction" books (e.g., "The Quantum Realm" ID: 7, "Space Colonization" ID: 10)
('2024-02-09', '2024-02-19', NULL, 7, 4), -- Not returned
('2024-02-10', '2024-02-20', '2024-02-21', 10, 5); -- Returned late



   Create Table Reservations  
 ( 
   ID INT PRIMARY KEY IDENTITY,
   ReservationDate Date Not Null,
   Status Varchar (255) ,
   BookID int,
   MemberID int,
   FOREIGN KEY (BookID) REFERENCES Books(ID), 
   FOREIGN KEY (MemberID) REFERENCES Members (ID) 
 );

 -- Insert data into Reservations table
INSERT INTO Reservations (ReservationDate, Status, BookID, MemberID) 
VALUES 
-- Members reserving "SQL for Beginners" (BookID: 1)
('2024-02-01', 'Pending', 1, 1), 
('2024-01-05', 'Completed', 1, 2),

-- Members reserving "C# Programming" (BookID: 3)
('2024-02-10', 'Pending', 3, 3),
('2024-01-15', 'Completed', 3, 4),

-- Science Fiction books (e.g., "The Quantum Realm" BookID: 7, "Space Colonization" BookID: 10)
('2024-02-12', 'Pending', 7, 5),
('2024-01-20', 'Completed', 10, 6),

-- Other book reservations
('2024-02-05', 'Pending', 5, 7), 
('2024-01-25', 'Completed', 6, 8),
('2024-02-08', 'Pending', 9, 9);

 Create Table FinancialFines  
 ( 
   ID INT PRIMARY KEY IDENTITY,
   Amount Decimal ,
   PaymentStatus Varchar (255) ,
   BorrowingID int,
   FOREIGN KEY (BorrowingID) REFERENCES Borrowing(ID), 
 );

 -- Insert data into FinancialFines table
INSERT INTO FinancialFines (Amount, PaymentStatus, BorrowingID) 
VALUES 
-- Late returns (Books returned after due date, small fine)
(5.00, 'Paid', 2),   -- Member returned "C# Programming" late
(7.50, 'Pending', 5), -- Member returned a book late

-- Unreturned books (Higher fine, still pending)
(15.00, 'Pending', 7),  -- Member borrowed "SQL for Beginners" but never returned
(20.00, 'Pending', 8),  -- Another book that was never returned

-- Another late return scenario
(10.00, 'Paid', 10), -- Member paid fine for late return

-- General fines (Combination of paid & pending)
(12.00, 'Paid', 12),
(18.50, 'Pending', 15);



 Create Table LibraryStaff  
 ( 
   ID INT PRIMARY KEY IDENTITY,
    Name Varchar (255) Not Null ,
    Phone Varchar (255) unique ,
    Email Varchar (255) unique ,
	AssignedSection Varchar (255) Not Null ,
	EmploymentDate Date  Not Null
 );

 -- Insert data into LibraryStaff table
INSERT INTO LibraryStaff (Name, Phone, Email, AssignedSection, EmploymentDate) 
VALUES 
-- Staff members managing borrowing
('John Doe', '1234567890', 'john.doe@library.com', 'Borrowing', '2022-01-15'),
('Jane Smith', '2345678901', 'jane.smith@library.com', 'Borrowing', '2023-06-01'),

-- Staff members managing reservations
('Alice Johnson', '3456789012', 'alice.johnson@library.com', 'Reservations', '2021-11-22'),
('Bob Brown', '4567890123', 'bob.brown@library.com', 'Reservations', '2024-02-01'),

-- Staff members managing financial fines
('Emily Clark', '5678901234', 'emily.clark@library.com', 'Fines', '2020-08-17'),
('Tom Harris', '6789012345', 'tom.harris@library.com', 'Fines', '2022-05-25'),

-- Staff managing general library operations
('Nina White', '7890123456', 'nina.white@library.com', 'General Operations', '2023-03-10'),
('Samuel Green', '8901234567', 'samuel.green@library.com', 'General Operations', '2021-12-18');


--1 Write an SQL query to find all members who registered on 1-1-2025.

Select * 
From Members 
Where Members.RegestrationDate = '1-1-2025';

--2 Write an SQL query to retrieve all details of a book titled "Database Fundamentals".

Select * 
From Books
Where Books.Title='Database Fundamentals';

--3 The Members table is missing an Email column. Write an SQL query to add an Email column with a data type suitable for storing email addresses.

Alter Table Members
Add Email Varchar (255);

Select * From Members;

--4 Write an SQL query to insert a new member with the following details:
--Name: Omar
--Contact: 9876543210
--Membership Type: Student
--Registration Date: 5-6-2024
--Email: Omar@gmail.com

Insert Into Members 
Values ('Omar', '9876543210', 'Student', '5-6-2024','Omar@gmail.com' );

5--Write an SQL query to find all members who have made a book reservation.

Select *
From Members 
inner join Reservations On Members.ID = Reservations.MemberID

--6 Write an SQL query to find members who have borrowed the book titled "SQL for Beginners".

Select *
From Members
inner join Borrowing On Members.ID = Borrowing.MemberID
inner join Books On Books.ID = Borrowing.MemberID
where Books.Title = 'SQL for Beginners';

--7 Write an SQL query to find all members who have borrowed and returned the book titled "C# Programming".
Select *
From Members
inner join Borrowing On Members.ID = Borrowing.MemberID
inner join Books On Books.ID = Borrowing.MemberID
where Books.Title = 'C# Programming' and ReturnDate is not null;

--8 Write an SQL query to find members who have returned books after the due date.
Select *
From Members
inner join Borrowing On Members.ID = Borrowing.MemberID
inner join Books On Books.ID = Borrowing.MemberID
where ReturnDate > DueDate;


--9  Select books borrowed more than 3 times
Select Books.Title ,  COUNT(Borrowing.BookID) AS BorrowCount
From Borrowing
inner join Books On Books.ID = Borrowing.BookID
GROUP BY Books.Title
HAVING COUNT(Borrowing.BookID) > 3;

--10 Write an SQL query to find members who have borrowed a book between January 1, 2024, and January 10, 2024.

Select * 
From Borrowing
inner join Members on Members.ID = Borrowing.MemberID
where BorrowingDate  BETWEEN '2024-01-01' AND '2024-01-10';

--11 Write an SQL query to count the total number of books available in the library.

SELECT COUNT(*) AS TotalBooks
FROM Books
where Books.AvailabilityStatus='Available';

--12 Write an SQL query to find members who have borrowed books but not returned them yet.


Select * 
From Borrowing
inner join Members on Members.ID = Borrowing.MemberID
where ReturnDate is null  ;

--13 Write an SQL query to find members who have borrowed a book from the "Science Fiction" category.

Select * 
From Borrowing
inner join Members on Members.ID = Borrowing.MemberID
inner join Books on Books.ID = Borrowing.BookID

where Books.Genre='Science Fiction'  ;
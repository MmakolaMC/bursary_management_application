-- GRANT INSERT ON dbo.Institution TO [team-red];
-- GRANT INSERT ON dbo.Race TO [team-red];



INSERT INTO Institution (InstituteName)
VALUES ('University of Limpopo'),
       ('College of ABC'),
       ('University of Johannesburg');


INSERT INTO Race (RaceName)
VALUES ('BLACK'),
       ('COLOURED'),
       ('INDIAN');
  
INSERT INTO Students (StudentName, StudentAge, InstitionID, RaceID)
VALUES ('John Doe', 25, 1, 1),
       ('Jane Smith', 22, 2, 2),
       ('Michael Johnson', 20, 3, 3);


INSERT INTO Documents (DocumentType, StudentID)
VALUES ('Transcript', 1),
       ('Application Form', 2),
       ('ID Card', 3);

INSERT INTO Department (DepartmentName, InstitutionID)
VALUES ('Computer Science', 1),
       ('Engineering', 2),
       ('Informatics ', 3);


INSERT INTO HeadOfDepartment (HeadOfDepartmentName, DepartmentID)
VALUES ('Dr. Smith', 1),
       ('Prof. Coulter', 2),
       ('Ms. Brown', 3);


INSERT INTO Reviewer (ReviewerName, ReviewerNumber, ReviewerEmail)
VALUES ('Mr. White', 123456789, 'white@example.com'),
       ('Ms. Black', 987654321, 'black@example.com');


INSERT INTO Budget (DateTime, BudgetAmount, ReviewerID)
VALUES ('2023-01-01', 10000.00, 1);


INSERT INTO status (statusName)
VALUES ('Pending'),
       ('Approved'),
       ('Rejected');


INSERT INTO Application ( status, DepartmentID, StudentID, StatusID)
VALUES ( 'Pending', 1, 1, 1),
       ('Approved', 2, 2, 2);

INSERT INTO Funds (AmountFunded, DepartmentID, BudgetID)
VALUES (3000.00, 1, 1),
       (4000.00, 2, 1);


INSERT INTO Programs (ProgramName, InstitutionID)
VALUES ('Computer Science Program', 1),
       ('Engineering Program', 2),
       ('Informatics', 3);



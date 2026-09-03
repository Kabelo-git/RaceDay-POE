-- Create database
CREATE DATABASE RaceDayDB;
GO

USE RaceDayDB;
GO

-- 1. User table
CREATE TABLE [User] (
    UserId INT IDENTITY(1,1) PRIMARY KEY,
    FullName VARCHAR(100) NOT NULL,
    Email VARCHAR(150) NOT NULL UNIQUE,
    PasswordHash VARCHAR(255) NOT NULL,
    Role VARCHAR(20) NOT NULL DEFAULT 'Participant'
);
GO

-- 2. Event table
CREATE TABLE Event (
    EventId INT IDENTITY(1,1) PRIMARY KEY,
    OrganiserId INT NOT NULL,
    EventName VARCHAR(150) NOT NULL,
    EventDate DATETIME NOT NULL,
    Location VARCHAR(150) NOT NULL,
    Description VARCHAR(500) NULL,
    CONSTRAINT FK_Event_Organiser FOREIGN KEY (OrganiserId) REFERENCES [User](UserId)
);
GO

-- 3. Category table
CREATE TABLE Category (
    CategoryId INT IDENTITY(1,1) PRIMARY KEY,
    EventId INT NOT NULL,
    CategoryName VARCHAR(50) NOT NULL,
    Distance DECIMAL(6,2) NOT NULL,
    Price DECIMAL(8,2) NOT NULL DEFAULT 0,
    CONSTRAINT FK_Category_Event FOREIGN KEY (EventId) REFERENCES Event(EventId)
);
GO

-- 4. Route table
CREATE TABLE Route (
    RouteId INT IDENTITY(1,1) PRIMARY KEY,
    EventId INT NOT NULL,
    RouteName VARCHAR(100) NOT NULL,
    ElevationGain DECIMAL(6,2) NULL,
    MapUrl VARCHAR(255) NULL,
    CONSTRAINT FK_Route_Event FOREIGN KEY (EventId) REFERENCES Event(EventId)
);
GO

-- 5. Enrolment table
CREATE TABLE Enrolment (
    EnrolmentId INT IDENTITY(1,1) PRIMARY KEY,
    ParticipantId INT NOT NULL,
    CategoryId INT NOT NULL,
    EnrolmentDate DATETIME NOT NULL DEFAULT GETDATE(),
    Status VARCHAR(20) NOT NULL DEFAULT 'Confirmed',
    CONSTRAINT FK_Enrolment_Participant FOREIGN KEY (ParticipantId) REFERENCES [User](UserId),
    CONSTRAINT FK_Enrolment_Category FOREIGN KEY (CategoryId) REFERENCES Category(CategoryId)
);
GO

-- 6. Result table
CREATE TABLE Result (
    ResultId INT IDENTITY(1,1) PRIMARY KEY,
    EnrolmentId INT NOT NULL UNIQUE,
    FinishTime TIME NOT NULL,
    Position INT NULL,
    CONSTRAINT FK_Result_Enrolment FOREIGN KEY (EnrolmentId) REFERENCES Enrolment(EnrolmentId)
);
GO

-- ===== SEED DATA =====

-- Organisers (2)
INSERT INTO [User] (FullName, Email, PasswordHash, Role) VALUES
('Thabo Nkosi', 'thabo.organiser@raceday.co.za', 'hashed_password_1', 'Organiser'),
('Lerato Dube', 'lerato.organiser@raceday.co.za', 'hashed_password_2', 'Organiser');

-- Participants (2)
INSERT INTO [User] (FullName, Email, PasswordHash, Role) VALUES
('Sipho Mahlangu', 'sipho.participant@raceday.co.za', 'hashed_password_3', 'Participant'),
('Amanda Botha', 'amanda.participant@raceday.co.za', 'hashed_password_4', 'Participant');

-- Events (3)
INSERT INTO Event (OrganiserId, EventName, EventDate, Location, Description) VALUES
(1, 'Johannesburg City Run', '2026-10-10 07:00:00', 'Johannesburg', 'Annual city road running event.'),
(1, 'Soweto Marathon', '2026-11-15 06:00:00', 'Soweto', 'Community marathon through Soweto.'),
(2, 'Cape Town Cycle Tour', '2026-12-01 06:30:00', 'Cape Town', 'Scenic cycling event around Cape Town.');

-- Categories (one or more per event)
INSERT INTO Category (EventId, CategoryName, Distance, Price) VALUES
(1, '5km', 5.00, 100.00),
(1, '10km', 10.00, 150.00),
(2, '21km', 21.10, 250.00),
(2, '42km', 42.20, 350.00),
(3, '109km Cycle', 109.00, 400.00);

-- Sample enrolments
INSERT INTO Enrolment (ParticipantId, CategoryId, Status) VALUES
(3, 1, 'Confirmed'),
(3, 3, 'Confirmed'),
(4, 5, 'Confirmed');

-- Sample results
INSERT INTO Result (EnrolmentId, FinishTime, Position) VALUES
(1, '00:28:15', 12),
(3, '03:45:20', 5);
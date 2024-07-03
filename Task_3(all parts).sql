Task 3
1)Database Creation
 -- create Database
 CREATE DATABASE EventsManagement;

-- create TABLE
CREATE TABLE Events (
    Event_Id SERIAL PRIMARY KEY,
    Event_Name VARCHAR(100),
    Event_Date DATE,
    Event_Location VARCHAR(100),
    Event_Description TEXT
);

CREATE TABLE Attendees (
    Attendee_Id SERIAL PRIMARY KEY,
    Attendee_Name VARCHAR(100),
    Attendee_Phone VARCHAR(15),
    Attendee_Email VARCHAR(100),
    Attendee_City VARCHAR(100)
);

CREATE TABLE Registrations (
    Registration_Id SERIAL PRIMARY KEY,
    Event_Id INT REFERENCES Events(Event_Id),
    Attendee_Id INT REFERENCES Attendees(Attendee_Id),
    Registration_Date DATE,
    Registration_Amount NUMERIC(10, 2)
);




 



2) Data Creation


-- Inserting data into Events
INSERT INTO Events (Event_Name, Event_Date, Event_Location, Event_Description) VALUES
('Tech Conference', '2024-08-15', 'Pune', 'Annual tech conference focusing on AI and ML.'),
('Art Expo', '2024-09-20', 'Kolkata', 'Exhibition of contemporary art.'),
('Music Festival', '2024-10-10', 'Chennai', 'Live music festival featuring various artists.');

-- Inserting  data into Attendees
INSERT INTO Attendees (Attendee_Name, Attendee_Phone, Attendee_Email, Attendee_City) VALUES
('Rohan Sharma', '9876543210', 'rohan.sharma@example.com', 'Pune'),
('Ananya Mehta', '8765432109', 'ananya.mehta@example.com', 'Kolkata'),
('Arjun Verma', '7654321098', 'arjun.verma@example.com', 'Chennai'),
('Meera Iyer', '6543210987', 'meera.iyer@example.com', 'Bangalore'),
('Vikram Singh', '5432109876', 'vikram.singh@example.com', 'Mumbai');

-- Inserting data into Registrations
INSERT INTO Registrations (Event_Id, Attendee_Id, Registration_Date, Registration_Amount) VALUES
(1, 1, '2024-08-01', 500.00),
(1, 5, '2024-08-02', 500.00),
(2, 2, '2024-09-05', 300.00),
(2, 4, '2024-09-06', 300.00),
(3, 3, '2024-09-25', 600.00);


 


3) Manage Event Details

a) --Inserting a new event.

INSERT INTO Events (Event_Name, Event_Date, Event_Location, Event_Description) VALUES
('Health Workshop', '2024-12-01', 'Chennai', 'Workshop on health and wellness.');

 
b) --Updating an event's information

UPDATE Events
SET Event_Date = '2024-08-20'
WHERE Event_Name = 'Tech Conference';

 
c) --Deleting an event

DELETE FROM Events
WHERE Event_Name = 'Tech Expo';
select * from Events;

 

4) Manage Track Attendees & Handle Events

a)--Inserting a new attendee.

INSERT INTO Attendees (Attendee_Name, Attendee_Phone, Attendee_Email, Attendee_City) 
VALUES('Kriti Agrawal', '9997890993', 'kriti@example.com', 'Delhi');

Select* from Attendees;



b)--Registering an attendee for an event

INSERT INTO Registrations (Event_Id, Attendee_Id, Registration_Date, Registration_Amount) VALUES
(1, 4, '2024-08-10', 500.00);
 



5) --Develop queries to retrieve event information, generate attendee lists, and calculate event attendance statistics
a)	--Event info

SELECT * from Events;
 


b)--	Generate attendee list for a specific event

SELECT a.Attendee_Name, a.Attendee_Email
FROM Attendees a
JOIN Registrations r ON a.Attendee_Id = r.Attendee_Id
WHERE r.Event_Id = 1;

 
c)	-- Calculate total registrations for each event

SELECT e.Event_Name, COUNT(r.Registration_Id) AS Total_Registrations
FROM Events e
JOIN Registrations r ON e.Event_Id = r.Event_Id
GROUP BY e.Event_Name;
 


d)--Calculate total revenue for each event 

SELECT e.Event_Name, SUM(r.Registration_Amount) AS Total_Revenue
FROM Events e
JOIN Registrations r ON e.Event_Id = r.Event_Id
GROUP BY e.Event_Name;


 



e)	--Retrieve attendance statistics

SELECT e.Event_Name, COUNT(DISTINCT r.Attendee_Id) AS Total_Attendees
FROM Events e
JOIN Registrations r ON e.Event_Id = r.Event_Id
GROUP BY e.Event_Name;
 


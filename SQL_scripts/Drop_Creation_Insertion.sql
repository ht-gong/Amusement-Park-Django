DROP TABLE TouristBuysTicket;
DROP TABLE Redeems;
DROP TABLE TicketForRide;
DROP TABLE ArcadeHasGift;
DROP TABLE TouristPlaysMachine;
DROP TABLE Cashier_WorksAt;
DROP TABLE Operator_Operates_1;
DROP TABLE Operator_Operates_2;
DROP TABLE Uses;
DROP TABLE Ride_Maintains;
DROP TABLE Technician;

DROP TABLE Gift_1;
DROP TABLE Ticket_1;
DROP TABLE Machine;
DROP TABLE Tourist;
DROP TABLE Ticket_2;
DROP TABLE Arcade;

DROP TABLE Equipment;
DROP TABLE Gift_2;
DROP TABLE Staff;

CREATE TABLE Gift_2 (
    Category CHAR(30) PRIMARY KEY, 
    PointsRequired INTEGER NOT NULL
);

CREATE TABLE Staff (
    WorkID INTEGER PRIMARY KEY, 
    Name CHAR(30) NOT NULL
);

CREATE TABLE Equipment (
    ID INTEGER PRIMARY KEY
);


CREATE TABLE Gift_1 (
    ID INTEGER PRIMARY KEY,
    Category CHAR(30) NOT NULL,
    FOREIGN KEY (Category) REFERENCES Gift_2
);



CREATE TABLE Tourist (
    ID INTEGER PRIMARY KEY, 
    Name CHAR(30) NOT NULL, 
    Age INTEGER, 
    ArcadePoints INTEGER
);

CREATE TABLE Ticket_2 (
    Type CHAR(30) PRIMARY KEY, 
    Price INTEGER NOT NULL
);

CREATE TABLE Ticket_1 (
    TicketNo INTEGER PRIMARY KEY, 
    Type CHAR(30) NOT NULL,
    FOREIGN KEY (Type) REFERENCES Ticket_2
);

CREATE TABLE TouristBuysTicket (
    TID INTEGER, 
    TicketNo INTEGER,
    PRIMARY KEY (TID, TicketNo),
    FOREIGN KEY (TID) REFERENCES Tourist(ID), 
    FOREIGN KEY (TicketNo) REFERENCES Ticket_1
);

CREATE TABLE Redeems (
    GID INTEGER, 
    TID INTEGER,
    PRIMARY KEY (GID, TID), 
    FOREIGN KEY (GID) REFERENCES Gift_1(ID), 
    FOREIGN KEY (TID) REFERENCES Tourist(ID)
);

CREATE TABLE Technician (
    WorkID INTEGER PRIMARY KEY, 
    Qualification CHAR(50),
    FOREIGN KEY (WorkID) REFERENCES Staff(WorkID)
        ON DELETE CASCADE
);

CREATE TABLE Ride_Maintains (
    RName CHAR(30) PRIMARY KEY, 
    PassengerLimit INTEGER NOT NULL, 
    WorkID INTEGER NOT NULL, 
    EID INTEGER NOT NULL, 
    TimeofInspection DATE,
    FOREIGN KEY (WorkID) REFERENCES Technician(WorkID)
        ON DELETE SET NULL,
    FOREIGN KEY (EID) REFERENCES Equipment(ID)
        ON DELETE SET NULL
);




CREATE TABLE TicketForRide (
    TicketNo INTEGER, 
    RideName CHAR(30),
    PRIMARY KEY (TicketNo, RideName),
    FOREIGN KEY (TicketNo) REFERENCES Ticket_1,
    FOREIGN KEY (RideName) REFERENCES Ride_Maintains(RName)
);

CREATE TABLE Arcade (
    Name CHAR(30) PRIMARY KEY, 
    Location CHAR(50),
    UNIQUE (Location)
);

CREATE TABLE ArcadeHasGift (
    AName CHAR(30),
    GID INTEGER,
    PRIMARY KEY (AName, GID),
    FOREIGN KEY (GID) REFERENCES Gift_1(ID),
    FOREIGN KEY (AName) REFERENCES Arcade(Name)
        ON DELETE CASCADE
    
);

CREATE TABLE Machine (
    AName CHAR(30), 
    MName CHAR(30), 
    Type CHAR(30), 
    Highscores INTEGER,
    PRIMARY KEY (AName, MName),
    FOREIGN KEY (AName) REFERENCES Arcade(Name)
        ON DELETE CASCADE
);

CREATE TABLE TouristPlaysMachine (
    TID INTEGER, 
    AName CHAR(30), 
    MName CHAR(30), 
    PointsEarned INTEGER,
    PRIMARY KEY (TID, AName, MName),
    FOREIGN KEY (TID) REFERENCES Tourist(ID),
    FOREIGN KEY (AName, MName) REFERENCES Machine(AName, MName)
        ON DELETE CASCADE
);



CREATE TABLE Cashier_WorksAt (
    WorkID INTEGER PRIMARY KEY, 
    AName CHAR(30),
    FOREIGN KEY (WorkID) REFERENCES Staff
        ON DELETE CASCADE,
    FOREIGN KEY (AName) REFERENCES Arcade
        ON DELETE SET NULL 
);

CREATE TABLE Operator_Operates_2 (
    Qualification CHAR(50) PRIMARY KEY,
    RName CHAR(30),
    FOREIGN KEY (RName) REFERENCES Ride_Maintains(RName)
        ON DELETE SET NULL 
);

CREATE TABLE Operator_Operates_1 (
    WorkID INTEGER PRIMARY KEY, 
    Qualification CHAR(50),
    FOREIGN KEY (WorkID) REFERENCES Staff(WorkID)
        ON DELETE CASCADE, 
    FOREIGN KEY (Qualification) REFERENCES Operator_Operates_2
);

CREATE TABLE Uses (
    WID INTEGER, 
    EID INTEGER,
    PRIMARY KEY (WID, EID),
    FOREIGN KEY (WID) references Technician(WorkID)
        ON DELETE CASCADE,
    FOREIGN KEY (EID) references Equipment(ID)
        ON DELETE CASCADE
);

INSERT INTO Gift_2 (Category, Pointsrequired)
VALUES ('stationery', 100);
INSERT INTO Gift_2 (Category, Pointsrequired)
VALUES ('fashion accessories', 1000);
INSERT INTO Gift_2 (Category, Pointsrequired)
VALUES ('books', 150);
INSERT INTO Gift_2 (Category, Pointsrequired)
VALUES ('middle-size stuffed toys', 400);
INSERT INTO Gift_2 (Category, Pointsrequired)
VALUES ('household electronics', 1000);
INSERT INTO Gift_2 (Category, Pointsrequired)
VALUES ('gaming console', 30000);

INSERT INTO Staff (WorkID, Name)
VALUES (1, 'Bob');
INSERT INTO Staff (WorkID, Name)
VALUES (2, 'Lucy');
INSERT INTO Staff (WorkID, Name)
VALUES (4, 'Lisa');
INSERT INTO Staff (WorkID, Name)
VALUES (17, 'Paul');
INSERT INTO Staff (WorkID, Name)
VALUES (6, 'Susan');
INSERT INTO Staff (WorkID, Name)
VALUES (20, 'Lil Wayne');
INSERT INTO Staff (WorkID, Name)
VALUES (100, 'Maggie');
INSERT INTO Staff (WorkID, Name)
VALUES (101, 'Rosaline');
INSERT INTO Staff (WorkID, Name)
VALUES (102, 'Rachel');
INSERT INTO Staff (WorkID, Name)
VALUES (103, 'Peter');
INSERT INTO Staff (WorkID, Name)
VALUES (104, 'John Snow');
INSERT INTO Staff (WorkID, Name)
VALUES (105, 'Arya Stark');

INSERT INTO Equipment(ID) VALUES (10);
INSERT INTO Equipment(ID) VALUES (11);
INSERT INTO Equipment(ID) VALUES (12);
INSERT INTO Equipment(ID) VALUES (13);
INSERT INTO Equipment(ID) VALUES (14);
INSERT INTO Equipment(ID) VALUES (15);

INSERT INTO Gift_1 (ID, Category)
VALUES (3, 'stationery');
INSERT INTO Gift_1 (ID, Category)
VALUES (5, 'stationery');
INSERT INTO Gift_1 (ID, Category)
VALUES (6, 'gaming console');
INSERT INTO Gift_1 (ID, Category)
VALUES (8, 'household electronics');
INSERT INTO Gift_1 (ID, Category)
VALUES (20, 'middle-size stuffed toys');
INSERT INTO Gift_1 (ID, Category)
VALUES (25, 'books');
INSERT INTO Gift_1 (ID, Category)
VALUES (26, 'books');
INSERT INTO Gift_1 (ID, Category)
VALUES (10, 'gaming console');
INSERT INTO Gift_1 (ID, Category)
VALUES (100, 'fashion accessories');
INSERT INTO Gift_1 (ID, Category)
VALUES (101, 'fashion accessories');
INSERT INTO Gift_1 (ID, Category)
VALUES (102, 'fashion accessories');



INSERT INTO Tourist (ID, Name, Age, ArcadePoints)
VALUES (1111, 'Jack',18,1500);
INSERT INTO Tourist (ID, Name, Age, ArcadePoints)
VALUES (1112, 'Chloe',28,500);
INSERT INTO Tourist (ID, Name, Age, ArcadePoints)
VALUES (1125, 'Poli',38, 400);
INSERT INTO Tourist (ID, Name, Age, ArcadePoints)
VALUES (1141, 'Joshua',40,1000);
INSERT INTO Tourist (ID, Name, Age, ArcadePoints)
VALUES (1, 'Beren', 10, 10500);
INSERT INTO Tourist (ID, Name, Age, ArcadePoints)
VALUES (2, 'Jerry', 80, 10500);
INSERT INTO Tourist (ID, Name, Age, ArcadePoints)
VALUES (3, 'Maxwell', 23, 500);
INSERT INTO Tourist (ID, Name, Age, ArcadePoints)
VALUES (4, 'Jenny', 12, 1000);
INSERT INTO Tourist (ID, Name, Age, ArcadePoints)
VALUES (5, 'Luna', 32, 10600);
INSERT INTO Tourist (ID, Name, Age, ArcadePoints)
VALUES (6, 'Obama', 50, 1000);
INSERT INTO Tourist (ID, Name, Age, ArcadePoints)
VALUES (7, 'Donald Trump', 72, 15000);

INSERT INTO Ticket_2 (Type, Price)
VALUES ('Adolescent', 200);
INSERT INTO Ticket_2 (Type, Price)
VALUES ('Adult', 300);
INSERT INTO Ticket_2 (Type, Price)
VALUES ('Senior', 0);
INSERT INTO Ticket_2 (Type, Price)
VALUES ('Carousel only', 10);
INSERT INTO Ticket_2 (Type, Price)
VALUES ('Roller-coaster only', 15);
INSERT INTO Ticket_2 (Type, Price)
VALUES ('Ferris wheel only', 8);
INSERT into Ticket_2 (Type, Price)
VALUES ('Combo_1', 80);
INSERT into Ticket_2 (Type, Price)
VALUES ('Combo_2', 60);

INSERT INTO Ticket_1 (TicketNo, Type)
VALUES (123, 'Adolescent');
INSERT INTO Ticket_1 (TicketNo, Type)
VALUES (124, 'Adult');
INSERT INTO Ticket_1 (TicketNo, Type)
VALUES (213, 'Senior');
INSERT INTO Ticket_1 (TicketNo, Type)
VALUES (125, 'Combo_1');
INSERT INTO Ticket_1 (TicketNo, Type)
VALUES (126, 'Combo_1');
INSERT INTO Ticket_1 (TicketNo, Type)
VALUES (200, 'Combo_2');
INSERT INTO Ticket_1 (TicketNo, Type)
VALUES (201, 'Combo_2');
INSERT INTO Ticket_1 (TicketNo, Type)
VALUES (202, 'Combo_2');
INSERT INTO Ticket_1 (TicketNo, Type)
VALUES (12, 'Ferris wheel only');
INSERT INTO Ticket_1 (TicketNo, Type)
VALUES (100, 'Combo_1');
INSERT INTO Ticket_1 (TicketNo, Type)
VALUES (13, 'Ferris wheel only');
INSERT INTO Ticket_1 (TicketNo, Type)
VALUES (14, 'Ferris wheel only');



INSERT INTO TouristBuysTicket (TID, TicketNo)
VALUES (1111,123);
INSERT INTO TouristBuysTicket (TID, TicketNo)
VALUES (1112,124);
INSERT INTO TouristBuysTicket (TID, TicketNo)
VALUES (1125, 125);
INSERT INTO TouristBuysTicket (TID, TicketNo)
VALUES (1141, 12);
INSERT INTO TouristBuysTicket (TID, TicketNo)
VALUES (1, 200);
INSERT INTO TouristBuysTicket (TID, TicketNo)
VALUES (2, 213);
INSERT INTO TouristBuysTicket (TID, TicketNo)
VALUES (3, 124);
INSERT INTO TouristBuysTicket (TID, TicketNo)
VALUES (4, 100);
INSERT INTO TouristBuysTicket (TID, TicketNo)
VALUES (5, 124);
INSERT INTO TouristBuysTicket (TID, TicketNo)
VALUES (6, 201);
INSERT INTO TouristBuysTicket (TID, TicketNo)
VALUES (7, 213);


INSERT INTO Redeems (GID, TID)
VALUES (3, 1111);
INSERT INTO Redeems (GID, TID)
VALUES (5, 1112);
INSERT INTO Redeems (GID, TID)
VALUES (6, 1125);
INSERT INTO Redeems (GID, TID)
VALUES (8, 1141);
INSERT INTO Redeems (GID, TID)
VALUES (20, 1);
INSERT INTO Redeems (GID, TID)
VALUES (25, 2);


INSERT INTO Technician (WorkID, Qualification)
VALUES (100, 'Qualified to maintain the Flume ride');
INSERT INTO Technician (WorkID, Qualification)
VALUES (101, 'Qualified to maintain the Ferris wheel');
INSERT INTO Technician (WorkID, Qualification)
VALUES (102, 'Qualified to maintain the Roller-coaster');
INSERT INTO Technician (WorkID, Qualification)
VALUES (103, 'Qualified to maintain the Carousel');
INSERT INTO Technician (WorkID, Qualification)
VALUES (104, 'Qualified to maintain the Haunted Mansion');
INSERT INTO Technician (WorkID, Qualification)
VALUES (105, 'Qualified to maintain the Jungle cruise');

INSERT INTO Ride_Maintains(RName, PassengerLimit, WorkID, EID, TimeofInspection)
VALUES ('Roller-coaster', 40, 102, 11, date('2019-01-01'));
INSERT INTO Ride_Maintains(RName, PassengerLimit, WorkID, EID, TimeofInspection)
VALUES ('Carousel', 40, 103, 12, date('2019-01-01'));
INSERT INTO Ride_Maintains(RName, PassengerLimit, WorkID, EID, TimeofInspection)
VALUES ('Flume ride', 50, 100, 10, date('2019-01-01'));
INSERT INTO Ride_Maintains(RName, PassengerLimit, WorkID, EID, TimeofInspection)
VALUES ('Ferris wheel', 50, 101, 10, date('2019-10-01'));
INSERT INTO Ride_Maintains(RName, PassengerLimit, WorkID, EID, TimeofInspection)
VALUES ('Haunted Mansion', 15, 104, 13, date('2019-01-01'));
INSERT INTO Ride_Maintains(RName, PassengerLimit, WorkID, EID, TimeofInspection)
VALUES ('Jungle cruise', 15, 105, 13, date('2019-09-21'));

INSERT INTO TicketForRide (TicketNo, RideName)
VALUES (125, 'Carousel');
INSERT INTO TicketForRide (TicketNo, RideName)
VALUES (125, 'Ferris wheel');
INSERT INTO TicketForRide (TicketNo, RideName)
VALUES (12, 'Ferris wheel');
INSERT INTO TicketForRide (TicketNo, RideName)
VALUES (126, 'Carousel');
INSERT INTO TicketForRide (TicketNo, RideName)
VALUES (126, 'Ferris wheel');
INSERT INTO TicketForRide (TicketNo, RideName)
VALUES (200, 'Roller-coaster');
INSERT INTO TicketForRide (TicketNo, RideName)
VALUES (200, 'Jungle cruise');
INSERT INTO TicketForRide (TicketNo, RideName)
VALUES (200, 'Haunted Mansion');
INSERT INTO TicketForRide (TicketNo, RideName)
VALUES (201, 'Roller-coaster');
INSERT INTO TicketForRide (TicketNo, RideName)
VALUES (201, 'Jungle cruise');
INSERT INTO TicketForRide (TicketNo, RideName)
VALUES (201, 'Haunted Mansion');
INSERT INTO TicketForRide (TicketNo, RideName)
VALUES (202, 'Roller-coaster');
INSERT INTO TicketForRide (TicketNo, RideName)
VALUES (202, 'Jungle cruise');
INSERT INTO TicketForRide (TicketNo, RideName)
VALUES (202, 'Haunted Mansion');
INSERT INTO TicketForRide (TicketNo, RideName)
VALUES (123, 'Haunted Mansion');
INSERT INTO TicketForRide (TicketNo, RideName)
VALUES (123, 'Roller-coaster');
INSERT INTO TicketForRide (TicketNo, RideName)
VALUES (123, 'Jungle cruise');
INSERT INTO TicketForRide (TicketNo, RideName)
VALUES (123, 'Ferris wheel');
INSERT INTO TicketForRide (TicketNo, RideName)
VALUES (123, 'Flume ride');
INSERT INTO TicketForRide (TicketNo, RideName)
VALUES (124, 'Haunted Mansion');
INSERT INTO TicketForRide (TicketNo, RideName)
VALUES (124, 'Roller-coaster');
INSERT INTO TicketForRide (TicketNo, RideName)
VALUES (124, 'Jungle cruise');
INSERT INTO TicketForRide (TicketNo, RideName)
VALUES (124, 'Ferris wheel');
INSERT INTO TicketForRide (TicketNo, RideName)
VALUES (124, 'Flume ride');

INSERT INTO Arcade (Name, Location)
VALUES ('Sunshine', '2205 Lower Mall');
INSERT INTO Arcade (Name, Location)
VALUES ('Enjoy', '2366 Main Mall');
INSERT INTO Arcade (Name, Location)
VALUES ('FunTime', '2011 Agronomy Road');
INSERT INTO Arcade (Name, Location)
VALUES ('Max!!', '2014 Main Mall');
INSERT INTO Arcade (Name, Location)
VALUES ('Come to play', '3134 East Avenue');
INSERT INTO Arcade (Name, Location)
VALUES ('Saga', '1023 ChuHeHanJie');

INSERT INTO ArcadeHasGift (AName, GID)
VALUES ('Sunshine', 3);
INSERT INTO ArcadeHasGift (AName, GID)
VALUES ('Enjoy', 5);
INSERT INTO ArcadeHasGift (AName, GID)
VALUES ('FunTime', 6);
INSERT INTO ArcadeHasGift (AName, GID)
VALUES ('Max!!', 8);
INSERT INTO ArcadeHasGift (AName, GID)
VALUES ('Come to play', 20);
INSERT INTO ArcadeHasGift (AName, GID)
VALUES ('Saga', 25);

INSERT INTO Machine (AName, MName, Type, Highscores)
VALUES ('Saga', 'CarRace', 'Racing game', 330);
INSERT INTO Machine (AName, MName, Type, Highscores)
VALUES ('Saga', 'MotorRace', 'Racing game', 330);
INSERT INTO Machine (AName, MName, Type, Highscores)
VALUES ('Saga', 'CraneMachine', 'Doll machine', 330);
INSERT INTO Machine (AName, MName, Type, Highscores)
VALUES ('Max!!', 'CarRace', 'Racing game', 330);
INSERT INTO Machine (AName, MName, Type, Highscores)
VALUES ('Come to play', 'Hoop', 'Basketball shooting game', 320);
INSERT INTO Machine (AName, MName, Type, Highscores)
VALUES ('FunTime', 'Resident Evil', 'First personal shooting game', 1000);

INSERT INTO TouristPlaysMachine (TID, AName, MName, PointsEarned)
VALUES (1111, 'Saga', 'CarRace', 14);
INSERT INTO TouristPlaysMachine (TID, AName, MName, PointsEarned)
VALUES (1111, 'Max!!', 'CarRace', 15);
INSERT INTO TouristPlaysMachine (TID, AName, MName, PointsEarned)
VALUES (1112, 'Saga', 'CraneMachine',10);
INSERT INTO TouristPlaysMachine (TID, AName, MName, PointsEarned)
VALUES (2, 'Saga', 'CarRace', 20);
INSERT INTO TouristPlaysMachine (TID, AName, MName, PointsEarned)
VALUES (1125, 'Come to play', 'Hoop', 10);
INSERT INTO TouristPlaysMachine (TID, AName, MName, PointsEarned)
VALUES (1141, 'FunTime', 'Resident Evil', 8);
INSERT INTO TouristPlaysMachine (TID, AName, MName, PointsEarned)
VALUES (1111, 'Come to play', 'Hoop', 8);
INSERT INTO TouristPlaysMachine (TID, AName, MName, PointsEarned)
VALUES (1111, 'Saga', 'MotorRace', 10);
INSERT INTO TouristPlaysMachine (TID, AName, MName, PointsEarned)
VALUES (1111, 'Saga', 'CraneMachine', 13);
INSERT INTO TouristPlaysMachine (TID, AName, MName, PointsEarned)
VALUES (1111, 'FunTime', 'Resident Evil', 20);
INSERT INTO TouristPlaysMachine (TID, AName, MName, PointsEarned)
VALUES (1112, 'Max!!', 'CarRace',15);
INSERT INTO TouristPlaysMachine (TID, AName, MName, PointsEarned)
VALUES (1112, 'Saga', 'MotorRace',10);
INSERT INTO TouristPlaysMachine (TID, AName, MName, PointsEarned)
VALUES (1112, 'Come to play', 'Hoop',30);
INSERT INTO TouristPlaysMachine (TID, AName, MName, PointsEarned)
VALUES (1112, 'FunTime', 'Resident Evil',15);
INSERT INTO TouristPlaysMachine (TID, AName, MName, PointsEarned)
VALUES (1112, 'Saga', 'CarRace',10);

INSERT INTO Cashier_WorksAt(WorkID, AName)
VALUES (1, 'Saga');
INSERT INTO Cashier_WorksAt(WorkID, AName)
VALUES (2, 'Saga');
INSERT INTO Cashier_WorksAt(WorkID, AName)
VALUES (4, 'Come to play');
INSERT INTO Cashier_WorksAt(WorkID, AName)
VALUES (17, 'Max!!');
INSERT INTO Cashier_WorksAt(WorkID, AName)
VALUES (6, 'FunTime');
INSERT INTO Cashier_WorksAt(WorkID, AName)
VALUES (20, 'Saga');

INSERT INTO Operator_Operates_2 (Qualification, RName)
VALUES ('Qualified to operate the Carousel', 'Carousel');
INSERT INTO Operator_Operates_2 (Qualification, RName)
VALUES ('Qualified to operate the Flume ride', 'Flume ride');
INSERT INTO Operator_Operates_2 (Qualification, RName)
VALUES ('Qualified to operate the Roller-coaster', 'Roller-coaster');
INSERT INTO Operator_Operates_2 (Qualification, RName)
VALUES ('Qualified to operate the Jungle cruise', 'Jungle cruise');
INSERT INTO Operator_Operates_2 (Qualification, RName)
VALUES ('Qualified to operate the Haunted Mansion', 'Haunted Mansion');
INSERT INTO Operator_Operates_2 (Qualification, RName)
VALUES ('Qualified to operate the Ferris wheel', 'Ferris wheel');


INSERT INTO Operator_Operates_1(WorkID, Qualification)
VALUES (1, 'Qualified to operate the Carousel');
INSERT INTO Operator_Operates_1(WorkID, Qualification)
VALUES (2, 'Qualified to operate the Carousel');
INSERT INTO Operator_Operates_1(WorkID, Qualification)
VALUES (4, 'Qualified to operate the Ferris wheel');
INSERT INTO Operator_Operates_1(WorkID, Qualification)
VALUES (17, 'Qualified to operate the Roller-coaster');
INSERT INTO Operator_Operates_1(WorkID, Qualification)
VALUES (6, 'Qualified to operate the Jungle cruise');
INSERT INTO Operator_Operates_1(WorkID, Qualification)
VALUES (20, 'Qualified to operate the Flume ride');







INSERT INTO Uses (WID, EID) VALUES (100, 10);
INSERT INTO Uses (WID, EID) VALUES (101, 10);
INSERT INTO Uses (WID, EID) VALUES (102, 11);
INSERT INTO Uses (WID, EID) VALUES (103, 12);
INSERT INTO Uses (WID, EID) VALUES (104, 13);
INSERT INTO Uses (WID, EID) VALUES (105, 14);
INSERT INTO Uses (WID, EID) VALUES (100, 11);
INSERT INTO Uses (WID, EID) VALUES (100, 12);
INSERT INTO Uses (WID, EID) VALUES (100, 13);
INSERT INTO Uses (WID, EID) VALUES (100, 14);
INSERT INTO Uses (WID, EID) VALUES (100, 15);





CREATE TABLE RoomsClasses (Class VARCHAR(20) NOT NULL PRIMARY KEY,
Price NUMERIC(6) NOT NULL)engine = InnoDB;

CREATE TABLE Rooms (Id NUMERIC(4) NOT NULL PRIMARY KEY, 
Class VARCHAR(20) NOT NULL REFERENCES RoomsClasses (Class), 
QuantityOfPeople NUMERIC(1) NOT NULL)engine = InnoDB;

CREATE TABLE Services (ServiceName VARCHAR(20) NOT NULL PRIMARY KEY, 
ServiceDescription VARCHAR(30) NOT NULL, 
ServicePrice NUMERIC(6) NOT NULL)engine = InnoDB;

CREATE TABLE Guests (Passport CHAR(10) NOT NULL, 
ArrivalDate DATE NOT NULL, 
RoomNumber NUMERIC(3) NOT NULL,
FullName VARCHAR(40) NOT NULL,
Sex CHAR(1) DEFAULT 'М' CHECK (Sex = 'М' OR Sex = 'Ж'),
Organisation VARCHAR(40),
DepartureDate DATE,
GuestStatus NUMERIC(1) CHECK(GuestStatus = 0 OR GuestStatus = 1 OR GuestStatus = 2),
FOREIGN KEY (RoomNumber) REFERENCES Rooms (Id),
PRIMARY KEY(Passport, ArrivalDate))engine = InnoDB;

CREATE TABLE ProvidedServices (GuestPassport CHAR(10) NOT NULL REFERENCES Guests (Passport), 
Service VARCHAR(20) NOT NULL REFERENCES Services (ServiceName),
Quantity NUMERIC(2) NOT NULL,
Price NUMERIC(6) NOT NULL,
DateOfService DATE)engine = InnoDB;
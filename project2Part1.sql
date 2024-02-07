--Anna Kessler
--SQL Fall Online 2022
--Project #2

--DROP TABLE statements
drop table if exists ARK_Artifact_Location;
drop table if exists ARK_Employee_Phone;
drop table if exists ARK_Location;
drop table if exists ARK_Room;
drop table if exists ARK_Employee_Appraisals;
drop table if exists ARK_Artifact;
drop table if exists ARK_Location_Type;
drop table if exists ARK_Employee;
drop table if exists ARK_Employee_Title;
drop table if exists ARK_PhoneNumbers;

--CREATE TABLE statements
-- Table: ARK_Room
create table ARK_Room (
    RoomID serial primary key
    , RoomNameNumber varchar(100) NOT NULL
);

-- Table: ARK_Location_Type
create table ARK_Location_Type (
    LocationTypeID serial primary key
    , LocationTypeName varchar(255) NOT NULL
);

-- Table: ARK_Employee_Title
create table ARK_Employee_Title (
    EmployeeTitleID serial primary key
    , EmployeeTitleDescription varchar(255) NOT NULL
);

--Table: ARK_Artifact
create table ARK_Artifact (
    ArtifactID serial primary key
    , ArtifactDescription varchar(255) NOT NULL
    , ArtifactDateAquired date NOT NULL
    , ArtifactValue float8 NOT NULL
    , DateLost date NULL
);

--Table: ARK_Employee
create table ARK_Employee (
    EmployeeID serial primary key
    , EmployeeLastName varchar(100) NOT NULL
    , EmployeeFirstName varchar(100) NOT NULL
    , EmployeeSalary float8 NOT NULL
    , EmployeeTitleID int REFERENCES ARK_Employee_Title (EmployeeTitleID)
);

-- Table: ARK_Location
create table ARK_Location (
    LocationID serial primary key
    , RoomID int NOT NULL REFERENCES ARK_Room (RoomID)
    , LocationDescription varchar(255) NULL
    , LocationTypeID int REFERENCES ARK_Location_Type (LocationTypeID)
);

-- Table: ARK_PhoneNumbers
create table ARK_PhoneNumbers (
    PhoneNumberID serial primary key
    , PhoneNumber char(12) NOT NULL
);

-- Table: ARK_Employee_Appraisals
create table ARK_Employee_Appraisals (
    AppraisalDate date NOT NULL
    , EmployeeApprasialValue float8 NOT NULL
    , ArtifactID int REFERENCES ARK_Artifact (ArtifactID)
    , EmployeeID int REFERENCES ARK_Employee (EmployeeID)
    , primary key (EmployeeID, ArtifactID)
);

--Table: ARK_Aftifact_Location
create table ARK_Artifact_Location (
    DatePlaced date NOT NULL
    , ArtifactID int REFERENCES ARK_Artifact (ArtifactID)
    , LocationID int REFERENCES ARK_Location (LocationID)
    , primary key (ArtifactID, LocationID, DatePlaced)
);

-- Table: ARK_Employee_Phone
create table ARK_Employee_Phone (
    EmployeeID int REFERENCES ARK_Employee (EmployeeID)
    , PhoneNumberID int REFERENCES ARK_PhoneNumbers (PhoneNumberID)
    , primary key (EmployeeID, PhoneNumberID)
);





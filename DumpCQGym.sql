CREATE DATABASE IF NOT EXISTS CQGym;
USE CQGym;

-- Create the Member table if it doesn't exist
CREATE TABLE IF NOT EXISTS Member (
  MemberID INT PRIMARY KEY,
  FirstName VARCHAR(50) NOT NULL,
  LastName VARCHAR(50) NOT NULL,
  DateOfBirth DATE NOT NULL,
  Gender CHAR(1) NOT NULL,
  ContactNumber VARCHAR(20) NOT NULL,
  Email VARCHAR(100) NOT NULL,
  JoinDate DATE NOT NULL
);

-- Create the Employee table if it doesn't exist
CREATE TABLE IF NOT EXISTS Employee (
  EmployeeID INT PRIMARY KEY,
  FirstName VARCHAR(50) NOT NULL,
  LastName VARCHAR(50) NOT NULL,
  EmployeeType CHAR(1) NOT NULL CHECK (EmployeeType IN ('S', 'T')),
  HireDate DATE NOT NULL,
  ContactNumber VARCHAR(20) NOT NULL,
  Email VARCHAR(100) NOT NULL,
  MemberID INT,
  FOREIGN KEY (MemberID) REFERENCES Member(MemberID)
);

-- Create the Location table if it doesn't exist
CREATE TABLE IF NOT EXISTS Location (
  LocationID INT PRIMARY KEY,
  Address VARCHAR(200) NOT NULL,
  City VARCHAR(50) NOT NULL,
  State VARCHAR(50) NOT NULL,
  ZipCode VARCHAR(10) NOT NULL,
  ContactNumber VARCHAR(20) NOT NULL
);

-- Create the Program table if it doesn't exist
CREATE TABLE IF NOT EXISTS Program (
  ProgramID INT PRIMARY KEY,
  ProgramName VARCHAR(100) NOT NULL,
  Description TEXT,
  Duration INT NOT NULL,
  LocationID INT NOT NULL,
  FOREIGN KEY (LocationID) REFERENCES Location(LocationID)
);

-- Create the MemberProgram table if it doesn't exist
CREATE TABLE IF NOT EXISTS MemberProgram (
  MemberID INT NOT NULL,
  ProgramID INT NOT NULL,
  EnrollDate DATE NOT NULL,
  PRIMARY KEY (MemberID, ProgramID),
  FOREIGN KEY (MemberID) REFERENCES Member(MemberID),
  FOREIGN KEY (ProgramID) REFERENCES Program(ProgramID)
);

-- Create the Payment table if it doesn't exist
CREATE TABLE IF NOT EXISTS Payment (
  PaymentID INT PRIMARY KEY,
  MemberID INT NOT NULL,
  Amount DECIMAL(10,2) NOT NULL,
  ModeOfPayment VARCHAR(50) NOT NULL,
  PaymentDate DATE NOT NULL,
  FOREIGN KEY (MemberID) REFERENCES Member(MemberID)
);

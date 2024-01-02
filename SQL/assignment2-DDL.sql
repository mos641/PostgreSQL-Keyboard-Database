-- FileName: Assignment2-DDL.sql
-- Description: script to create the Inventory II database as required in Assignment 1, create the tables from the inventory database and the country-city database
-- CST 8215

--dropping the views if they exist to allow tables to be dropped
DROP VIEW IF EXISTS Order_V;
DROP VIEW IF EXISTS Threepins_V;
--dropping the tables if they exist, allows this script to be run multiple times without errors
DROP TABLE IF EXISTS Invoice_Line_T;
DROP TABLE IF EXISTS Invoice_T;
DROP TABLE IF EXISTS Customer_T;
DROP TABLE IF EXISTS Keycaps_T;
DROP TABLE IF EXISTS Switches_T;
DROP TABLE IF EXISTS Pcb_T;
DROP TABLE IF EXISTS Case_T;
DROP TABLE IF EXISTS Layout_T;

--creating the Layout Table
CREATE TABLE Layout_T(
  Layout     		VARCHAR( 30 ),
  Switches	        INTEGER NOT NULL,
  CONSTRAINT PK_Layout PRIMARY KEY( Layout )
);

--creating the Case Table
CREATE TABLE Case_T (
  Case_Id		CHAR(6),
  Case_Layout		VARCHAR( 30 ) NOT NULL,
  Case_Material 	VARCHAR( 30 ),
  Case_Cost 		DECIMAL(5, 2),
  Case_Quantity	        INTEGER,
  CONSTRAINT PK_Case_Id PRIMARY KEY( Case_Id ),
  CONSTRAINT FK_Case_Layout FOREIGN KEY( Case_Layout ) REFERENCES Layout_T( Layout )
);

--creating the PCB Table
CREATE TABLE Pcb_T (
  Pcb_Id		CHAR(6),
  Pcb_Layout		VARCHAR( 30 ) NOT NULL,
  Led		 	BOOLEAN,
  Hotswap	        BOOLEAN,
  Pcb_Pins		INTEGER NOT NULL,
  Pcb_Cost 		DECIMAL(5, 2),
  Pcb_Quantity		INTEGER,
  CONSTRAINT PK_Pcb_Id PRIMARY KEY( Pcb_Id ),
  CONSTRAINT FK_Case_Layout FOREIGN KEY( Pcb_Layout ) REFERENCES Layout_T( Layout )
);

--creating the Switches Table
CREATE TABLE Switches_T(
  Switches_Id		CHAR(6),
  Switches_Name		VARCHAR( 30 ),
  Type		 	VARCHAR( 10 ) NOT NULL,
  Switches_Pins		INTEGER NOT NULL,
  Switches_Cost 	DECIMAL(5, 2),
  Switches_Quantity	INTEGER ,
  CONSTRAINT PK_Switches_ID PRIMARY KEY( Switches_Id )
);

--creating the Keycaps Table
CREATE TABLE Keys_T(
  Keys_Id		CHAR(6),
  Keys_Layout		VARCHAR( 30 ) NOT NULL,
  Keys_Name 	 	VARCHAR( 30 ) NOT NULL,
  Keys_Material 	VARCHAR( 30 ),
  Keys_Cost 		DECIMAL(5, 2),
  Keys_Quantity	        INTEGER,
  CONSTRAINT PK_Keys_ID PRIMARY KEY( Keys_Id ),
  CONSTRAINT FK_Case_Layout FOREIGN KEY( Keys_Layout ) REFERENCES Layout_T( Layout )
);

--creating the Customer Table
CREATE TABLE Customer_T (
  Cust_Id         CHAR( 6 ),
  Cust_Fname      VARCHAR( 30 ) NOT NULL,
  Cust_Lname      VARCHAR( 30 ) NOT NULL,
  Cust_Email      VARCHAR( 30 ) NOT NULL,
  Cust_Address    VARCHAR( 20 ) NOT NULL,
  Cust_PostCode   CHAR( 6 ) NOT NULL,
  CONSTRAINT PK_Customer PRIMARY KEY( Cust_Id )
);

--creating the Invoice Table
CREATE TABLE Invoice_T (
  Invoice_Number     CHAR( 6 ),
  Cust_Id            CHAR( 6 ) NOT NULL,
  Invoice_Date       DATE DEFAULT NOW(),
  CONSTRAINT PK_Invoice PRIMARY KEY( Invoice_Number ),
  CONSTRAINT FK_Cust_ID FOREIGN KEY( Cust_Id ) REFERENCES Customer_T( Cust_ID )
);

--creating the Invoice Line Table
CREATE TABLE Invoice_Line_T (
  Invoice_Number       CHAR( 6 ),
  Invoice_Line         INTEGER,
  Case_Id	       CHAR( 6 ),
  Pcb_Id	       CHAR( 6 ),
  Switches_Id	       CHAR( 6 ),
  Keys_Id	       CHAR( 6 ),
  Hours		       INTEGER,
  CONSTRAINT PK_Invoice_Line  PRIMARY KEY( Invoice_Number, Invoice_Line ),
  CONSTRAINT FK1_Invoice_Number FOREIGN KEY( Invoice_Number ) REFERENCES Invoice_T( Invoice_Number ),
  CONSTRAINT FK2_Case FOREIGN KEY( Case_Id ) REFERENCES Case_T( Case_Id ),
  CONSTRAINT FK3_Pcb FOREIGN KEY( Pcb_Id ) REFERENCES Pcb_T( Pcb_Id ),
  CONSTRAINT FK4_Switches FOREIGN KEY( Switches_Id ) REFERENCES Switches_T( Switches_Id ),
  CONSTRAINT FK5_Keys FOREIGN KEY( Keys_Id ) REFERENCES Keys_T( Keys_Id )
);

--creating two views
CREATE VIEW ORDER_V
AS
SELECT * FROM Invoice_T NATURAL JOIN Invoice_Line_T
WHERE Invoice_T.Invoice_Number = Invoice_Line_T.Invoice_Number;

CREATE VIEW Threepins_V 
AS
SELECT * FROM Pcb_T NATURAL JOIN Switches_T
WHERE Pcb_T.Pcb_Pins = Switches_T.Switches_Pins;

-- eof Assignment2-DDL.sql
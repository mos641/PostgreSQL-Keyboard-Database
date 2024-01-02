-- FileName: Assignment2-DML.sql
-- Description: script to populate the tables created from the DDL file
-- CST 8215

--emptying the tables to allow this script to be run multiple times without duplicate values
DELETE FROM Invoice_Line_T;
DELETE FROM Invoice_T;
DELETE FROM Customer_T;
DELETE FROM Keys_T;
DELETE FROM Switches_T;
DELETE FROM Pcb_T;
DELETE FROM Case_T;
DELETE FROM Layout_T;

--populate the Layout Table
INSERT INTO Layout_T( Layout, Switches )
VALUES( 'STANDARD 75', 75);
INSERT INTO Layout_T( Layout, Switches )
VALUES( 'STANDARD 100', 100);
INSERT INTO Layout_T( Layout, Switches )
VALUES( 'COMPACT 60', 60);
INSERT INTO Layout_T( Layout, Switches )
VALUES( 'ORTHOLINEAR', 50);
INSERT INTO Layout_T( Layout, Switches )
VALUES( 'SPLIT 80', 80);

--populate the Case Table
INSERT INTO Case_T( Case_Id, Case_Layout, Case_Material, Case_Cost, Case_Quantity )
VALUES( 'C0001A', 'STANDARD 75', 'ACRYLIC', 150.00, 11 );
INSERT INTO Case_T( Case_Id, Case_Layout, Case_Material, Case_Cost, Case_Quantity )
VALUES( 'C0002A', 'STANDARD 100', 'ALUMINUM', 170.00, 7 );
INSERT INTO Case_T( Case_Id, Case_Layout, Case_Material, Case_Cost, Case_Quantity )
VALUES( 'C0003A', 'ORTHOLINEAR', 'ACRYLIC', 120.00, 20 );
INSERT INTO Case_T( Case_Id, Case_Layout, Case_Material, Case_Cost, Case_Quantity )
VALUES( 'C0004A', 'COMPACT 60', 'COPPER', 140.00, 15 );
INSERT INTO Case_T( Case_Id, Case_Layout, Case_Material, Case_Cost, Case_Quantity )
VALUES( 'C0005A', 'SPLIT 80', 'STEEL', 130.00, 12 );

--populate the Pcb Table
INSERT INTO Pcb_T( Pcb_Id, Pcb_Layout, Led, Hotswap, Pcb_Pins, Pcb_Cost, Pcb_Quantity )
VALUES( 'P0001A', 'STANDARD 75', '0', '1', 5, 121.99, 20 );
INSERT INTO Pcb_T( Pcb_Id, Pcb_Layout, Led, Hotswap, Pcb_Pins, Pcb_Cost, Pcb_Quantity )
VALUES( 'P0002A', 'STANDARD 100', '1', '1', 3, 130.99, 20 );
INSERT INTO Pcb_T( Pcb_Id, Pcb_Layout, Led, Hotswap, Pcb_Pins, Pcb_Cost, Pcb_Quantity )
VALUES( 'P0003A', 'STANDARD 75', '0', '1', 5, 111.99, 11 );
INSERT INTO Pcb_T( Pcb_Id, Pcb_Layout, Led, Hotswap, Pcb_Pins, Pcb_Cost, Pcb_Quantity )
VALUES( 'P0004A', 'ORTHOLINEAR', '1', '0', 3, 144.00, 23 );
INSERT INTO Pcb_T( Pcb_Id, Pcb_Layout, Led, Hotswap, Pcb_Pins, Pcb_Cost, Pcb_Quantity )
VALUES( 'P0005A', 'STANDARD 75', '0', '0', 5, 76.99, 17 );

--populate the Switches Table
INSERT INTO Switches_T( Switches_Id, Switches_Name, Type, Switches_Pins, Switches_Cost, Switches_Quantity )
VALUES( 'S0001A', 'ZEALIOS V2', 'TACTILE', 5, 0.75, 400 );
INSERT INTO Switches_T( Switches_Id, Switches_Name, Type, Switches_Pins, Switches_Cost, Switches_Quantity )
VALUES( 'S0002A', 'TEALIOS V1', 'LINEAR', 5, 0.60, 300 );
INSERT INTO Switches_T( Switches_Id, Switches_Name, Type, Switches_Pins, Switches_Cost, Switches_Quantity )
VALUES( 'S0003A', 'CHERRY MX BLUE', 'CLICKY', 3, 0.45, 400 );
INSERT INTO Switches_T( Switches_Id, Switches_Name, Type, Switches_Pins, Switches_Cost, Switches_Quantity )
VALUES( 'S0004A', 'HOLY PANDA', 'TACTILE', 3, 0.80, 240 );
INSERT INTO Switches_T( Switches_Id, Switches_Name, Type, Switches_Pins, Switches_Cost, Switches_Quantity )
VALUES( 'S0005A', 'OUTEMU SKY', 'TACTILE', 5, 0.55, 300 );

--populate the Keys Table
INSERT INTO Keys_T( Keys_Id, Keys_Layout, Keys_Name, Keys_Material, Keys_Cost, Keys_Quantity)
VALUES( 'K0001A', 'STANDARD 100', 'BLACK ON WHITE', 'ABS', 121.99, 36 );
INSERT INTO Keys_T( Keys_Id, Keys_Layout, Keys_Name, Keys_Material, Keys_Cost, Keys_Quantity)
VALUES( 'K0002A', 'STANDARD 75', 'BLACK ON WHITE', 'PBT', 110.00, 40 );
INSERT INTO Keys_T( Keys_Id, Keys_Layout, Keys_Name, Keys_Material, Keys_Cost, Keys_Quantity)
VALUES( 'K0003A', 'STANDARD 100', 'WHITE ON BLUE', 'PBT', 90.00, 60 );
INSERT INTO Keys_T( Keys_Id, Keys_Layout, Keys_Name, Keys_Material, Keys_Cost, Keys_Quantity)
VALUES( 'K0004A', 'STANDARD 100', 'GREYSCAPE', 'ABS', 110.00, 30 );
INSERT INTO Keys_T( Keys_Id, Keys_Layout, Keys_Name, Keys_Material, Keys_Cost, Keys_Quantity)
VALUES( 'K0005A', 'STANDARD 100', 'NOIR', 'PBT', 160.00, 50 );


--populate the Customer Table
INSERT INTO Customer_T( Cust_Id, Cust_Fname, Cust_Lname, Cust_Email, Cust_Address, Cust_PostCode)
VALUES( 'C00001', 'Michael', 'Scott', 'mscott@gmail.com', '1385 Woodroffe Ave', 'K2G1V8');
INSERT INTO Customer_T( Cust_Id, Cust_Fname, Cust_Lname, Cust_Email, Cust_Address, Cust_PostCode)
VALUES( 'C00002', 'Jim', 'Halpert', 'jhalpert@gmail.com', '1400 Main Ave', 'K2G1V4');
INSERT INTO Customer_T( Cust_Id, Cust_Fname, Cust_Lname, Cust_Email, Cust_Address, Cust_PostCode)
VALUES( 'C00003', 'Kelly', 'Kapoor', 'kkapoor@gmail.com', '1764 Crescent Ave', 'K3G2G4');
INSERT INTO Customer_T( Cust_Id, Cust_Fname, Cust_Lname, Cust_Email, Cust_Address, Cust_PostCode)
VALUES( 'C00004', 'Pamela', 'Beesly', 'pbeesly@gmail.com', '2345 Linder Ave', 'K5G3F5');
INSERT INTO Customer_T( Cust_Id, Cust_Fname, Cust_Lname, Cust_Email, Cust_Address, Cust_PostCode)
VALUES( 'C00005', 'dwight', 'schrute', 'beets4life@gmail.com', '436 Berg Ave', 'K2G2B6');


--populate the Inovice Table
INSERT INTO Invoice_T( Invoice_Number, Cust_Id, Invoice_Date )
VALUES( 'I00001', 'C00001', '2015-02-15' );
INSERT INTO Invoice_T( Invoice_Number, Cust_Id, Invoice_Date )
VALUES( 'I00002', 'C00002', '2016-04-25' );
INSERT INTO Invoice_T( Invoice_Number, Cust_Id, Invoice_Date )
VALUES( 'I00003', 'C00003', '2017-06-12' );
INSERT INTO Invoice_T( Invoice_Number, Cust_Id, Invoice_Date )
VALUES( 'I00004', 'C00004', '2018-07-08' );
INSERT INTO Invoice_T( Invoice_Number, Cust_Id, Invoice_Date )
VALUES( 'I00005', 'C00005', '2019-08-24' );


--populate the Invoice Line Table
INSERT INTO Invoice_Line_T( Invoice_Number, Invoice_Line, Case_Id, Pcb_Id, Switches_Id, Keys_Id, Hours )
VALUES( 'I00001', 1, 'C0001A', 'P0001A', 'S0003A', 'K0002A', 1 );
INSERT INTO Invoice_Line_T( Invoice_Number, Invoice_Line, Case_Id, Pcb_Id, Switches_Id, Keys_Id, Hours )
VALUES( 'I00002', 1, 'C0002A', 'P0002A', 'S0001A', 'K0001A', 2 );
INSERT INTO Invoice_Line_T( Invoice_Number, Invoice_Line, Case_Id, Pcb_Id, Switches_Id, Keys_Id, Hours )
VALUES( 'I00003', 1, 'C0003A', 'P0001A', 'S0005A', 'K0004A', 1 );
INSERT INTO Invoice_Line_T( Invoice_Number, Invoice_Line, Case_Id, Pcb_Id, Switches_Id, Keys_Id, Hours )
VALUES( 'I00004', 1, 'C0004A', 'P0005A', 'S0001A', 'K0003A', 1 );
INSERT INTO Invoice_Line_T( Invoice_Number, Invoice_Line, Case_Id, Pcb_Id, Switches_Id, Keys_Id, Hours )
VALUES( 'I00005', 1, 'C0005A', 'P0003A', 'S0002A', 'K0005A', 1 );

--SELECT with WHERE statments
SELECT * FROM Pcb_T
WHERE Pcb_Pins = 5;

SELECT * FROM Switches_T
WHERE Switches_Pins = 5;

SELECT * FROM Keys_T
WHERE Keys_Layout = 'STANDARD 100';


--Two joins statements with sub queries
--Quickly see a customers built keyboards
SELECT Invoice_T.Invoice_Number, Cust_Id, Case_id, Pcb_Id, Switches_Id, Keys_Id FROM Invoice_T LEFT JOIN Invoice_Line_T
ON Invoice_T.Invoice_Number = Invoice_Line_T.Invoice_Number;
--Determine which switch options are available for PCBs with only 3 pins slots
SELECT Pcb_Id, Switches_Id, Switches_Pins, Type FROM Pcb_T RIGHT JOIN Switches_T
ON Pcb_T.Pcb_Pins = Switches_T.Switches_Pins
WHERE Pcb_Pins = 3;

--UNION query
SELECT Keys_Material FROM Keys_T
UNION ALL
SELECT Case_Material FROM Case_T;

--testing the views created in DDL file
SELECT * FROM Order_V;
SELECT * FROM Threepins_V;

--getting metadata
SELECT column_name, data_type, character_maximum_length FROM INFORMATION_SCHEMA.COLUMNS WHERE
TABLE_NAME = 'layout_t' OR
TABLE_NAME = 'case_t' OR
TABLE_NAME = 'pcb_t' OR
TABLE_NAME = 'switches_t' OR
TABLE_NAME = 'keys_t' OR
TABLE_NAME = 'customer_t' OR
TABLE_NAME = 'invoice_t' OR
TABLE_NAME = 'invoice_Line_t';

-- eof Assignment2-DML.sql
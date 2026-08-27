--1. Initialize the entire container layering

CREATE DATABASE LogisticsNetwork;
GO

--2. Open the new container for data use
USE LogisticsNetwork;
GO

--3. Create parent table #1
CREATE TABLE Warehouses (
Warehouse_ID INT IDENTITY(1,1) PRIMARY KEY,
Warehouse_Name VARCHAR(100) NOT NULL,
Location_City VARCHAR(50) NOT NULL
);
GO


--4. Create parent table #2
CREATE TABLE Drivers (
Driver_ID INT IDENTITY(1,1) PRIMARY KEY,
Driver_Name VARCHAR(100) NOT NULL,
License_Number VARCHAR(100) NOT NULL
);
GO

--5. Create parent table #3
CREATE TABLE Trucks (
Truck_ID INT IDENTITY(1,1) PRIMARY KEY,
License_Plate VARCHAR(50) NOT NULL,
Warehouse_ID INT NOT NULL FOREIGN KEY REFERENCES Warehouses(Warehouse_ID),
Driver_ID INT NOT NULL UNIQUE FOREIGN KEY REFERENCES Drivers(Driver_ID)
);
GO

--6. Create final child table #4
CREATE TABLE Shipments (
Shipment_ID INT IDENTITY(1,1) PRIMARY KEY,
Destination_City VARCHAR(100) NOT NULL,
Cargo_Weight_Lbs INT NOT NULL,
Shipment_Value_USD DECIMAL(10,2) NOT NULL,
Truck_ID INT NOT NULL FOREIGN KEY REFERENCES Trucks(Truck_ID)
);
GO
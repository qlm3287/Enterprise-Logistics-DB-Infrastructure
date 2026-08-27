USE LogisticsNetwork;
GO

-- ==========================================
-- 1. INSERT MOCK DATA: WAREHOUSES
-- ==========================================
INSERT INTO Warehouses (Warehouse_Name, Location_City) VALUES 
('Chicagoland Regional Hub', 'Chicago'),
('Great Lakes Distribution Center', 'Detroit'),
('Midwest Logistics Center', 'Indianapolis'),
('Gateway Commerce Center', 'St. Louis');
GO

-- ==========================================
-- 2. INSERT MOCK DATA: DRIVERS
-- ==========================================
INSERT INTO Drivers (Driver_Name, License_Number) VALUES 
('Marcus Vance', 'IL-CDL-99823'),
('Sarah Jenkins', 'MI-CDL-44109'),
('David Cho', 'IN-CDL-11562'),
('Elena Rostova', 'MO-CDL-77341');
GO

-- ==========================================
-- 3. INSERT MOCK DATA: TRUCKS (FLEET)
-- ==========================================
INSERT INTO Trucks (License_Plate, Warehouse_ID, Driver_ID) VALUES 
('TRK-CHI-01', 1, 1), 
('TRK-DET-02', 2, 2), 
('TRK-STL-03', 3, 4), 
('TRK-IND-04', 4, 3);
GO

-- ==========================================
-- 4. INSERT MOCK DATA: SHIPMENTS (TRANSACTIONS)
-- ==========================================
INSERT INTO Shipments (Destination_City, Cargo_Weight_Lbs, Shipment_Value_USD, Truck_ID) VALUES 
('Milwaukee', 12500, 45000.00, 1),   
('Grand Rapids', 8200, 18500.50, 2), 
('Kansas City', 24000, 115000.00, 3),
('Louisville', 15400, 62300.00, 4),  
('Rockford', 6100, 12000.00, 1),     
('Cleveland', 19800, 88400.25, 2);   
GO

-- ==========================================
-- 5. RELATIONAL DATA ANALYSIS VERIFICATION
-- ==========================================
SELECT 
    S.Shipment_ID,
    S.Destination_City,
    S.Shipment_Value_USD,
    T.License_Plate,
    D.Driver_Name
FROM Shipments S
INNER JOIN Trucks T ON S.Truck_ID = T.Truck_ID
INNER JOIN Drivers D ON T.Driver_ID = D.Driver_ID;
GO

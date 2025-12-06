-- 🧱 Table Partitioning on Booking Table (PostgreSQL Syntax)

-- Objective: Implement range partitioning on the large Booking table based on the start_date column to optimize date-range queries.
-- Note: This script assumes a PostgreSQL database environment.

-- 1. Rename the existing Booking table (if it exists)
ALTER TABLE Booking RENAME TO Booking_old;

-- 2. Create the new partitioned master table (Booking)
-- The master table does not hold data itself but defines the partitioning structure.
CREATE TABLE Booking (
    booking_id UUID PRIMARY KEY,
    property_id UUID NOT NULL,
    user_id UUID NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL NOT NULL,
    status ENUM('pending', 'confirmed', 'canceled') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (property_id) REFERENCES Property(property_id),
    FOREIGN KEY (user_id) REFERENCES User(user_id)
) PARTITION BY RANGE (start_date);


-- 3. Create Partitions (Example by year)

-- Partition for 2024 bookings
CREATE TABLE Booking_2024 PARTITION OF Booking
    FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

-- Partition for 2025 bookings (current year in context)
CREATE TABLE Booking_2025 PARTITION OF Booking
    FOR VALUES FROM ('2025-01-01') TO ('2026-01-01');

-- Partition for future bookings
CREATE TABLE Booking_future PARTITION OF Booking
    FOR VALUES FROM ('2026-01-01') TO ('2030-01-01');


-- 4. Migrate Data (Optional, for an existing large table)
-- If the Booking_old table was large, this would be necessary:
/*
INSERT INTO Booking SELECT * FROM Booking_old;
DROP TABLE Booking_old;
*/

-- 5. Create Indexes on Partitions
-- Indexes must be created on the master table to be inherited by all partitions.
CREATE INDEX idx_booking_user_id ON Booking (user_id);
CREATE INDEX idx_booking_property_id ON Booking (property_id);
CREATE INDEX idx_booking_status ON Booking (status);

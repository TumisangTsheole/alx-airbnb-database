-- 🚀 Index Creation and Performance Test Examples

-- Objective: Create indexes on high-usage columns and provide test cases for measuring performance.
-- Note: Primary Keys (PKs) are automatically indexed.
-- The following EXPLAIN ANALYZE commands are for testing performance BEFORE and AFTER index creation.

-- ==============================================================================
-- 1. PERFORMANCE BASELINE TEST (BEFORE INDEXES)
-- Test Query: Find all properties for a specific host and sort them by price.
-- This is a common lookup operation that should benefit greatly from indexing 'host_id'.
-- ==============================================================================
EXPLAIN ANALYZE
SELECT
    name,
    pricepernight
FROM
    Property
WHERE
    host_id = 'uuid-002' -- Using Bob's ID from the seed script
ORDER BY
    pricepernight DESC;

-- ==============================================================================
-- 2. CREATE INDEXES
-- ==============================================================================

-- USER Table Indexes
-- 'email' is often indexed for fast logins/lookups (assumed to be indexed by UNIQUE constraint).
CREATE INDEX idx_user_email ON User(email);

-- PROPERTY Table Indexes
-- 'host_id' is a Foreign Key and is heavily used in JOINs and lookups.
CREATE INDEX idx_property_host_fk ON Property(host_id);
-- 'location' is often used in search/WHERE clauses.
CREATE INDEX idx_property_location ON Property(location);

-- BOOKING Table Indexes
-- 'status' is often used in WHERE clauses to filter bookings (e.g., confirmed, pending).
CREATE INDEX idx_booking_status ON Booking(status);
-- Compound index for queries like "Find all future bookings for a user."
CREATE INDEX idx_booking_user_start_date ON Booking(user_id, start_date);

-- REVIEW Table Indexes
-- Index on property_id and rating for fast filtering/ordering of reviews.
CREATE INDEX idx_review_property_rating ON Review(property_id, rating DESC);

-- MESSAGE Table Indexes
-- Indexing on both sender and recipient is crucial for fast message thread retrieval.
CREATE INDEX idx_message_sender ON Message(sender_id);
CREATE INDEX idx_message_recipient ON Message(recipient_id);


-- ==============================================================================
-- 3. PERFORMANCE TEST (AFTER INDEXES)
-- Rerun the same test query to measure the performance improvement.
-- ==============================================================================
EXPLAIN ANALYZE
SELECT
    name,
    pricepernight
FROM
    Property
WHERE
    host_id = 'uuid-002'
ORDER BY
    pricepernight DESC;

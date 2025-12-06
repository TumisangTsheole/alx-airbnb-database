-- 🚀 Index Creation for Query Performance Improvement

-- Objective: Create indexes on high-usage columns to speed up common queries (WHERE, JOIN, ORDER BY).

-- Based on the schema (User, Property, Booking, Review, Message) and common queries:
-- - Columns used in JOINs (Foreign Keys) are essential.
-- - Columns used in WHERE clauses (e.g., email, status) are essential.
-- - Columns used in ORDER BY or GROUP BY can benefit from indexing.

-- Note: Primary Keys (PKs) are automatically indexed by the database.

-- 1. USER Table Indexes
-- The 'email' column is already unique and should have an index, often created implicitly with the UNIQUE constraint.
-- If the UNIQUE constraint did not create an index, this ensures it exists for fast logins/lookups.
CREATE INDEX idx_user_email ON User(email);


-- 2. PROPERTY Table Indexes
-- 'host_id' is a Foreign Key and is heavily used in JOINs and lookups (e.g., "Show properties for this host").
CREATE INDEX idx_property_host_fk ON Property(host_id);
-- 'location' is often used in search/WHERE clauses.
CREATE INDEX idx_property_location ON Property(location);


-- 3. BOOKING Table Indexes
-- 'property_id' and 'user_id' are crucial Foreign Keys, already indexed in the original schema but confirmed here.
-- 'status' is often used in WHERE clauses to filter bookings (e.g., confirmed, pending).
CREATE INDEX idx_booking_status ON Booking(status);
-- Index on both user_id and start_date can speed up queries like "Find all future bookings for a user."
CREATE INDEX idx_booking_user_start_date ON Booking(user_id, start_date);


-- 4. REVIEW Table Indexes
-- An index on property_id and rating can speed up queries that order or filter by rating for a specific property.
CREATE INDEX idx_review_property_rating ON Review(property_id, rating DESC);


-- 5. MESSAGE Table Indexes
-- Indexing on both sender and recipient is crucial for fast message thread retrieval.
CREATE INDEX idx_message_sender ON Message(sender_id);
CREATE INDEX idx_message_recipient ON Message(recipient_id);

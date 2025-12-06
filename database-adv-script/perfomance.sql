-- 🚀 Query Performance Analysis and Optimization

-- Objective: Write a complex query, analyze its performance, and refactor it for efficiency.
-- Schema Entities involved: Booking, User, Property, Payment

-- ==============================================================================
-- 1. BASELINE PERFORMANCE TEST (Initial Complex Query)
-- Instruction: Retrieve all bookings along with user details, property details, and payment details.
-- This tests four necessary INNER JOINs without initial filtering.
-- ==============================================================================

-- Test Baseline Performance BEFORE Optimization:
EXPLAIN ANALYZE
SELECT
    b.booking_id,
    b.start_date,
    b.total_price,
    u.first_name AS guest_first_name,
    p.name AS property_name,
    pm.amount AS payment_amount
FROM
    Booking AS b
INNER JOIN
    User AS u ON b.user_id = u.user_id
INNER JOIN
    Property AS p ON b.property_id = p.property_id
INNER JOIN
    Payment AS pm ON b.booking_id = pm.booking_id
ORDER BY
    b.start_date DESC;


-- ==============================================================================
-- 2. OPTIMIZED QUERY (Refactored for Efficiency)
-- Goal: Improve performance by reducing columns and adding early filtering.
-- ==============================================================================

-- Test Optimized Performance AFTER Refactoring:
EXPLAIN ANALYZE
SELECT
    b.booking_id,
    b.start_date,
    b.total_price,
    u.email, -- Selected email instead of first_name/last_name to reduce column overhead
    p.name AS property_name,
    pm.amount
FROM
    Booking AS b
INNER JOIN
    User AS u ON b.user_id = u.user_id
INNER JOIN
    Property AS p ON b.property_id = p.property_id
INNER JOIN
    Payment AS pm ON b.booking_id = pm.booking_id
WHERE
    b.status = 'confirmed' -- Added filter to reduce dataset size and leverage index
ORDER BY
    b.start_date DESC;

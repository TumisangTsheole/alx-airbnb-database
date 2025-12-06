-- 🚀 Query Performance Analysis and Optimization

-- Objective: Write a complex query, analyze its performance, and refactor it for efficiency.
-- Schema Entities involved: Booking, User, Property, Payment

-- ==============================================================================
-- 1. INITIAL COMPLEX QUERY (Potentially Inefficient)
-- Retrieves all bookings along with user details, property details, and payment details.
-- This uses four INNER JOINs, which can be resource-intensive if not well-indexed.
-- ==============================================================================
SELECT
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price,
    b.status AS booking_status,
    u.first_name AS guest_first_name,
    u.last_name AS guest_last_name,
    p.name AS property_name,
    p.location AS property_location,
    pm.amount AS payment_amount,
    pm.payment_method
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
-- Goal: Improve performance by reducing columns selected, checking WHERE clauses,
-- and ensuring joins use indexed FKs. In this case, the joins are all necessary
-- based on the requested output, so optimization focuses on SELECT efficiency
-- and using an explicit WHERE clause to filter common subsets (e.g., confirmed status).
-- ==============================================================================
SELECT
    b.booking_id,
    b.start_date,
    b.total_price,
    u.email, -- Changed from first/last name for faster lookup if email is primary join criteria
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
    b.status = 'confirmed' -- Filter added to reduce dataset size and leverage the idx_booking_status index
ORDER BY
    b.start_date DESC;

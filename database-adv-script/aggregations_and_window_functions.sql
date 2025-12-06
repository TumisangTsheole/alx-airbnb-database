-- 📊 SQL Aggregation and Window Functions for AirBnB Database

-- Objective: Analyze data using SQL aggregation (COUNT, GROUP BY) and window functions (RANK).
-- Schema Entities: User, Property, Booking, Review

-- 1. Aggregation Query: Total Bookings Per User
-- Instruction: Write a query to find the total number of bookings made by each user, using the COUNT function and GROUP BY clause.
SELECT
    u.user_id,
    u.first_name,
    u.last_name,
    COUNT(b.booking_id) AS total_bookings_made
FROM
    User AS u
LEFT JOIN
    Booking AS b ON u.user_id = b.user_id
GROUP BY
    u.user_id, u.first_name, u.last_name
ORDER BY
    total_bookings_made DESC;

-- 2. Window Function Query: Rank Properties by Total Bookings
-- Instruction: Use a window function (ROW_NUMBER, RANK) to rank properties based on the total number of bookings they have received.
WITH PropertyBookingCount AS (
    -- Subquery to calculate the total number of bookings per property
    SELECT
        p.property_id,
        p.name AS property_name,
        COUNT(b.booking_id) AS total_bookings
    FROM
        Property AS p
    LEFT JOIN
        Booking AS b ON p.property_id = b.property_id
    GROUP BY
        p.property_id, p.name
)
SELECT
    property_id,
    property_name,
    total_bookings,
    -- RANK() assigns the same rank to properties with the same number of bookings (with gaps in the sequence)
    RANK() OVER (ORDER BY total_bookings DESC) AS booking_rank,
    -- DENSE_RANK() assigns the same rank without gaps
    DENSE_RANK() OVER (ORDER BY total_bookings DESC) AS booking_dense_rank
FROM
    PropertyBookingCount
ORDER BY
    total_bookings DESC;

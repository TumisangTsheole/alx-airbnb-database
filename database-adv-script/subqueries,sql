-- 📝 SQL Subqueries for AirBnB Database

-- Objective: Master SQL subqueries by writing both correlated and non-correlated examples.
-- Schema Entities: User, Property, Booking, Review

-- 1. Non-Correlated Subquery: Properties with Average Rating > 4.0
-- Instruction: Write a query to find all properties where the average rating is greater than 4.0 using a subquery.
SELECT
    property_id,
    name
FROM
    Property
WHERE
    property_id IN (
        SELECT
            property_id
        FROM
            Review
        GROUP BY
            property_id
        HAVING
            AVG(rating) > 4.0
    );

-- 2. Correlated Subquery: Users with More than 3 Bookings
-- Instruction: Write a correlated subquery to find users who have made more than 3 bookings.
SELECT
    user_id,
    first_name,
    last_name
FROM
    User AS u
WHERE
    (
        SELECT
            COUNT(booking_id)
        FROM
            Booking AS b
        WHERE
            b.user_id = u.user_id
    ) > 3;

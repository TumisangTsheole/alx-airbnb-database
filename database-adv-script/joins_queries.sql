-- 🏡 AirBnB Advanced Joins Queries

-- Objective: Master SQL joins by writing complex queries using different types of joins.
-- Schema Entities: User, Property, Booking, Payment, Review, Message

-- 1. INNER JOIN Query: Bookings and Respective Users
-- Instruction: Write a query using an INNER JOIN to retrieve all bookings and the respective users who made those bookings.
SELECT
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price,
    u.first_name,
    u.last_name,
    u.email
FROM
    Booking AS b
INNER JOIN
    User AS u ON b.user_id = u.user_id;

-- 2. LEFT JOIN Query: Properties and All Reviews
-- Instruction: Write a query using a LEFT JOIN to retrieve all properties and their reviews, including properties that have no reviews.
SELECT
    p.property_id,
    p.name AS property_name,
    p.location,
    r.review_id,
    r.rating,
    r.comment
FROM
    Property AS p
LEFT JOIN
    Review AS r ON p.property_id = r.property_id
ORDER BY
    p.name;

-- 3. FULL OUTER JOIN Query: All Users and All Bookings
-- Instruction: Write a query using a FULL OUTER JOIN to retrieve all users and all bookings, even if the user has no booking or a booking is not linked to a user.
SELECT
    u.user_id,
    u.email AS user_email,
    b.booking_id,
    b.start_date,
    b.status
FROM
    User AS u
FULL OUTER JOIN
    Booking AS b ON u.user_id = b.user_id;

-- Note for MySQL Users:
-- If your database (like MySQL) does not support FULL OUTER JOIN,
-- you can achieve the same result using a combination of LEFT JOIN and RIGHT JOIN with UNION:
/*
SELECT u.user_id, u.email AS user_email, b.booking_id, b.start_date, b.status
FROM User AS u
LEFT JOIN Booking AS b ON u.user_id = b.user_id
UNION
SELECT u.user_id, u.email AS user_email, b.booking_id, b.start_date, b.status
FROM User AS u
RIGHT JOIN Booking AS b ON u.user_id = b.user_id
WHERE u.user_id IS NULL;
*/

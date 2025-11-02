-- USERS
INSERT INTO User (user_id, first_name, last_name, email, password_hash, phone_number, role, created_at)
VALUES
  ('uuid-001', 'Alice', 'Smith', 'alice@example.com', 'hashed_pw_1', '1234567890', 'guest', CURRENT_TIMESTAMP),
  ('uuid-002', 'Bob', 'Johnson', 'bob@example.com', 'hashed_pw_2', '0987654321', 'host', CURRENT_TIMESTAMP),
  ('uuid-003', 'Carol', 'Lee', 'carol@example.com', 'hashed_pw_3', NULL, 'admin', CURRENT_TIMESTAMP);

-- PROPERTIES
INSERT INTO Property (property_id, host_id, name, description, location, pricepernight, created_at, updated_at)
VALUES
  ('prop-001', 'uuid-002', 'Sunny Loft', 'A bright loft in downtown.', 'Cape Town', 1200.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
  ('prop-002', 'uuid-002', 'Garden Cottage', 'Cozy cottage with garden views.', 'Stellenbosch', 950.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- BOOKINGS
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status, created_at)
VALUES
  ('book-001', 'prop-001', 'uuid-001', '2025-12-01', '2025-12-05', 4800.00, 'confirmed', CURRENT_TIMESTAMP),
  ('book-002', 'prop-002', 'uuid-001', '2026-01-10', '2026-01-12', 1900.00, 'pending', CURRENT_TIMESTAMP);

-- PAYMENTS
INSERT INTO Payment (payment_id, booking_id, amount, payment_date, payment_method)
VALUES
  ('pay-001', 'book-001', 4800.00, CURRENT_TIMESTAMP, 'credit_card');

-- REVIEWS
INSERT INTO Review (review_id, property_id, user_id, rating, comment, created_at)
VALUES
  ('rev-001', 'prop-001', 'uuid-001', 5, 'Amazing stay! Super clean and central.', CURRENT_TIMESTAMP),
  ('rev-002', 'prop-002', 'uuid-001', 4, 'Lovely garden and peaceful vibe.', CURRENT_TIMESTAMP);

-- MESSAGES
INSERT INTO Message (message_id, sender_id, recipient_id, message_body, sent_at)
VALUES
  ('msg-001', 'uuid-001', 'uuid-002', 'Hi Bob, is the loft available for early check-in?', CURRENT_TIMESTAMP),
  ('msg-002', 'uuid-002', 'uuid-001', 'Hi Alice, yes early check-in is possible from 11am.', CURRENT_TIMESTAMP);

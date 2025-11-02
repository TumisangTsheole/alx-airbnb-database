# 🏡 AirBnB Database Schema

## 📦 Overview
This schema defines the core entities and relationships for an AirBnB-style booking platform. It includes users, properties, bookings, payments, reviews, and messaging.

## 📐 Tables

### 👤 User
Stores user profiles with roles (`guest`, `host`, `admin`). Indexed on `email`.

### 🏠 Property
Represents listings hosted by users. Linked to `User` via `host_id`.

### 📅 Booking
Captures reservation details. Linked to `Property` and `User`.

### 💳 Payment
Tracks payments for bookings. Linked to `Booking`.

### ⭐ Review
Stores user feedback on properties. Linked to `User` and `Property`.

### 💬 Message
Enables communication between users. Each message has a sender and recipient.

## 🔗 Relationships
- `User` ↔ `Property` (host)
- `User` ↔ `Booking` (guest)
- `User` ↔ `Review`, `Message`
- `Property` ↔ `Booking`, `Review`
- `Booking` ↔ `Payment`

## ⚙️ Indexes
- `User.email`
- `Property.property_id`, `host_id`
- `Booking.booking_id`, `property_id`, `user_id`
- `Payment.booking_id`

## ✅ Notes
- All UUIDs should be securely generated.
- Timestamps default to UTC.
- ENUMs used for roles, status, and payment methods.
- Ratings constrained between 1 and 5.


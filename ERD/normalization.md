# 📐 Database Normalization Report – AirBnB Schema

## 🎯 Objective
Ensure the AirBnB-style database schema adheres to **Third Normal Form (3NF)** by eliminating redundancy, ensuring atomicity, and preserving referential integrity.

---

## 🔍 Normalization Overview

### ✅ First Normal Form (1NF)
- All attributes contain **atomic values** (no repeating groups or arrays).
- Each table has a **primary key**.
- Example: `User.email` is atomic and unique; `Booking.start_date` and `end_date` are atomic.

### ✅ Second Normal Form (2NF)
- All **non-key attributes** are fully functionally dependent on the **entire primary key**.
- Applies to tables with **composite keys** (none in this schema).
- Example: In `Booking`, attributes like `start_date`, `end_date`, and `total_price` depend entirely on `booking_id`.

### ✅ Third Normal Form (3NF)
- All attributes are **non-transitively dependent** on the primary key.
- No derived or redundant data stored.
- Example: `User.role` is dependent only on `user_id`, not on other non-key attributes.

---

## 🛠 Normalization Adjustments

After reviewing the schema, the following adjustments were considered:

### 1. 📦 Avoiding Derived Data
- `Booking.total_price` could be derived from `pricepernight × nights`, but it's retained for performance and historical accuracy.
- Justified as a **denormalization for efficiency**, not a violation of 3NF.

### 2. 🧾 Payment Method Enum
- `payment_method` is stored as an ENUM (`credit_card`, `paypal`, `stripe`).
- No need to extract into a separate table unless extensibility or localization is required.

### 3. 🧑‍🤝‍🧑 User Role ENUM
- `role` is stored as ENUM (`guest`, `host`, `admin`).
- No transitive dependency—each role is directly tied to `user_id`.

### 4. 🗣 Message Table
- `sender_id` and `recipient_id` both reference `User(user_id)`.
- No redundancy or derived data—each message is atomic and self-contained.

---

## ✅ Final Verdict

The schema satisfies:
- **1NF**: Atomic attributes, no repeating groups.
- **2NF**: All non-key attributes depend on the full primary key.
- **3NF**: No transitive dependencies or redundant data.

No structural changes were required to achieve 3NF. The schema is **normalized and optimized** for relational integrity and query performance.

---

## 📌 Notes
- Future enhancements (e.g., audit trails, localization, role permissions) may introduce new entities but should preserve 3NF.
- Denormalization (e.g., storing `total_price`) should be documented and justified.


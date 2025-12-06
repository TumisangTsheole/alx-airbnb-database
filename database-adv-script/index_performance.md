# 📈 Index and Query Performance Analysis

## 🎯 Objective
Measure and document the performance impact of creating indexes on high-usage columns in the AirBnB schema.

---

## 🛠 High-Usage Columns Identified

Based on the schema and common application queries:
* **User:** `email` (for login/lookup).
* **Property:** `host_id` (FK, for host listings), `location` (for search).
* **Booking:** `user_id` (FK), `property_id` (FK), `status` (for filtering), and combined `user_id, start_date`.
* **Review:** Combined `property_id, rating` (for filtering/ordering).

---

## 💻 Performance Measurement (Example Workflow)

### 1. Baseline Measurement (No Indexes)
Run a complex query (e.g., joining User, Booking, and Property, filtered by a specific status) and analyze its execution time using the database's query plan tool.

**Example Query:**
```sql
EXPLAIN ANALYZE
SELECT
    u.email,
    p.name AS property_name,
    b.start_date
FROM
    Booking b
JOIN
    User u ON b.user_id = u.user_id
JOIN
    Property p ON b.property_id = p.property_id
WHERE
    b.status = 'pending' AND u.role = 'guest'
ORDER BY
    b.start_date DESC;

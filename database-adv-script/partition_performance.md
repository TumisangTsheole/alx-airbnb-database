# 📉 Partitioning Performance Report

## 🎯 Objective
Implement range partitioning on the large `Booking` table using the `start_date` column and analyze the performance improvements for date-range queries.

---

## 1. Methodology: Partitioning Implementation

The `Booking` table was partitioned by range on the `start_date` column (see `partitioning.sql`):
* **Partition Key:** `start_date`
* **Partitioning Method:** `RANGE` (by year, e.g., `Booking_2024`, `Booking_2025`).

## 2. Test Case Analysis

A typical large-dataset query that benefits from partitioning is fetching a small subset of data across a time range.

**Test Query:** Retrieve all confirmed bookings made in the year 2024.

```sql
-- Test Query
SELECT
    booking_id,
    user_id,
    start_date
FROM
    Booking
WHERE
    start_date >= '2024-03-01' AND start_date < '2024-04-01'
    AND status = 'confirmed';

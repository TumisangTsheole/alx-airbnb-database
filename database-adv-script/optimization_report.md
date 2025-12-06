# 📉 Query Optimization Report

## 🎯 Objective
Analyze a complex multi-join query, identify inefficiencies using `EXPLAIN`, and refactor the query to reduce execution time.

---

## 1. Initial Complex Query Analysis

The initial query uses four consecutive `INNER JOIN` operations to link `Booking`, `User`, `Property`, and `Payment` tables.

### Potential Inefficiencies:
1.  **Selection Overhead:** Selecting a large number of columns (`first_name`, `last_name`, `description`, etc.) adds processing time, especially on large datasets.
2.  **Lack of Filtering:** Without a `WHERE` clause, the query joins the *entire* dataset of all four tables, resulting in a large intermediate result set before the `ORDER BY` is applied.
3.  **Order By Cost:** Ordering by `b.start_date` on a large, unsorted result set can lead to high sorting costs (disk sorts) if the relevant index (`idx_booking_user_start_date` if it exists) is not fully utilized.

**Execution Analysis (Placeholder - to be filled after running `EXPLAIN`):**
```sql
EXPLAIN ANALYZE -- Initial Query
-- [Insert the EXPLAIN ANALYZE output here. Expected results: High cost on sequential scans and final sort.]

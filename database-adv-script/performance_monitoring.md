# 📈 Continuous Performance Monitoring and Refinement

## 🎯 Objective
Establish a continuous monitoring process to analyze the execution plans of frequently used queries, identify performance bottlenecks, and implement schema or query adjustments for long-term optimization.

---

## 1. Monitoring Strategy

The following queries are frequently executed in an AirBnB-style application and should be regularly monitored:

| Query Focus | Description | Query Type |
| :--- | :--- | :--- |
| **Search/Filter** | Find properties in a specific location by price. | `SELECT ... WHERE location = 'X' AND pricepernight < Y` |
| **User Activity** | Get all confirmed bookings and reviews for a specific user. | `SELECT ... FROM Booking JOIN Review ... WHERE user_id = X AND status = 'confirmed'` |
| **Reporting** | Rank hosts by their total revenue. | `SELECT ... FROM Property JOIN Booking ... GROUP BY host_id` |

### Monitoring Tool Usage:

* **PostgreSQL:** Use the `EXPLAIN ANALYZE [your_query];` command to view the actual execution time and the query plan steps.
* **MySQL:** Use the `EXPLAIN [your_query];` command for the query plan, or `SET profiling = 1;` followed by `SHOW PROFILES;` to see detailed timing.

---

## 2. Identifying Common Bottlenecks

Based on the current schema and typical usage, these are areas where bottlenecks are likely to occur:

| Potential Bottleneck | Diagnosis (in `EXPLAIN`) | Suggested Refinement |
| :--- | :--- | :--- |
| **Unoptimized Search** | **Sequential Scan** (or Full Table Scan) on a large table like `Property` or `Booking`. | Ensure indexes exist on frequently searched columns like `Property.location`, `Booking.status`, and date columns. |
| **Inefficient Join** | High cost on a **Nested Loop Join** or **Hash Join** involving Foreign Keys. | Verify that **all Foreign Key columns** have a corresponding index. |
| **Sorting Cost** | High cost associated with the final **Sort** operation. | Create a **multi-column index** that matches the `ORDER BY` clause (e.g., `(user_id, start_date DESC)`). |
| **Suboptimal Schema** | Slow multi-table queries that require many joins. | Consider **Materialized Views** for complex reporting queries (like host revenue) that don't need real-time data. |

---

## 3. Implementation and Reporting Template

After identifying a specific bottleneck, implement the change and document the improvement.

### 📝 Bottleneck Report: [Example: Slow Property Search]

**Initial Query:**
```sql
EXPLAIN ANALYZE
SELECT name, pricepernight FROM Property WHERE location = 'Cape Town' ORDER BY pricepernight;

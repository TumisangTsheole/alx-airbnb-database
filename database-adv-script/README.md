# 🔗 SQL Joins Mastery: Advanced Queries

This directory contains advanced SQL queries focused on mastering different types of joins, utilizing the schema developed for the AirBnB database project.

---

### 🎯 Objective

The primary objective is to demonstrate proficiency in writing complex queries that retrieve and combine data from multiple tables using **INNER JOIN**, **LEFT JOIN**, and **FULL OUTER JOIN** operations.

---

### 📝 File: `joins_queries.sql`

This file contains the following three specific queries written against the `User`, `Property`, `Booking`, and `Review` tables:

1.  **INNER JOIN:** Retrieves all confirmed **bookings** and the corresponding **users** who made them.
2.  **LEFT JOIN:** Retrieves **all properties** and any associated **reviews**, ensuring properties with no reviews are still listed (using `NULL` values for review columns).
3.  **FULL OUTER JOIN:** Retrieves **all users** and **all bookings**, including unmatched rows from either side.

---

### 🚀 Usage

Execute the queries in `joins_queries.sql` against the fully seeded AirBnB database to test and observe the behavior of the different join types.

```bash
# Example (using psql):
psql -d airbnb_db_name -f joins_queries.sql

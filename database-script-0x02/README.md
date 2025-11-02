# 🌱 AirBnB Sample Data Seeder

## 📦 Purpose
This script populates the AirBnB-style database with realistic sample data for testing and development.

## 📋 Included Entities
- **User**: 3 users with roles `guest`, `host`, and `admin`
- **Property**: 2 listings hosted by Bob
- **Booking**: 2 bookings made by Alice
- **Payment**: 1 confirmed payment
- **Review**: 2 reviews from Alice
- **Message**: 2 messages between Alice and Bob

## 🚀 Usage
Run this script after creating your schema:

```bash
psql -d your_database_name -f seed.sql

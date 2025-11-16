# 🎉 Event Management System (EMS)

A **professional & visually appealing MySQL-based Event Management System** designed to manage events, users, registrations, speakers, payments, sponsors, sessions, and attendees.

> ✨ *Perfect for showcasing database design, SQL skills, and real‑world project structure on GitHub.*

---

## 🏷️ Project Highlights

* 🔹 Complete event lifecycle management
* 🔹 Clean & normalized SQL database structure
* 🔹 Strong table relationships using foreign keys
* 🔹 Includes registrations, payments, sessions & more
* 🔹 Realistic queries for resume & portfolio use

---

## 🗂️ Database Tables

| Table Name        | Description                            |
| ----------------- | -------------------------------------- |
| **events**        | Stores main event details              |
| **users**         | User information (admins/participants) |
| **registrations** | Links users to events                  |
| **payments**      | Payment transactions                   |
| **speakers**      | Speaker details                        |
| **sessions**      | Event session schedule                 |
| **sponsors**      | Event sponsors                         |
| **attendees**     | Tracks session/event attendees         |

---

## 🧩 ER Diagram (Overview)

```
users (user_id PK) ───────────────┐
                                  │
registrations (reg_id PK, user_id FK, event_id FK)
                                  │
events (event_id PK) ─────────────┘

payments (payment_id PK, reg_id FK)

speakers (speaker_id PK)
sessions (session_id PK, event_id FK, speaker_id FK)

sponsors (sponsor_id PK, event_id FK)

attendees (attendee_id PK, session_id FK)
```

---

## 🔧 Tech Stack

* 🛢️ **MySQL** – Database engine
* 🧱 **SQL (DDL & DML)** – Table creation, constraints, queries
* 🖥️ **MySQL Workbench / CLI** – Execution

---

## 🚀 How to Use This Project

### 1️⃣ Import the SQL Files

1. Open **MySQL Workbench**
2. Create a **new schema**
3. Run SQL scripts in this order:

   * Create tables
   * Insert sample data
   * Run joins, procedures, or views

### 2️⃣ Explore the Queries

* ✔ Event session & speaker list
* ✔ Users registered for an event
* ✔ Payment tracking
* ✔ Attendees list

---

## 📌 Sample SQL Queries

### 🔍 1. Fetch all attendees for each event

```sql
SELECT u.name AS attendee_name, e.event_name
FROM attendees a
JOIN sessions s ON a.session_id = s.session_id
JOIN events e ON s.event_id = e.event_id
JOIN users u ON a.user_id = u.user_id;
```

### 🎤 2. List all sessions with their speakers

```sql
SELECT s.session_name, sp.speaker_name, e.event_name
FROM sessions s
JOIN speakers sp ON s.speaker_id = sp.speaker_id
JOIN events e ON s.event_id = e.event_id;
```

---

## 🚧 Future Improvements

* 📊 Add dashboards using Power BI / Python
* 🔐 Role-based login & permissions
* 🌐 Connect with a web UI (PHP / Flask / Node.js)
* 🔁 Add triggers & stored procedures

---

## About Me ✨🤩

**Name:** Abdul Ahad M
**Email:** abdulahad.analyst@gmail.com 



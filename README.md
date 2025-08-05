# 📚 Library Management SQL Project

## 📌 Overview
This project is a **MySQL-based Library Management System** designed to manage authors, books, borrowers, and transactions.  
It demonstrates **database design, data insertion, and SQL queries** for real-world scenarios.

---

## 🛠 Features
- **Relational Database Design** with primary & foreign keys
- **CRUD Operations** for managing books, authors, and borrowers
- Sample data for easy testing
- Example queries for:
  - Overdue books
  - Most borrowed books
  - Books by a specific author

---

## 📂 Database Schema
**Tables:**
- `authors` → Author details
- `books` → Book details linked to authors
- `borrowers` → People who borrow books
- `transactions` → Records of issued and returned books

---

## 💻 How to Run
1. Open MySQL terminal or MySQL Workbench.
2. Run:
   ```bash
   SOURCE library_db.sql;

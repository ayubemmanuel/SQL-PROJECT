# 📚 Library Management System (MySQL Database)

## 📌 Overview
This project is a **relational database management system (RDBMS)** for a **Library Management System**.  
It was built using **MySQL** and demonstrates the use of **tables, constraints, relationships, and sample data**.  

The system supports:  
- Tracking books, authors, and members.  
- Recording book loans (who borrowed which book and when).  
- Managing many-to-many relationships between books and authors.  

---

## 🗂 Database Schema

### Tables:
1. **Authors**
   - Stores author details.  
   - **PK**: `author_id`  

2. **Books**
   - Stores book details (title, ISBN, year, copies).  
   - **PK**: `book_id`  

3. **Members**
   - Stores library member details.  
   - **PK**: `member_id`  

4. **Loans**
   - Tracks which member borrows which book.  
   - **PK**: `loan_id`  
   - **FKs**: `member_id` → Members, `book_id` → Books  

5. **BookAuthors** (junction table)
   - Handles many-to-many relationship between books and authors.  
   - **PK (composite)**: `(book_id, author_id)`  
   - **FKs**: `book_id` → Books, `author_id` → Authors  

---

## 🔑 Relationships
- **One-to-Many**:  
  - Members → Loans  
  - Books → Loans  
- **Many-to-Many**:  
  - Books ↔ Authors (via BookAuthors)  

---

## ⚙️ Setup Instructions

1. Clone or download this repository.  
2. Open MySQL Workbench (or CLI).  
3. Run the script:  

   ```sql
   SOURCE LibraryDB.sql;

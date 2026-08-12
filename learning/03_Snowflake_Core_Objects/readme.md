# 🧱 03 — Snowflake Core Objects

## 📌 Overview

Snowflake provides several **core objects** that help Data Engineers organize, store, access, and manage data.

A simple way to understand the hierarchy is:

```text
Snowflake Account
       │
       ▼
   Database
       │
       ▼
    Schema
       │
       ├── Tables
       ├── Views
       ├── Stages
       └── Other Objects
```

> [!NOTE]
> A **Database** contains schemas, and a **Schema** contains database objects such as tables, views, stages, and other objects.

---

# 🏢 1. Snowflake Account

A **Snowflake Account** is the environment through which an organization accesses and uses Snowflake.

An account contains resources and objects such as:

* Databases
* Schemas
* Tables
* Views
* Warehouses
* Users
* Roles
* Stages

Conceptually:

```text
                Snowflake Account
                       │
        ┌──────────────┼──────────────┐
        │              │              │
    Databases      Warehouses       Users/Roles
        │
      Schemas
        │
     Objects
```

> [!TIP]
> Think of the **Snowflake Account** as the overall environment in which your Snowflake resources and objects exist.

---

# 🗄️ 2. Database

A **Database** is a logical container used to organize data.

A database contains one or more **schemas**.

```text
Database
    │
    ├── Schema 1
    ├── Schema 2
    └── Schema 3
```

Example:

```sql
CREATE DATABASE ecommerce_db;
```

To use the database:

```sql
USE DATABASE ecommerce_db;
```

---

# 📂 3. Schema

A **Schema** is a logical container inside a database.

It is used to organize database objects such as:

* Tables
* Views
* Stages
* File Formats
* Procedures
* Functions

Hierarchy:

```text
Database
   │
   ├── Schema
   │     │
   │     ├── Table
   │     ├── View
   │     ├── Stage
   │     └── File Format
   │
   └── Schema
```

Example:

```sql
CREATE SCHEMA sales;
```

To use the schema:

```sql
USE SCHEMA ecommerce_db.sales;
```

> [!TIP]
> Think of a **Database as a building** and a **Schema as a department inside that building**.

---

# 📊 4. Table

A **Table** stores structured data in rows and columns.

For example:

```text
customers

+-------------+------------+-------+
| customer_id | name       | city  |
+-------------+------------+-------+
| 101         | Rahul      | Pune  |
| 102         | Priya      | Mumbai|
| 103         | Amit       | Delhi |
+-------------+------------+-------+
```

Example:

```sql
CREATE TABLE customers (
    customer_id INT,
    name VARCHAR,
    city VARCHAR
);
```

Insert data:

```sql
INSERT INTO customers
VALUES
    (101, 'Rahul', 'Pune'),
    (102, 'Priya', 'Mumbai'),
    (103, 'Amit', 'Delhi');
```

Retrieve data:

```sql
SELECT *
FROM customers;
```

> [!NOTE]
> A table is one of the primary objects used to **store and query data** in Snowflake.

---

# 👁️ 5. View

A **View** is a database object that stores a SQL query rather than storing the query result as a separate physical table.

Example:

```sql
CREATE VIEW pune_customers AS
SELECT
    customer_id,
    name
FROM customers
WHERE city = 'Pune';
```

Query the view:

```sql
SELECT *
FROM pune_customers;
```

Conceptually:

```text
Table
  │
  ▼
SQL Query
  │
  ▼
View
  │
  ▼
Query View
```

> [!TIP]
> Think of a view as a **saved SQL query** that can be queried like a table.

---

# 📦 6. Stage

A **Stage** is a Snowflake object used as a location for **data files before or during loading into Snowflake**.

For example, files such as:

```text
customers.csv
orders.csv
products.csv
```

can be placed in a stage before being loaded into tables.

Conceptually:

```text
Data Files
    │
    ▼
  Stage
    │
    ▼
 Snowflake Table
```

There are two broad types of stages:

```text
Stage
 │
 ├── Internal Stage
 │
 └── External Stage
```

> [!NOTE]
> Stages are particularly important in **Snowflake data loading**. We will study them in greater detail when covering data ingestion.

---

# 📄 7. File Format

A **File Format** defines how data in a file should be interpreted when loading or unloading data.

Common file formats include:

* CSV
* JSON
* Avro
* ORC
* Parquet
* XML

For example, a CSV file might contain:

```text
customer_id,name,city
101,Rahul,Pune
102,Priya,Mumbai
```

A file format can define properties such as:

* Field delimiter
* Header information
* File type
* Compression
* Record delimiter

Example:

```sql
CREATE FILE FORMAT csv_format
TYPE = CSV
SKIP_HEADER = 1
FIELD_DELIMITER = ',';
```

> [!TIP]
> Think of a **File Format** as instructions telling Snowflake **how to read or write a data file**.

---

# 🏗️ Core Object Hierarchy

The main hierarchy can be visualized as:

```text
                    Snowflake Account
                           │
                           ▼
                       Database
                           │
                           ▼
                        Schema
                           │
             ┌─────────────┼─────────────┐
             │             │             │
             ▼             ▼             ▼
          Tables         Views         Stages
                                         │
                                         ▼
                                    File Formats
```

A more practical example:

```text
Snowflake Account
       │
       ▼
  ecommerce_db
       │
       ├── sales
       │    ├── customers
       │    ├── orders
       │    └── order_items
       │
       └── analytics
            ├── customer_summary
            └── sales_summary
```

---

# 🔄 How the Objects Work Together

Consider an e-commerce data pipeline.

```text
                CSV Files
                    │
                    ▼
                  Stage
                    │
                    ▼
              File Format
                    │
                    ▼
                  Table
                    │
                    ▼
                  View
                    │
                    ▼
              BI / Analytics
```

For example:

1. An `orders.csv` file is received.
2. The file is placed in a **Stage**.
3. A **File Format** tells Snowflake how to interpret the CSV.
4. The data is loaded into an **Orders Table**.
5. A **View** can expose transformed or filtered data for analysts.

This is a common pattern in Snowflake data engineering.

---

# 🧠 Easy Mental Model

Think about a company:

```text
             🏢 Company
                  │
               Database
                  │
             📂 Department
                  │
                Schema
                  │
       ┌──────────┼──────────┐
       │          │          │
       ▼          ▼          ▼
    Tables      Views      Stages
       │                     │
    Data                Data Files
```

Mapping it to Snowflake:

```text
Database
   │
   ▼
Schema
   │
   ├── Table  → Stores data
   ├── View   → Saved query
   ├── Stage  → Holds data files for loading/unloading
   └── File Format → Defines how files are interpreted
```

---

# 👨‍💻 Data Engineer Perspective

As a Data Engineer, you will frequently work with these objects.

For example:

```text
                Source Files
                     │
                     ▼
                  Stage
                     │
                File Format
                     │
                     ▼
                  Raw Table
                     │
                     ▼
              Transformation
                     │
                     ▼
              Analytics Table
                     │
                     ▼
                   View
                     │
                     ▼
                BI / Reports
```

A typical Snowflake environment might therefore contain:

```text
ecommerce_db
│
├── raw
│   ├── customers
│   ├── orders
│   └── products
│
├── transformed
│   ├── customer_orders
│   └── product_sales
│
└── analytics
    ├── customer_summary
    └── sales_summary
```

> [!TIP]
> For interviews, focus on understanding **what each object is, where it exists in the hierarchy, and what problem it solves**.

---

# ❓ Interview Questions

### Q1. What are the main Snowflake objects?

<details>
<summary><strong>Answer</strong></summary>

Common Snowflake objects include:

* Database
* Schema
* Table
* View
* Stage
* File Format
* Virtual Warehouse
* Other database and account-level objects

The exact purpose of each object is different, but together they help organize, store, process, and access data.

</details>

---

### Q2. What is the relationship between a database and a schema?

<details>
<summary><strong>Answer</strong></summary>

A **database contains schemas**, and schemas contain database objects such as tables, views, stages, and file formats.

The hierarchy is:

```text
Database
    │
    ▼
Schema
    │
    ▼
Database Objects
```

</details>

---

### Q3. What is a table in Snowflake?

<details>
<summary><strong>Answer</strong></summary>

A table is a database object used to **store structured data in rows and columns**.

It can be queried using SQL.

</details>

---

### Q4. What is a view?

<details>
<summary><strong>Answer</strong></summary>

A view is a database object that represents the result of a SQL query.

It can be queried like a table and is commonly used to provide a specific representation of underlying data without creating another copy of the data.

</details>

---

### Q5. What is a stage in Snowflake?

<details>
<summary><strong>Answer</strong></summary>

A stage is a location used to store or reference data files for loading data into Snowflake or unloading data from Snowflake.

Stages can be **internal** or **external**.

</details>

---

### Q6. What is a file format?

<details>
<summary><strong>Answer</strong></summary>

A file format defines how Snowflake should interpret data in files during loading or unloading.

It can specify properties such as file type, field delimiter, header handling, and compression.

</details>

---

### Q7. What is the hierarchy between a database, schema, and table?

<details>
<summary><strong>Answer</strong></summary>

The hierarchy is:

```text
Database
    │
    ▼
Schema
    │
    ▼
Table
```

A database contains schemas, and a schema contains tables and other database objects.

</details>

---

# 📝 Quick Revision

```text
                 Snowflake Account
                        │
                        ▼
                    Database
                        │
                        ▼
                     Schema
                        │
          ┌─────────────┼─────────────┐
          │             │             │
          ▼             ▼             ▼
       Table          View          Stage
                                      │
                                      ▼
                                File Format
```

> [!TIP]
>
> ### Remember
>
> **Database → Organizes schemas**
> **Schema → Organizes database objects**
> **Table → Stores data**
> **View → Represents a SQL query**
> **Stage → Handles data files for loading/unloading**
> **File Format → Defines how files are interpreted**

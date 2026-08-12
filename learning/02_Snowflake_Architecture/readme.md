# 🏗️ 02 — Snowflake Architecture

## 📌 Overview

Snowflake uses a **multi-layer architecture** designed to separate data storage, query processing, and platform management.

The three major components are:

```text
                    Snowflake
                        │
          ┌─────────────┼─────────────┐
          │             │             │
          ▼             ▼             ▼
      Storage         Compute     Cloud Services
          │             │             │
     Stores Data    Runs Queries   Manages &
                                   Coordinates
```

> [!IMPORTANT]
> The most important architectural concept in Snowflake is the **separation of storage and compute**. This allows them to scale independently.

---

## 🗄️ 1. Database Storage Layer

The **Database Storage Layer** is responsible for storing data.

When data is loaded into Snowflake, it is stored in Snowflake's cloud storage layer.

```text
                Storage Layer
                     │
                     ▼
              ┌─────────────┐
              │    Data     │
              │             │
              │ Tables      │
              │ Rows        │
              │ Columns     │
              └─────────────┘
```

The storage layer handles the persistent storage of data.

Snowflake manages the underlying infrastructure, so users do not need to manage:

* Physical disks
* Storage servers
* File systems
* Storage capacity

> [!TIP]
> **Storage = Where the data lives.**

---

### 📦 Micro-Partitions

Snowflake automatically organizes table data into **micro-partitions**.

Conceptually:

```text
Table
 │
 ├── Micro-Partition 1
 ├── Micro-Partition 2
 ├── Micro-Partition 3
 ├── Micro-Partition 4
 └── Micro-Partition 5
```

Micro-partitions help Snowflake efficiently identify the data that needs to be scanned when a query is executed.

> [!NOTE]
> Micro-partitions are an important part of Snowflake's storage architecture. We will study them in greater detail when covering **performance and optimization**.

---

# ⚙️ 2. Compute Layer

The **Compute Layer** is responsible for processing queries.

Snowflake uses **Virtual Warehouses** to provide compute resources.

```text
                 Compute Layer
                      │
                      ▼
              Virtual Warehouse
                      │
                      ▼
                  SQL Query
                      │
                      ▼
                 Query Result
```

For example:

```sql
SELECT
    customer_id,
    SUM(order_amount)
FROM orders
GROUP BY customer_id;
```

To execute this query, compute resources are required to:

1. Read the required data
2. Process the records
3. Group the data
4. Calculate the `SUM`
5. Return the result

The Virtual Warehouse provides these compute resources.

---

## 🏭 Virtual Warehouse

A **Virtual Warehouse** is a cluster of compute resources used to execute SQL statements and other supported workloads.

Think of it as the **processing engine** of Snowflake.

```text
             Virtual Warehouse
                    │
        ┌───────────┼───────────┐
        │           │           │
       CPU        Memory     Resources
        │           │           │
        └───────────┼───────────┘
                    │
                    ▼
                SQL Query
```

> [!TIP]
> **Storage stores the data.**
> **Virtual Warehouse processes the data.**

---

# ☁️ 3. Cloud Services Layer

The **Cloud Services Layer** is responsible for coordinating and managing Snowflake.

It provides services such as:

* Authentication
* Access Control
* Metadata Management
* Query Parsing
* Query Optimization
* Infrastructure Coordination

Conceptually:

```text
              Cloud Services
                    │
       ┌────────────┼────────────┐
       │            │            │
 Authentication   Metadata    Query
                              Processing
       │            │            │
       └────────────┼────────────┘
                    │
                    ▼
                Snowflake
```

> [!TIP]
> **Cloud Services = The control and coordination layer of Snowflake.**

---

# 🔄 How the Three Layers Work Together

Suppose we execute:

```sql
SELECT *
FROM customers;
```

The query can be understood conceptually as:

```text
                  SQL Query
                      │
                      ▼
             ┌─────────────────┐
             │  Cloud Services │
             │                 │
             │ Parse / Manage  │
             └────────┬────────┘
                      │
                      ▼
             ┌─────────────────┐
             │ Virtual         │
             │ Warehouse       │
             │                 │
             │ Process Query   │
             └────────┬────────┘
                      │
                      ▼
             ┌─────────────────┐
             │ Storage Layer   │
             │                 │
             │ Read Required   │
             │ Data            │
             └────────┬────────┘
                      │
                      ▼
                   Result
```

A simple mental flow is:

```text
SQL Query
    │
    ▼
Cloud Services
    │
    ▼
Compute
    │
    ▼
Storage
    │
    ▼
Result
```

> [!NOTE]
> This is a simplified conceptual flow used to understand the responsibilities of each Snowflake layer.

---

# ⭐ Separation of Storage and Compute

This is one of the **most important concepts in Snowflake architecture**.

```text
                    Snowflake
                       │
          ┌────────────┴────────────┐
          │                         │
       Storage                    Compute
          │                         │
    Stores Data              Processes Data
          │                         │
          └────────────┬────────────┘
                       │
                Independent
                  Scaling
```

Suppose a company has:

```text
10 TB → 100 TB → 500 TB
```

The amount of stored data increases.

However, increasing storage does not necessarily mean that the company needs to increase compute resources by the same amount.

Similarly, if the number of queries suddenly increases:

```text
Normal Workload
      │
      ▼
More Queries
      │
      ▼
Increase Compute
```

Compute resources can be adjusted independently of the underlying storage.

> [!IMPORTANT]
> **Storage and compute can scale independently.**

This separation is one of the key advantages of Snowflake's architecture.

---

# 🧠 Easy Mental Model

Think about a restaurant:

```text
                 Restaurant
                     │
        ┌────────────┼────────────┐
        │            │            │
        ▼            ▼            ▼
     Storage       Compute     Management
        │            │            │
   Ingredients    Kitchen      Manager
```

The equivalent Snowflake model is:

```text
                 Snowflake
                     │
        ┌────────────┼────────────┐
        │            │            │
        ▼            ▼            ▼
     Storage       Compute    Cloud Services
        │            │            │
    Stores Data   Runs SQL    Coordinates
```

> [!TIP]
> Remember:
>
> **Storage → Stores data**
> **Compute → Processes data**
> **Cloud Services → Manages and coordinates Snowflake**

---

# 👨‍💻 Data Engineer Perspective

Understanding Snowflake architecture is important for a Data Engineer because different workloads can require different amounts of compute.

For example:

```text
                    Snowflake Storage
                           │
              ┌────────────┴────────────┐
              │                         │
        Data Engineering            Analytics
              │                         │
        Warehouse A                Warehouse B
```

The teams can use separate compute resources while working with the same underlying data.

This is useful when:

* Data Engineers are running ETL/ELT jobs
* Analysts are running queries
* BI tools are generating reports
* Multiple workloads run at the same time

The workloads can be isolated at the compute level rather than competing for the exact same compute resources.

---

# ❓ Interview Questions

### Q1. Explain Snowflake architecture.

<details>
<summary><strong>Answer</strong></summary>

Snowflake architecture consists of three major components:

1. **Database Storage** — stores the data.
2. **Compute** — uses Virtual Warehouses to process SQL queries.
3. **Cloud Services** — manages services such as authentication, access control, metadata management, query parsing, and query optimization.

A key characteristic of Snowflake architecture is the **separation of storage and compute**, allowing them to scale independently.

</details>

---

### Q2. What are the three main components of Snowflake architecture?

<details>
<summary><strong>Answer</strong></summary>

The three main components are:

1. **Database Storage**
2. **Compute**
3. **Cloud Services**

</details>

---

### Q3. What is a Virtual Warehouse?

<details>
<summary><strong>Answer</strong></summary>

A Virtual Warehouse is a **cluster of compute resources** used to execute SQL statements and other supported workloads in Snowflake.

It provides the processing power required to run queries.

</details>

---

### Q4. Where is data stored in Snowflake?

<details>
<summary><strong>Answer</strong></summary>

Data is stored in Snowflake's **cloud storage layer**.

Snowflake automatically organizes table data into micro-partitions.

</details>

---

### Q5. What is the Cloud Services Layer responsible for?

<details>
<summary><strong>Answer</strong></summary>

The Cloud Services Layer handles and coordinates services such as:

* Authentication
* Access control
* Metadata management
* Query parsing
* Query optimization

</details>

---

### Q6. Why is the separation of storage and compute important?

<details>
<summary><strong>Answer</strong></summary>

The separation allows storage and compute resources to **scale independently**.

For example, an organization can increase its stored data without necessarily increasing its compute resources by the same amount.

Similarly, compute can be increased when query workloads become heavier without changing the underlying storage.

</details>

---

# 📝 Quick Revision

```text
                    Snowflake
                        │
          ┌─────────────┼─────────────┐
          │             │             │
          ▼             ▼             ▼
      Storage         Compute     Cloud Services
          │             │             │
     Stores Data    Runs Queries   Manages &
                                   Coordinates
          │             │             │
          └─────────────┼─────────────┘
                        │
                Independent Scaling
```

> [!TIP]
>
> ### Remember
>
> **Storage → Stores data**
> **Compute → Runs queries**
> **Cloud Services → Manages and coordinates**
>
> **Storage + Compute are separated → Independent scaling**

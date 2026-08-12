-- ============================================================
-- 01 — Snowflake Fundamentals
-- ============================================================
-- Purpose:
-- This file contains simple, executable examples for the
-- fundamental Snowflake concepts covered in the Learning section.
--
-- Important:
-- Snowflake is a cloud data platform. These examples focus on
-- basic SQL interaction with Snowflake objects.
-- ============================================================

-- ------------------------------------------------------------
-- 1. Create a Database
-- ------------------------------------------------------------
-- A database is a logical container used to organize schemas
-- and other database objects.
CREATE DATABASE IF NOT EXISTS DEMO_DB;

-- ------------------------------------------------------------
-- 2. Use the Database
-- ------------------------------------------------------------
-- USE DATABASE changes the current database for the session.
-- This means subsequent unqualified object names are resolved
-- inside DEMO_DB.
USE DATABASE DEMO_DB;

-- ------------------------------------------------------------
-- 3. Create a Schema
-- ------------------------------------------------------------
-- A schema is a logical container inside a database.
-- It is used to organize objects such as tables and views.
CREATE SCHEMA IF NOT EXISTS DEMO_SCHEMA;

-- ------------------------------------------------------------
-- 4. Use the Schema
-- ------------------------------------------------------------
-- This makes DEMO_SCHEMA the active schema for the session.
USE SCHEMA DEMO_SCHEMA;

-- ------------------------------------------------------------
-- 5. Create a Simple Table
-- ------------------------------------------------------------
-- A table stores data in rows and columns.
CREATE TABLE IF NOT EXISTS CUSTOMERS (
    -- Unique identifier for each customer.
    CUSTOMER_ID INTEGER,

    -- Customer's name.
    CUSTOMER_NAME VARCHAR(100),

    -- Customer's city.
    CITY VARCHAR(100)
);

-- ------------------------------------------------------------
-- 6. Insert Sample Data
-- ------------------------------------------------------------
-- INSERT adds rows to the table.
INSERT INTO CUSTOMERS (CUSTOMER_ID, CUSTOMER_NAME, CITY)
VALUES
    (101, 'Rahul', 'Pune'),
    (102, 'Priya', 'Mumbai'),
    (103, 'Amit', 'Delhi');

-- ------------------------------------------------------------
-- 7. Query the Data
-- ------------------------------------------------------------
-- SELECT reads data from the table.
-- The * means return all columns.
SELECT *
FROM CUSTOMERS;

-- ------------------------------------------------------------
-- 8. Query Specific Columns
-- ------------------------------------------------------------
-- Instead of selecting every column, we can explicitly select
-- only the columns required by the query.
SELECT
    CUSTOMER_ID,
    CUSTOMER_NAME
FROM CUSTOMERS;

-- ------------------------------------------------------------
-- 9. Filter Data
-- ------------------------------------------------------------
-- WHERE filters rows based on a condition.
-- Only customers from Pune will be returned.
SELECT
    CUSTOMER_ID,
    CUSTOMER_NAME,
    CITY
FROM CUSTOMERS
WHERE CITY = 'Pune';

-- ============================================================
-- Key Takeaways
-- ============================================================
-- Database  → Organizes schemas.
-- Schema    → Organizes database objects.
-- Table     → Stores structured data.
-- SELECT    → Reads data.
-- INSERT    → Adds data.
-- WHERE     → Filters data.
-- ============================================================

-- ============================================================
-- 03 — Snowflake Core Objects
-- ============================================================
-- Purpose:
-- This file demonstrates the core Snowflake objects covered in
-- the Learning section.
--
-- Main hierarchy:
-- Account → Database → Schema → Database Objects
--
-- Examples covered:
-- Database, Schema, Table, View, Stage, and File Format.
-- ============================================================

-- ------------------------------------------------------------
-- 1. Create a Database
-- ------------------------------------------------------------
-- A database is a logical container for schemas and the objects
-- organized inside those schemas.
CREATE DATABASE IF NOT EXISTS CORE_OBJECTS_DEMO;

-- ------------------------------------------------------------
-- 2. Use the Database
-- ------------------------------------------------------------
-- This makes CORE_OBJECTS_DEMO the active database for the
-- current session.
USE DATABASE CORE_OBJECTS_DEMO;

-- ------------------------------------------------------------
-- 3. Create a Schema
-- ------------------------------------------------------------
-- A schema is a logical container inside a database.
-- It organizes objects such as tables, views, stages, and
-- file formats.
CREATE SCHEMA IF NOT EXISTS SALES;

-- ------------------------------------------------------------
-- 4. Use the Schema
-- ------------------------------------------------------------
-- This makes SALES the active schema for the current session.
USE SCHEMA SALES;

-- ------------------------------------------------------------
-- 5. Create a Table
-- ------------------------------------------------------------
-- A table stores structured data in rows and columns.
CREATE TABLE IF NOT EXISTS ORDERS (
    -- Unique identifier for each order.
    ORDER_ID INTEGER,

    -- Identifier of the customer who placed the order.
    CUSTOMER_ID INTEGER,

    -- Amount of the order.
    ORDER_AMOUNT NUMBER(10, 2),

    -- Date on which the order was placed.
    ORDER_DATE DATE
);

-- ------------------------------------------------------------
-- 6. Insert Sample Data
-- ------------------------------------------------------------
-- INSERT adds rows to the ORDERS table.
INSERT INTO ORDERS (ORDER_ID, CUSTOMER_ID, ORDER_AMOUNT, ORDER_DATE)
VALUES
    (1, 101, 1500.00, '2026-08-01'),
    (2, 102, 2300.00, '2026-08-02'),
    (3, 101, 900.00,  '2026-08-03');

-- ------------------------------------------------------------
-- 7. Query the Table
-- ------------------------------------------------------------
-- SELECT retrieves data stored in the table.
SELECT *
FROM ORDERS;

-- ------------------------------------------------------------
-- 8. Create a View
-- ------------------------------------------------------------
-- A view is a database object that represents a SQL query.
-- It can be queried like a table.
CREATE OR REPLACE VIEW CUSTOMER_ORDER_SUMMARY AS
SELECT
    -- Group the orders by customer.
    CUSTOMER_ID,

    -- Calculate the total amount spent by each customer.
    SUM(ORDER_AMOUNT) AS TOTAL_ORDER_AMOUNT
FROM ORDERS
GROUP BY CUSTOMER_ID;

-- ------------------------------------------------------------
-- 9. Query the View
-- ------------------------------------------------------------
-- The view can be queried using SELECT just like a table.
SELECT *
FROM CUSTOMER_ORDER_SUMMARY;

-- ------------------------------------------------------------
-- 10. Create a File Format
-- ------------------------------------------------------------
-- A file format tells Snowflake how to interpret data files
-- during loading or unloading.
--
-- This example describes a CSV file:
-- - TYPE = CSV       → The file contains comma-separated data.
-- - SKIP_HEADER = 1  → Ignore the first row of the file.
-- - FIELD_DELIMITER  → Columns are separated by commas.
CREATE FILE FORMAT IF NOT EXISTS CSV_FORMAT
    TYPE = CSV
    SKIP_HEADER = 1
    FIELD_DELIMITER = ',';

-- ------------------------------------------------------------
-- 11. Create an Internal Stage
-- ------------------------------------------------------------
-- An internal stage provides a Snowflake-managed location for
-- files used during data loading and unloading.
CREATE STAGE IF NOT EXISTS ORDERS_STAGE;

-- ------------------------------------------------------------
-- 12. List Files in the Stage
-- ------------------------------------------------------------
-- LIST displays files available in the stage.
-- The stage may be empty until files are uploaded.
LIST @ORDERS_STAGE;

-- ------------------------------------------------------------
-- 13. View the Current Database and Schema
-- ------------------------------------------------------------
-- These functions show the database and schema currently
-- selected for the session.
SELECT CURRENT_DATABASE();

SELECT CURRENT_SCHEMA();

-- ============================================================
-- Core Object Summary
-- ============================================================
-- Database     → Organizes schemas.
-- Schema       → Organizes database objects.
-- Table        → Stores structured data.
-- View         → Represents a SQL query.
-- Stage        → Provides a location for data files used in
--                loading and unloading.
-- File Format  → Defines how data files are interpreted.
-- ============================================================

-- Object hierarchy:
--
-- Snowflake Account
--        │
--        ▼
--     Database
--        │
--        ▼
--      Schema
--        │
--   ┌────┼─────────────┐
--   ▼    ▼             ▼
-- Table  View        Stage
--                        │
--                        ▼
--                   File Format
-- ============================================================

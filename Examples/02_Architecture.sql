-- ============================================================
-- 02 — Snowflake Architecture
-- ============================================================
-- Purpose:
-- This file demonstrates SQL examples that help visualize the
-- responsibilities of Snowflake's storage, compute, and cloud
-- services components.
--
-- Note:
-- Storage and Cloud Services are managed by Snowflake. A Data
-- Engineer mainly interacts with these layers through SQL and
-- Snowflake objects.
-- ============================================================

-- ------------------------------------------------------------
-- 1. Create a Database and Schema
-- ------------------------------------------------------------
-- Database and schema provide the logical organization for
-- objects whose data will be stored in Snowflake.
CREATE DATABASE IF NOT EXISTS ARCHITECTURE_DEMO;

USE DATABASE ARCHITECTURE_DEMO;

CREATE SCHEMA IF NOT EXISTS SALES;

USE SCHEMA SALES;

-- ------------------------------------------------------------
-- 2. Create a Table
-- ------------------------------------------------------------
-- The table represents data that Snowflake stores in its
-- database storage layer.
CREATE TABLE IF NOT EXISTS ORDERS (
    -- Unique identifier for the order.
    ORDER_ID INTEGER,

    -- Identifier of the customer who placed the order.
    CUSTOMER_ID INTEGER,

    -- Amount associated with the order.
    ORDER_AMOUNT NUMBER(10, 2),

    -- Date on which the order was placed.
    ORDER_DATE DATE
);

-- ------------------------------------------------------------
-- 3. Insert Sample Data
-- ------------------------------------------------------------
-- These rows are stored as table data in Snowflake's storage
-- layer after the INSERT statement is processed.
INSERT INTO ORDERS (ORDER_ID, CUSTOMER_ID, ORDER_AMOUNT, ORDER_DATE)
VALUES
    (1, 101, 1500.00, '2026-08-01'),
    (2, 102, 2300.00, '2026-08-02'),
    (3, 101, 900.00,  '2026-08-03'),
    (4, 103, 3200.00, '2026-08-04');

-- ------------------------------------------------------------
-- 4. Execute a Query
-- ------------------------------------------------------------
-- The SQL statement requires compute resources to process the
-- query. In Snowflake, those compute resources are provided by
-- a Virtual Warehouse.
SELECT
    CUSTOMER_ID,
    SUM(ORDER_AMOUNT) AS TOTAL_ORDER_AMOUNT
FROM ORDERS
GROUP BY CUSTOMER_ID;

-- ------------------------------------------------------------
-- 5. Create a Virtual Warehouse
-- ------------------------------------------------------------
-- A Virtual Warehouse provides compute resources for executing
-- SQL statements and other supported workloads.
--
-- XSMALL is used here only as a simple demonstration of a
-- warehouse size.
CREATE WAREHOUSE IF NOT EXISTS DEMO_WH
    WITH
    WAREHOUSE_SIZE = 'XSMALL'
    AUTO_SUSPEND = 60
    AUTO_RESUME = TRUE;

-- ------------------------------------------------------------
-- 6. Use the Virtual Warehouse
-- ------------------------------------------------------------
-- This selects DEMO_WH as the warehouse used by the session
-- for subsequent statements that require compute resources.
USE WAREHOUSE DEMO_WH;

-- ------------------------------------------------------------
-- 7. Run a Query Using the Warehouse
-- ------------------------------------------------------------
-- The Virtual Warehouse provides the compute resources needed
-- to execute this aggregation query.
SELECT
    COUNT(*) AS TOTAL_ORDERS,
    SUM(ORDER_AMOUNT) AS TOTAL_SALES
FROM ORDERS;

-- ------------------------------------------------------------
-- 8. Independent Storage and Compute
-- ------------------------------------------------------------
-- The important architectural idea is that the data stored in
-- ORDERS and the compute provided by DEMO_WH are separate.
--
-- Storage → Stores the table data.
-- Compute → Processes the SQL query.
--
-- Increasing the amount of stored data does not require the
-- warehouse to be the same size. Compute can be adjusted based
-- on workload requirements.

-- ============================================================
-- Architecture Summary
-- ============================================================
-- Storage         → Stores data.
-- Compute         → Executes queries through Virtual Warehouses.
-- Cloud Services  → Manages and coordinates Snowflake services.
--
-- Key concept:
-- Storage and Compute are separated and can scale independently.
-- ============================================================

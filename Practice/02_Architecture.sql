-- ============================================================
-- 02 — Snowflake Architecture Practice
-- ============================================================
-- Purpose:
-- Practice the architecture concepts covered in class.
--
-- Focus:
--   1. Storage layer
--   2. Compute layer
--   3. Cloud Services layer
--   4. Virtual Warehouses
--   5. Separation of storage and compute
-- ============================================================


-- ============================================================
-- Question 1: Create a Virtual Warehouse
-- ============================================================
-- Create a small virtual warehouse named ANALYTICS_WH.
-- Configure it to suspend after 60 seconds of inactivity.
-- Enable auto-resume.

CREATE WAREHOUSE IF NOT EXISTS ANALYTICS_WH
    WAREHOUSE_SIZE = 'XSMALL'
    AUTO_SUSPEND = 60
    AUTO_RESUME = TRUE;


-- ============================================================
-- Question 2: Use the Warehouse
-- ============================================================
-- Make ANALYTICS_WH the active warehouse for the session.

USE WAREHOUSE ANALYTICS_WH;


-- ============================================================
-- Question 3: Inspect the Warehouse
-- ============================================================
-- Display the warehouse configuration and status.

SHOW WAREHOUSES;


-- ============================================================
-- Question 4: Modify Compute Size
-- ============================================================
-- Increase ANALYTICS_WH from XSMALL to SMALL.
-- This changes compute capacity, not stored data.

ALTER WAREHOUSE ANALYTICS_WH
    SET WAREHOUSE_SIZE = 'SMALL';


-- ============================================================
-- Question 5: Suspend the Warehouse
-- ============================================================
-- Suspend the warehouse manually.
-- This stops the warehouse from consuming active compute resources.

ALTER WAREHOUSE ANALYTICS_WH SUSPEND;


-- ============================================================
-- Question 6: Resume the Warehouse
-- ============================================================
-- Resume the warehouse so it can execute queries again.

ALTER WAREHOUSE ANALYTICS_WH RESUME;


-- ============================================================
-- Question 7: Architecture Understanding
-- ============================================================
-- Identify which Snowflake layer is responsible for each task:
--
-- A. Storing persistent table data
-- B. Executing SQL queries
-- C. Authentication and access control
-- D. Query parsing and optimization
--
-- Write your answers as comments below.
--
-- A. Storage Layer
-- B. Compute Layer
-- C. Cloud Services Layer
-- D. Cloud Services Layer


-- ============================================================
-- Question 8: Storage vs Compute Scenario
-- ============================================================
-- Scenario:
--
-- A company stores 500 TB of data in Snowflake, but most of
-- the time only a small number of queries are executed.
--
-- Question:
-- Should the company automatically use a very large warehouse
-- simply because it stores 500 TB of data?
--
-- Expected concept:
-- No. Storage and compute are separate. Warehouse size should
-- be selected according to workload and query requirements.


-- ============================================================
-- Question 9: Multiple Workloads Scenario
-- ============================================================
-- Scenario:
--
-- The Data Engineering team runs ETL jobs while the Analytics
-- team runs BI queries at the same time.
--
-- Question:
-- How can Snowflake's separation of storage and compute help?
--
-- Expected concept:
-- Different workloads can use separate virtual warehouses while
-- accessing the same underlying data storage.


-- ============================================================
-- Question 10: Architecture Interview Scenario
-- ============================================================
-- Scenario:
--
-- Query traffic suddenly increases during business hours.
-- The data stored in Snowflake has not changed.
--
-- Question:
-- Which part of the architecture should be considered when
-- additional query processing capacity is required?
--
-- Expected concept:
-- The Compute Layer / Virtual Warehouse.

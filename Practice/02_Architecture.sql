-- ============================================================
-- 02 — Snowflake Architecture Practice
-- ============================================================
-- Purpose:
-- Practice the architecture concepts covered in class.
--
-- Rule:
-- This file contains QUESTIONS ONLY.
-- Do not add solutions here.
-- ============================================================


-- ============================================================
-- Question 1: Create a Virtual Warehouse
-- ============================================================
-- Create a small virtual warehouse named ANALYTICS_WH.
-- Configure it to suspend after 60 seconds of inactivity.
-- Enable auto-resume.


-- ============================================================
-- Question 2: Use the Warehouse
-- ============================================================
-- Make ANALYTICS_WH the active warehouse for the session.


-- ============================================================
-- Question 3: Inspect the Warehouse
-- ============================================================
-- Display the warehouse configuration and status.


-- ============================================================
-- Question 4: Modify Compute Size
-- ============================================================
-- Increase ANALYTICS_WH from XSMALL to SMALL.
-- Consider what changes and what does not change when compute
-- capacity is increased.


-- ============================================================
-- Question 5: Suspend the Warehouse
-- ============================================================
-- Suspend the warehouse manually.


-- ============================================================
-- Question 6: Resume the Warehouse
-- ============================================================
-- Resume the warehouse so it can execute queries again.


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


-- ============================================================
-- Question 8: Storage vs Compute Scenario
-- ============================================================
-- A company stores 500 TB of data in Snowflake, but most of
-- the time only a small number of queries are executed.
--
-- Question:
-- Should the company automatically use a very large warehouse
-- simply because it stores 500 TB of data?
-- Explain your reasoning.


-- ============================================================
-- Question 9: Multiple Workloads Scenario
-- ============================================================
-- The Data Engineering team runs ETL jobs while the Analytics
-- team runs BI queries at the same time.
--
-- Question:
-- How can Snowflake's separation of storage and compute help?


-- ============================================================
-- Question 10: Architecture Interview Scenario
-- ============================================================
-- Query traffic suddenly increases during business hours.
-- The data stored in Snowflake has not changed.
--
-- Question:
-- Which part of the architecture should be considered when
-- additional query processing capacity is required?

-- ============================================================
-- 01 — Snowflake Fundamentals Practice
-- ============================================================
-- Purpose:
-- Practice the basic Snowflake concepts covered in class.
--
-- Focus:
--   1. Creating and using a database
--   2. Understanding storage vs compute
--   3. Working with a virtual warehouse
--   4. Inspecting Snowflake objects
-- ============================================================


-- ============================================================
-- Question 1: Create a Database
-- ============================================================
-- Create a database named DATA_ENGINEERING_DB.

CREATE DATABASE IF NOT EXISTS DATA_ENGINEERING_DB;


-- ============================================================
-- Question 2: Use the Database
-- ============================================================
-- Make DATA_ENGINEERING_DB the active database for the session.

USE DATABASE DATA_ENGINEERING_DB;


-- ============================================================
-- Question 3: Verify the Database
-- ============================================================
-- Display the databases available in the Snowflake account.
-- Identify DATA_ENGINEERING_DB in the result.

SHOW DATABASES;


-- ============================================================
-- Question 4: Create a Compute Resource
-- ============================================================
-- Create a small virtual warehouse named DE_WH.
-- The warehouse provides compute resources for SQL queries.

CREATE WAREHOUSE IF NOT EXISTS DE_WH
    WAREHOUSE_SIZE = 'XSMALL'
    AUTO_SUSPEND = 60
    AUTO_RESUME = TRUE;


-- ============================================================
-- Question 5: Use the Virtual Warehouse
-- ============================================================
-- Make DE_WH the active warehouse for the session.

USE WAREHOUSE DE_WH;


-- ============================================================
-- Question 6: Verify the Warehouse
-- ============================================================
-- Display the warehouses available in the account.

SHOW WAREHOUSES;


-- ============================================================
-- Question 7: Create a Simple Schema
-- ============================================================
-- Create a schema named SALES inside DATA_ENGINEERING_DB.
-- A schema is a logical container for database objects.

CREATE SCHEMA IF NOT EXISTS DATA_ENGINEERING_DB.SALES;


-- ============================================================
-- Question 8: Verify the Schema
-- ============================================================
-- Display the schemas inside DATA_ENGINEERING_DB.

SHOW SCHEMAS IN DATABASE DATA_ENGINEERING_DB;


-- ============================================================
-- Question 9: Understand Storage and Compute
-- ============================================================
-- Answer the following question in your own words:
--
-- If the amount of data stored in Snowflake increases from
-- 10 TB to 100 TB, does Snowflake automatically require the
-- compute warehouse to increase by the same amount?
--
-- Expected concept:
-- Storage and compute are separated and can scale independently.


-- ============================================================
-- Question 10: Interview Scenario
-- ============================================================
-- Scenario:
--
-- An analytics team runs many heavy queries during business
-- hours, while the Data Engineering team runs ETL workloads.
-- Explain why separating compute from storage is useful in
-- this situation.
--
-- Expected concept:
-- Different workloads can use appropriate compute resources
-- while accessing the same underlying stored data.

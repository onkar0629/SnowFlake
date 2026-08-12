-- ============================================================
-- 03 — Snowflake Core Objects Practice
-- ============================================================
-- Purpose:
-- Practice creating and working with the core Snowflake objects
-- covered in class.
--
-- Focus:
--   1. Database
--   2. Schema
--   3. Table
--   4. View
--   5. Stage
--   6. File Format
-- ============================================================


-- ============================================================
-- Question 1: Create a Database
-- ============================================================
-- Create a database named SALES_DB.

CREATE DATABASE IF NOT EXISTS SALES_DB;


-- ============================================================
-- Question 2: Use the Database
-- ============================================================
-- Make SALES_DB the active database.

USE DATABASE SALES_DB;


-- ============================================================
-- Question 3: Create Schemas
-- ============================================================
-- Create two schemas to separate raw and analytics data.

CREATE SCHEMA IF NOT EXISTS RAW;

CREATE SCHEMA IF NOT EXISTS ANALYTICS;


-- ============================================================
-- Question 4: Create a Table
-- ============================================================
-- Create a customers table inside the RAW schema.
-- The table should contain:
--   customer_id
--   customer_name
--   city
--   email

CREATE TABLE IF NOT EXISTS RAW.CUSTOMERS (
    customer_id INTEGER,
    customer_name VARCHAR,
    city VARCHAR,
    email VARCHAR
);


-- ============================================================
-- Question 5: Insert Sample Data
-- ============================================================
-- Insert a few sample customer records into the table.

INSERT INTO RAW.CUSTOMERS
    (customer_id, customer_name, city, email)
VALUES
    (101, 'Rahul', 'Pune', 'rahul@example.com'),
    (102, 'Priya', 'Mumbai', 'priya@example.com'),
    (103, 'Amit', 'Delhi', 'amit@example.com');


-- ============================================================
-- Question 6: Query the Table
-- ============================================================
-- Retrieve all customer records from the RAW.CUSTOMERS table.

SELECT *
FROM RAW.CUSTOMERS;


-- ============================================================
-- Question 7: Create a View
-- ============================================================
-- Create a view that returns only customers from Pune.
-- The view should contain customer_id, customer_name, and email.

CREATE OR REPLACE VIEW ANALYTICS.PUNE_CUSTOMERS AS
SELECT
    customer_id,
    customer_name,
    email
FROM RAW.CUSTOMERS
WHERE city = 'Pune';


-- ============================================================
-- Question 8: Query the View
-- ============================================================
-- Retrieve the data from the Pune customers view.

SELECT *
FROM ANALYTICS.PUNE_CUSTOMERS;


-- ============================================================
-- Question 9: Create a File Format
-- ============================================================
-- Create a CSV file format for files that contain:
--   - A header row
--   - Comma-separated fields

CREATE OR REPLACE FILE FORMAT RAW.CSV_FORMAT
    TYPE = CSV
    SKIP_HEADER = 1
    FIELD_DELIMITER = ',';


-- ============================================================
-- Question 10: Create an Internal Stage
-- ============================================================
-- Create an internal stage named CUSTOMER_STAGE.
-- This stage can be used as a location for data files.

CREATE OR REPLACE STAGE RAW.CUSTOMER_STAGE
    FILE_FORMAT = RAW.CSV_FORMAT;


-- ============================================================
-- Question 11: Inspect the Stage
-- ============================================================
-- List the files currently available in the stage.

LIST @RAW.CUSTOMER_STAGE;


-- ============================================================
-- Question 12: Inspect Core Objects
-- ============================================================
-- Display the schemas, tables, and views created in SALES_DB.

SHOW SCHEMAS IN DATABASE SALES_DB;

SHOW TABLES IN DATABASE SALES_DB;

SHOW VIEWS IN DATABASE SALES_DB;


-- ============================================================
-- Question 13: Object Hierarchy
-- ============================================================
-- Write the hierarchy of the objects created above.
--
-- Expected structure:
--
-- SALES_DB
-- ├── RAW
-- │   ├── CUSTOMERS
-- │   ├── CSV_FORMAT
-- │   └── CUSTOMER_STAGE
-- │
-- └── ANALYTICS
--     └── PUNE_CUSTOMERS


-- ============================================================
-- Question 14: Practical Scenario
-- ============================================================
-- Scenario:
--
-- A CSV file containing customer data arrives every day.
-- The Data Engineer needs to load the file into Snowflake,
-- store the data in a table, and expose only Pune customers
-- to an analytics team.
--
-- Question:
-- Which Snowflake objects could be used?
--
-- Expected concepts:
--   Stage       → Handle the incoming file
--   File Format → Define how the CSV should be interpreted
--   Table       → Store the customer data
--   View        → Expose the required subset to analytics


-- ============================================================
-- Question 15: Interview Scenario
-- ============================================================
-- Question:
-- Explain the difference between a Table, View, Stage,
-- and File Format in Snowflake.
--
-- Expected concepts:
--   Table       → Stores structured data
--   View        → Represents a SQL query over data
--   Stage       → Location for data files used for loading/unloading
--   File Format → Defines how Snowflake interprets data files

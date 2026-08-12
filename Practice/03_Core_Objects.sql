-- ============================================================
-- 03 — Snowflake Core Objects Practice
-- ============================================================
-- Purpose:
-- Practice the core Snowflake objects covered in class.
--
-- Rule:
-- This file contains QUESTIONS ONLY.
-- Do not add solutions here.
-- ============================================================


-- ============================================================
-- Question 1: Create a Database
-- ============================================================
-- Create a database named SALES_DB.


-- ============================================================
-- Question 2: Use the Database
-- ============================================================
-- Make SALES_DB the active database.


-- ============================================================
-- Question 3: Create Schemas
-- ============================================================
-- Create two schemas to separate raw and analytics data.
-- Name them RAW and ANALYTICS.


-- ============================================================
-- Question 4: Create a Table
-- ============================================================
-- Create a CUSTOMERS table inside the RAW schema.
-- The table should contain:
--   customer_id
--   customer_name
--   city
--   email


-- ============================================================
-- Question 5: Insert Sample Data
-- ============================================================
-- Insert a few sample customer records into the CUSTOMERS table.
-- Include customers from at least two different cities.


-- ============================================================
-- Question 6: Query the Table
-- ============================================================
-- Retrieve all customer records from RAW.CUSTOMERS.


-- ============================================================
-- Question 7: Create a View
-- ============================================================
-- Create a view in the ANALYTICS schema that returns only
-- customers from Pune.
-- The view should contain customer_id, customer_name, and email.


-- ============================================================
-- Question 8: Query the View
-- ============================================================
-- Retrieve the data from the Pune customers view.


-- ============================================================
-- Question 9: Create a File Format
-- ============================================================
-- Create a CSV file format for files that contain:
--   - A header row
--   - Comma-separated fields


-- ============================================================
-- Question 10: Create an Internal Stage
-- ============================================================
-- Create an internal stage named CUSTOMER_STAGE.
-- Configure it to use the CSV file format created above.


-- ============================================================
-- Question 11: Inspect the Stage
-- ============================================================
-- List the files currently available in CUSTOMER_STAGE.


-- ============================================================
-- Question 12: Inspect Core Objects
-- ============================================================
-- Display the schemas, tables, and views created in SALES_DB.


-- ============================================================
-- Question 13: Object Hierarchy
-- ============================================================
-- Write the hierarchy of the objects you created.
-- Start with the database and show the schemas and objects
-- contained within them.


-- ============================================================
-- Question 14: Practical Scenario
-- ============================================================
-- A CSV file containing customer data arrives every day.
-- The Data Engineer needs to load the file into Snowflake,
-- store the data in a table, and expose only Pune customers
-- to an analytics team.
--
-- Question:
-- Which Snowflake objects could be used for this workflow?


-- ============================================================
-- Question 15: Interview Scenario
-- ============================================================
-- Explain the difference between a Table, View, Stage,
-- and File Format in Snowflake.

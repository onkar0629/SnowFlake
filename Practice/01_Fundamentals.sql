-- ============================================================
-- 01 — Snowflake Fundamentals Practice
-- ============================================================
-- Purpose:
-- Practice the basic Snowflake concepts covered in class.
--
-- Rule:
-- This file contains QUESTIONS ONLY.
-- Do not add solutions here.
-- ============================================================


-- ============================================================
-- Question 1: Create a Database
-- ============================================================
-- Create a database named DATA_ENGINEERING_DB.


-- ============================================================
-- Question 2: Use the Database
-- ============================================================
-- Make DATA_ENGINEERING_DB the active database for the session.


-- ============================================================
-- Question 3: Verify the Database
-- ============================================================
-- Display the databases available in the Snowflake account.
-- Identify DATA_ENGINEERING_DB in the result.


-- ============================================================
-- Question 4: Create a Compute Resource
-- ============================================================
-- Create a small virtual warehouse named DE_WH.
-- Configure it to suspend after 60 seconds of inactivity.
-- Enable auto-resume.


-- ============================================================
-- Question 5: Use the Virtual Warehouse
-- ============================================================
-- Make DE_WH the active warehouse for the session.


-- ============================================================
-- Question 6: Verify the Warehouse
-- ============================================================
-- Display the warehouses available in the account.


-- ============================================================
-- Question 7: Create a Simple Schema
-- ============================================================
-- Create a schema named SALES inside DATA_ENGINEERING_DB.


-- ============================================================
-- Question 8: Verify the Schema
-- ============================================================
-- Display the schemas inside DATA_ENGINEERING_DB.


-- ============================================================
-- Question 9: Understand Storage and Compute
-- ============================================================
-- If the amount of data stored in Snowflake increases from
-- 10 TB to 100 TB, does Snowflake automatically require the
-- compute warehouse to increase by the same amount?
-- Explain your reasoning.


-- ============================================================
-- Question 10: Interview Scenario
-- ============================================================
-- An analytics team runs many heavy queries during business
-- hours, while the Data Engineering team runs ETL workloads.
-- Explain why separating compute from storage is useful in
-- this situation.

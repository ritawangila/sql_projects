# Nairobi Academy SQL Assignment

## Project Overview
This repository contains a single SQL assignment script for a school database named `nairobi_academy`. The script creates tables for students, subjects, and exam results, populates sample data, performs schema modifications, and includes example queries.

## Files
- `assignment.sql` - SQL script containing:
  - schema creation
  - table creation for `students`, `subjects`, and `exam_results`
  - data insertion for 10 students, 10 subjects, and 10 exam results
  - ALTER TABLE operations
  - UPDATE and DELETE operations
  - sample SELECT queries demonstrating filtering with `WHERE`, `BETWEEN`, `IN`, and `NOT IN`

## Database Structure
### Schema
- `nairobi_academy`

### Tables
#### `students`
- `student_id` INT PRIMARY KEY
- `first_name` VARCHAR(50) NOT NULL
- `last_name` VARCHAR(50) NOT NULL
- `gender` VARCHAR(1) NOT NULL
- `date_of_birth` DATE
- `class` VARCHAR(10)
- `city` VARCHAR(50)

#### `subjects`
- `student_id` INT PRIMARY KEY
- `subject_name` VARCHAR(100) NOT NULL UNIQUE
- `department` VARCHAR(50)
- `teacher_name` VARCHAR(100)
- `credit_hours` INT

#### `exam_results`
- `result_id` INT PRIMARY KEY
- `student_id` INT NOT NULL
- `subject_id` INT NOT NULL
- `marks` INT NOT NULL
- `exam_date` DATE
- `grade` VARCHAR(2)

## What the Script Covers
- Creating a schema and setting the search path
- Creating three tables with appropriate columns and constraints
- Adding and removing a column from the `students` table
- Renaming a column in the `subjects` table
- Inserting sample data into all tables
- Updating and deleting records
- Writing queries for:
  - filtering by class, department, gender, and city
  - comparing numeric ranges using `BETWEEN`
  - selecting rows using `IN` and `NOT IN`
  - filtering based on logical `AND` / `OR`

## How to Use
1. Open your SQL client or terminal.
2. Connect to the target PostgreSQL database server.
3. Run the script:
   ```sql
   \i assignment.sql
   ```
4. Verify the results by running the SELECT queries already present in the script.

## Notes
- The `subjects` table uses `student_id` as its primary key in this script, which is unusual for a standard subject catalog. In a more normalized design, `subject_id` would normally be the primary key.
- The sample data includes 10 students, 10 subjects, and 10 exam result records.
- The script includes inline comments for each numbered assignment task.

## Suggested Improvements
- Add foreign key constraints between `exam_results.student_id` and `students.student_id`, and between `exam_results.subject_id` and `subjects.student_id`.
- Introduce a dedicated `subject_id` primary key for `subjects` to distinguish subject records from student records.
- Normalize `class` and `city` values into separate lookup tables if this database grows larger.

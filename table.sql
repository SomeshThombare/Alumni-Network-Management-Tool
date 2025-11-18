CREATE TABLE alumni (
    id INT PRIMARY KEY,

    full_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE CHECK (email LIKE '%@%'),
    contact_number VARCHAR(15) NOT NULL UNIQUE CHECK (contact_number REGEXP '^[0-9]{7,15}$'),
    dob DATE NOT NULL CHECK (dob < CURRENT_DATE),
    gender ENUM('Male', 'Female', 'Other') NOT NULL,

    course VARCHAR(100) NOT NULL,
    department VARCHAR(100) NOT NULL,
    admission_year YEAR NOT NULL CHECK (admission_year BETWEEN 1900 AND YEAR(CURRENT_DATE)),
    batch_year YEAR NOT NULL CHECK (batch_year >= admission_year),

    enrollment_number VARCHAR(100) NOT NULL UNIQUE,
    current_occupation VARCHAR(255),
    current_company VARCHAR(255),

    career_path VARCHAR(255),
    student_package DECIMAL(15, 2),  -- allows up to 999,999,999,999.99

    address TEXT NOT NULL,
    city VARCHAR(100) NOT NULL,
    state VARCHAR(100) NOT NULL,
    country VARCHAR(100) NOT NULL,

    achievements TEXT,

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);





-- Create Departments table (PostgreSQL)
CREATE TABLE departments (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL UNIQUE
);

-- Create Courses table (PostgreSQL)
CREATE TABLE courses (
  id SERIAL PRIMARY KEY,
  department_id INT NOT NULL REFERENCES departments(id) ON DELETE CASCADE,
  name VARCHAR(100) NOT NULL
);


CREATE TABLE college (
    id SERIAL PRIMARY KEY,
    college_name VARCHAR(100) NOT NULL,
    username VARCHAR(50) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    contact_number VARCHAR(20) NOT NULL UNIQUE,
    address TEXT NOT NULL,
    city VARCHAR(50) NOT NULL,
    state VARCHAR(50) NOT NULL,
    country VARCHAR(50) NOT NULL
);

CREATE DATABASE IF NOT EXISTS mini_market_app_db;
USE mini_market_app_db;
-- Create User table
CREATE TABLE User (
    user_id INT PRIMARY KEY,
    email VARCHAR(255) NOT NULL,
    passwd VARCHAR(255) NOT NULL,
    user_type VARCHAR(50) NOT NULL
);

-- Create Department table
CREATE TABLE Department (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(255) NOT NULL
);

-- Create Employee table
CREATE TABLE Employee (
    user_id INT,
    position VARCHAR(50) NOT NULL,
    department_id INT,
    FOREIGN KEY (user_id) REFERENCES User(user_id),
    FOREIGN KEY (department_id) REFERENCES Department(department_id) ON DELETE CASCADE
);

-- Create Client table
CREATE TABLE Client (
    user_id INT,
    has_discount BOOLEAN DEFAULT false,
    FOREIGN KEY (user_id) REFERENCES User(user_id) ON DELETE CASCADE
);

-- Create Product table
CREATE TABLE Product (
    product_id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    price DECIMAL(10,2) NOT NULL,
    stock INT NOT NULL,
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES Department(department_id)ON DELETE CASCADE
);

-- Create Discount table
CREATE TABLE Discount (
    discount_id INT PRIMARY KEY,
    discount_percentage DECIMAL(5,2) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    product_id INT,
    FOREIGN KEY (product_id) REFERENCES Product(product_id) ON DELETE CASCADE
);

-- Create Bill table
CREATE TABLE Bill (
    bill_id INT PRIMARY KEY,
    user_id INT,
    date DATE NOT NULL,
    total_amount DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES User(user_id) ON DELETE CASCADE
);

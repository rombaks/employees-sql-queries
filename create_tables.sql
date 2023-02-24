/*
Создание таблиц:
- Regions (Регионы)
- locations (Расположения)
- employees (работники, включая менеджеров)
- departments (Подразделения)
 */
-- Создание таблицы Regions (Регионы)
CREATE TABLE
    Regions (
        region_id SERIAL PRIMARY KEY,
        name VARCHAR
    );

-- Создание таблицы Locations (Расположения)
CREATE TABLE
    Locations (
        location_id SERIAL PRIMARY KEY,
        "address" VARCHAR,
        region_id INT,
        FOREIGN KEY (region_id) REFERENCES Regions (region_id)
    );

-- Создание таблицы employees (работники, включая менеджеров)
CREATE TABLE
    Employees (
        employee_id SERIAL PRIMARY KEY,
        "name" VARCHAR,
        last_name VARCHAR,
        hire_date DATE,
        salary INT,
        email VARCHAR,
        manager_id INT,
        FOREIGN KEY (manager_id) REFERENCES Employees (employee_id)
    );

-- Создание таблицы departments (Подразделения)
CREATE TABLE
    Departments (
        department_id SERIAL PRIMARY KEY,
        "name" VARCHAR,
        location_id INT,
        manager_id INT,
        FOREIGN KEY (location_id) REFERENCES Locations (location_id),
        FOREIGN KEY (manager_id) REFERENCES Employees (employee_id)
    );

-- Добавление в таблицу employees внешнего ключа department_id
ALTER TABLE Employees
ADD COLUMN department_id INT REFERENCES Departments (department_id);
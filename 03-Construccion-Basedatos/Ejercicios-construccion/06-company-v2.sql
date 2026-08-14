
CREATE DATABASE company_v2;
GO

USE company_v2;
GO

CREATE TABLE department (
    department_code INT NOT NULL,
    department_name VARCHAR(50) NOT NULL,
    PRIMARY KEY (department_code)
);
GO

CREATE TABLE employee (
    employee_code INT NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    mother_last_name VARCHAR(50),
    birth_date DATE,
    gender CHAR(1),
    salary DECIMAL(10,2) NOT NULL,
    department_code INT,
    manager_code INT,
    PRIMARY KEY (employee_code),
    CONSTRAINT fk_employee_department
        FOREIGN KEY (department_code)
        REFERENCES department(department_code),
    CONSTRAINT fk_employee_manager
        FOREIGN KEY (manager_code)
        REFERENCES employee(employee_code)
);
GO

CREATE TABLE department_location (
    department_code INT NOT NULL,
    location VARCHAR(50) NOT NULL,
    PRIMARY KEY (department_code, location),
    CONSTRAINT fk_department_location_department
        FOREIGN KEY (department_code)
        REFERENCES department(department_code)
);
GO

CREATE TABLE project (
    project_code INT NOT NULL,
    project_name VARCHAR(50) NOT NULL,
    project_location VARCHAR(50),
    department_code INT NOT NULL,
    PRIMARY KEY (project_code),
    CONSTRAINT fk_project_department
        FOREIGN KEY (department_code)
        REFERENCES department(department_code)
);
GO

CREATE TABLE works_on (
    employee_code INT NOT NULL,
    project_code INT NOT NULL,
    hours DECIMAL(4,1) NOT NULL DEFAULT 0.0,
    PRIMARY KEY (employee_code, project_code),
    CONSTRAINT fk_works_on_employee
        FOREIGN KEY (employee_code)
        REFERENCES employee(employee_code),
    CONSTRAINT fk_works_on_project
        FOREIGN KEY (project_code)
        REFERENCES project(project_code)
);
GO

CREATE TABLE dependent (
    employee_code INT NOT NULL,
    dependent_name VARCHAR(50) NOT NULL,
    gender CHAR(1),
    birth_date DATE,
    relationship VARCHAR(20),
    PRIMARY KEY (employee_code, dependent_name),
    CONSTRAINT fk_dependent_employee
        FOREIGN KEY (employee_code)
        REFERENCES employee(employee_code)
);
GO
-- Crear la base de datos CompanyV1
CREATE DATABASE companyv1;
GO

-- Usar la base de datos CompanyV1
USE companyv1;
GO

-- Crear tabla Department
CREATE TABLE department (
    name_dep VARCHAR(50) NOT NULL,
    num_dep INT NOT NULL,
    manager VARCHAR(15) NULL,
    start_date DATETIME2 NOT NULL
    CONSTRAINT df_department_start_date 
    DEFAULT SYSDATETIME(),
    CONSTRAINT pk_department PRIMARY KEY (name_dep, num_dep)
);
GO

-- Crear tabla Employee
CREATE TABLE employee (
    ssn VARCHAR(15) NOT NULL,
    firts_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    address VARCHAR(150) NULL,
    salary DECIMAL(10,2) NOT NULL,
    sex CHAR(1) NOT NULL,
    birtdate DATE NOT NULL,
    name_dep VARCHAR(50) NULL,
    number_dep INT NULL,
    jefe VARCHAR(15) NULL,
    CONSTRAINT pk_employee PRIMARY KEY (ssn),
    CONSTRAINT ck_employee_salary CHECK (salary > 0),
    CONSTRAINT ck_employee_sex CHECK (sex IN ('M', 'F'))
);
GO

-- Crear tabla Location
CREATE TABLE location (
    num_location INT NOT NULL,
    name_dep VARCHAR(50) NOT NULL,
    num_dep INT NOT NULL,
    name_location VARCHAR(100) NOT NULL,
    CONSTRAINT pk_location PRIMARY KEY (num_location, name_dep, num_dep)
);
GO

-- Crear tabla Project
CREATE TABLE project (
    name_project VARCHAR(100) NOT NULL,
    num_project INT NOT NULL,
    location VARCHAR(100) NOT NULL,
    name_dep VARCHAR(50) NOT NULL,
    num_dep INT NOT NULL,
    CONSTRAINT pk_project PRIMARY KEY (name_project, num_project)
);
GO

-- Crear tabla Work_on
CREATE TABLE work_on (
    ssn VARCHAR(15) NOT NULL,
    name_project VARCHAR(100) NOT NULL,
    num_project INT NOT NULL,
    hours DECIMAL(5,2) NULL,
    CONSTRAINT pk_work_on PRIMARY KEY (ssn, name_project, num_project),
    CONSTRAINT ck_work_on_hours CHECK (hours IS NULL OR hours >= 0)
);
GO

-- Crear tabla Dependent
CREATE TABLE dependent (
    name VARCHAR(100) NOT NULL,
    ssn VARCHAR(15) NOT NULL,
    sex CHAR(1) NOT NULL,
    birthdate DATE NOT NULL,
    relationship VARCHAR(30) NOT NULL,
    CONSTRAINT pk_dependent PRIMARY KEY (name, ssn),
    CONSTRAINT ck_dependent_sex CHECK (sex IN ('M', 'F'))
);
GO

-- Agregar restricciones de clave foránea
ALTER TABLE department
ADD CONSTRAINT fk_department_manager
FOREIGN KEY (manager) REFERENCES employee(ssn);
GO

ALTER TABLE employee
ADD CONSTRAINT fk_employee_department
FOREIGN KEY (name_dep, number_dep) REFERENCES department(name_dep, num_dep);
GO

ALTER TABLE employee
ADD CONSTRAINT fk_employee_jefe
FOREIGN KEY (jefe) REFERENCES employee(ssn);
GO

ALTER TABLE location
ADD CONSTRAINT fk_location_department
FOREIGN KEY (name_dep, num_dep) REFERENCES department(name_dep, num_dep);
GO

ALTER TABLE project
ADD CONSTRAINT fk_project_department
FOREIGN KEY (name_dep, num_dep) REFERENCES department(name_dep, num_dep);
GO

ALTER TABLE work_on
ADD CONSTRAINT fk_work_on_employee
FOREIGN KEY (ssn) REFERENCES employee(ssn);
GO

ALTER TABLE work_on
ADD CONSTRAINT fk_work_on_project
FOREIGN KEY (name_project, num_project) REFERENCES project(name_project, num_project);
GO

ALTER TABLE dependent
ADD CONSTRAINT fk_dependent_employee
FOREIGN KEY (ssn) REFERENCES employee(ssn);
GO
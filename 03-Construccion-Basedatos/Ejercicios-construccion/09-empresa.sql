-- Crear la base de datos empresa
CREATE DATABASE empresa;
GO

-- Usar la base de datos
USE empresa;
GO

-- Crear tabla sucursal
CREATE TABLE sucursal(
    sucursal_id INT NOT NULL IDENTITY(1,1)
        CONSTRAINT pk_sucursal PRIMARY KEY,
    clave VARCHAR(20) NOT NULL
        CONSTRAINT uq_sucursal_clave UNIQUE,
    nombre VARCHAR(100) NOT NULL,
    ciudad VARCHAR(100) NOT NULL,
    direccion VARCHAR(200) NULL
);
GO

-- Crear tabla departamento
CREATE TABLE departamento(
    departamento_id INT NOT NULL IDENTITY(1,1)
        CONSTRAINT pk_departamento PRIMARY KEY,
    numero_departamento INT NOT NULL
        CONSTRAINT uq_departamento_numero UNIQUE,
    nombre VARCHAR(100) NOT NULL,
    ubicacion VARCHAR(100) NULL,
    sucursal_id INT NOT NULL
);
GO

-- Crear tabla puesto
CREATE TABLE puesto(
    puesto_id INT NOT NULL IDENTITY(1,1)
        CONSTRAINT pk_puesto PRIMARY KEY,
    clave VARCHAR(20) NOT NULL
        CONSTRAINT uq_puesto_clave UNIQUE,
    nombre VARCHAR(100) NOT NULL,
    salario DECIMAL(12,2) NOT NULL
        CONSTRAINT ck_puesto_salario CHECK (salario > 0),
    sucursal_id INT NOT NULL
);
GO

-- Crear tabla empleado
CREATE TABLE empleado(
    empleado_id INT NOT NULL IDENTITY(1,1)
        CONSTRAINT pk_empleado PRIMARY KEY,
    numero_empleado VARCHAR(20) NOT NULL
        CONSTRAINT uq_empleado_numero UNIQUE,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    antiguedad INT NULL,
    salario DECIMAL(12,2) NOT NULL
        CONSTRAINT ck_empleado_salario CHECK (salario >= 0),
    departamento_id INT NOT NULL,
    puesto_id INT NOT NULL
);
GO

-- Crear tabla proyecto
CREATE TABLE proyecto(
    proyecto_id INT NOT NULL IDENTITY(1,1)
        CONSTRAINT pk_proyecto PRIMARY KEY,
    clave VARCHAR(20) NOT NULL
        CONSTRAINT uq_proyecto_clave UNIQUE,
    nombre VARCHAR(100) NOT NULL,
    fecha_inicio DATE NULL,
    fecha_fin DATE NULL,
    estatus VARCHAR(50) NULL,
    departamento_id INT NOT NULL
);
GO

-- Crear tabla capacitacion
CREATE TABLE capacitacion(
    capacitacion_id INT NOT NULL IDENTITY(1,1)
        CONSTRAINT pk_capacitacion PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    tema VARCHAR(100) NULL,
    fecha_inicio DATE NULL,
    fecha_fin DATE NULL,
    duracion_horas INT NULL
        CONSTRAINT ck_capacitacion_duracion CHECK (duracion_horas >= 0),
    departamento_id INT NOT NULL
);
GO

-- Crear tabla participa_proyecto
CREATE TABLE participa_proyecto(
    empleado_id INT NOT NULL,
    proyecto_id INT NOT NULL,
    rol VARCHAR(50) NULL,
    horas INT NULL
        CONSTRAINT ck_participa_proyecto_horas CHECK (horas >= 0),
    CONSTRAINT pk_participa_proyecto PRIMARY KEY (empleado_id, proyecto_id)
);
GO

-- Crear tabla empleado_capacitacion
CREATE TABLE empleado_capacitacion(
    empleado_id INT NOT NULL,
    capacitacion_id INT NOT NULL,
    fecha_asistencia DATE NULL,
    CONSTRAINT pk_empleado_capacitacion PRIMARY KEY (empleado_id, capacitacion_id)
);
GO

-- Agregar restricciones de llave foránea
ALTER TABLE departamento
    ADD CONSTRAINT fk_departamento_sucursal
    FOREIGN KEY (sucursal_id)
    REFERENCES sucursal(sucursal_id);
GO

ALTER TABLE puesto
    ADD CONSTRAINT fk_puesto_sucursal
    FOREIGN KEY (sucursal_id)
    REFERENCES sucursal(sucursal_id);
GO

ALTER TABLE empleado
    ADD CONSTRAINT fk_empleado_departamento
    FOREIGN KEY (departamento_id)
    REFERENCES departamento(departamento_id);
GO

ALTER TABLE empleado
    ADD CONSTRAINT fk_empleado_puesto
    FOREIGN KEY (puesto_id)
    REFERENCES puesto(puesto_id);
GO

ALTER TABLE proyecto
    ADD CONSTRAINT fk_proyecto_departamento
    FOREIGN KEY (departamento_id)
    REFERENCES departamento(departamento_id);
GO

ALTER TABLE capacitacion
    ADD CONSTRAINT fk_capacitacion_departamento
    FOREIGN KEY (departamento_id)
    REFERENCES departamento(departamento_id);
GO

ALTER TABLE participa_proyecto
    ADD CONSTRAINT fk_participa_proyecto_empleado
    FOREIGN KEY (empleado_id)
    REFERENCES empleado(empleado_id);
GO

ALTER TABLE participa_proyecto
    ADD CONSTRAINT fk_participa_proyecto_proyecto
    FOREIGN KEY (proyecto_id)
    REFERENCES proyecto(proyecto_id);
GO

ALTER TABLE empleado_capacitacion
    ADD CONSTRAINT fk_empleado_capacitacion_empleado
    FOREIGN KEY (empleado_id)
    REFERENCES empleado(empleado_id);
GO

ALTER TABLE empleado_capacitacion
    ADD CONSTRAINT fk_empleado_capacitacion_capacitacion
    FOREIGN KEY (capacitacion_id)
    REFERENCES capacitacion(capacitacion_id);
GO
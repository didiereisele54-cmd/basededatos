-- Crear la base de datos universidad
CREATE DATABASE universidad;
GO

-- Usar la base de datos universidad
USE universidad;
GO

-- Crear la tabla Profesor
CREATE TABLE profesor (
    profesor_id INT IDENTITY(1,1),
    nombre VARCHAR(60) NOT NULL,
    apellido_paterno VARCHAR(50) NOT NULL,
    apellido_materno VARCHAR(50) NULL,
    CONSTRAINT pk_Profesor 
    PRIMARY KEY (profesor_id)
);
GO

--Crear la tabla Especialidad
CREATE TABLE especialidad (
    especialidad_id INT IDENTITY(1,1),
    nombre_especialidad VARCHAR(120) NOT NULL,
    profesor_id INT NOT NULL,
    CONSTRAINT pk_especialidad 
    PRIMARY KEY (especialidad_id),
    CONSTRAINT fk_especialidad_profesor
    FOREIGN KEY (profesor_id) 
    REFERENCES profesor(profesor_id)
);
GO

-- Crear la tabla Curso
CREATE TABLE curso (
    curso_id INT IDENTITY(1,1),
    nombre_curso VARCHAR(100) NOT NULL,
    creditos INT NOT NULL,
    CONSTRAINT ck_creditos 
    CHECK (creditos > 0),
    profesor_id INT NOT NULL,
    CONSTRAINT pk_curso 
    PRIMARY KEY (curso_id),
    CONSTRAINT fk_curso_profesor
    FOREIGN KEY (profesor_id) 
    REFERENCES profesor(profesor_id)
);
GO
```sql
-- Crear la base de datos
CREATE DATABASE sistema_universitario;
GO

USE sistema_universitario;
GO

-- Tabla: Departamento
CREATE TABLE departamento (
    num_depto INT NOT NULL,
    nombre_depto VARCHAR(50) NOT NULL,
    edificio VARCHAR(30) NULL,
    CONSTRAINT pk_departamento PRIMARY KEY (num_depto)
);
GO

-- Tabla: Profesor
CREATE TABLE profesor (
    num_prof INT NOT NULL,
    nombre_p VARCHAR(50) NOT NULL,
    apellido1 VARCHAR(50) NOT NULL,
    apellido2 VARCHAR(50) NULL,
    num_depto INT NOT NULL,
    CONSTRAINT pk_profesor PRIMARY KEY (num_prof),
    CONSTRAINT fk_profesor_departamento FOREIGN KEY (num_depto)
        REFERENCES departamento(num_depto)
);
GO

-- Tabla: Alumno
CREATE TABLE alumno (
    matricula VARCHAR(15) NOT NULL,
    nombre_p VARCHAR(50) NOT NULL,
    apellido1 VARCHAR(50) NOT NULL,
    apellido2 VARCHAR(50) NULL,
    correo VARCHAR(100) NOT NULL,
    fecha_naci DATE NOT NULL,
    num_credencial VARCHAR(20) NULL,
    CONSTRAINT pk_alumno PRIMARY KEY (matricula)
);
GO

-- Tabla: Credencial
CREATE TABLE credencial (
    num_credencial VARCHAR(20) NOT NULL,
    fecha_inscripcion DATE NOT NULL,
    vigencia DATE NOT NULL,
    matricula VARCHAR(15) NOT NULL,
    CONSTRAINT pk_credencial PRIMARY KEY (num_credencial),
    CONSTRAINT uq_credencial_matricula UNIQUE (matricula)
);
GO

-- Tabla: Telefono
CREATE TABLE telefono (
    telefono_id INT IDENTITY(1,1) NOT NULL,
    telefono VARCHAR(15) NOT NULL,
    matricula VARCHAR(15) NOT NULL,
    CONSTRAINT pk_telefono PRIMARY KEY (telefono_id),
    CONSTRAINT fk_telefono_alumno FOREIGN KEY (matricula)
        REFERENCES alumno(matricula)
);
GO

-- Tabla: Materia
CREATE TABLE materia (
    clave_materia VARCHAR(10) NOT NULL,
    nombre_materia VARCHAR(100) NOT NULL,
    crediros INT NOT NULL,
    num_prof INT NOT NULL,
    CONSTRAINT pk_materia PRIMARY KEY (clave_materia),
    CONSTRAINT fk_materia_profesor FOREIGN KEY (num_prof)
        REFERENCES profesor(num_prof)
);
GO

-- Tabla: Cursa
CREATE TABLE cursa (
    matricula VARCHAR(15) NOT NULL,
    clave_materia VARCHAR(10) NOT NULL,
    fecha_inscripcion DATE NOT NULL,
    calif_final DECIMAL(4,2) NULL,
    CONSTRAINT pk_cursa PRIMARY KEY (matricula, clave_materia),
    CONSTRAINT fk_cursa_alumno FOREIGN KEY (matricula)
        REFERENCES alumno(matricula),
    CONSTRAINT fk_cursa_materia FOREIGN KEY (clave_materia)
        REFERENCES materia(clave_materia)
);
GO

-- Tabla: Dependiente
CREATE TABLE dependiente (
    nombre VARCHAR(100) NOT NULL,
    num_prof INT NOT NULL,
    fecha_naci DATE NOT NULL,
    parentesco VARCHAR(30) NOT NULL,
    CONSTRAINT pk_dependiente PRIMARY KEY (nombre, num_prof),
    CONSTRAINT fk_dependiente_profesor FOREIGN KEY (num_prof)
        REFERENCES profesor(num_prof)
);
GO

-- Tabla: Proyecto
CREATE TABLE proyecto (
    num_proy INT NOT NULL,
    nombre_proy VARCHAR(100) NOT NULL,
    presupuesto DECIMAL(12,2) NOT NULL,
    CONSTRAINT pk_proyecto PRIMARY KEY (num_proy),
    CONSTRAINT ck_proyecto_presupuesto CHECK (presupuesto > 0)
);
GO

-- Tabla: Participa
CREATE TABLE participa (
    num_prof INT NOT NULL,
    num_proy INT NOT NULL,
    rol VARCHAR(50) NOT NULL,
    fecha_inicio DATE NOT NULL,
    CONSTRAINT pk_participa PRIMARY KEY (num_prof, num_proy),
    CONSTRAINT fk_participa_profesor FOREIGN KEY (num_prof)
        REFERENCES profesor(num_prof),
    CONSTRAINT fk_participa_proyecto FOREIGN KEY (num_proy)
        REFERENCES proyecto(num_proy) ON DELETE CASCADE
);
GO

-- Relación 1:1 entre Alumno y Credencial
ALTER TABLE alumno
ADD CONSTRAINT fk_alumno_credencial FOREIGN KEY (num_credencial)
    REFERENCES credencial(num_credencial);
GO

-- Relación 1:1 entre Credencial y Alumno
ALTER TABLE credencial
ADD CONSTRAINT fk_credencial_alumno FOREIGN KEY (matricula)
    REFERENCES alumno(matricula);
GO
```

![Sistema_universitario](../../img/construccion/sistema-universitario.jpg)
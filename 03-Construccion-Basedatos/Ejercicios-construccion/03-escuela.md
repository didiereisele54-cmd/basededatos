```sql

-- Crear la base de datos Escuela
CREATE DATABASE escuela;
GO

-- Usar la base de datos Escuela
USE escuela;
GO

-- Crear la tabla Alumno
CREATE TABLE alumno (
    alumno_id INT IDENTITY(1,1),
    matricula VARCHAR(15) UNIQUE NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    semestre INT NOT NULL,
    CONSTRAINT pk_alumno 
    PRIMARY KEY (alumno_id),
    CONSTRAINT uq_alumno_matricula
    UNIQUE (matricula)
);
GO

-- Crear la tabla Materia
CREATE TABLE materia (
    materia_id INT IDENTITY(1,1),
    nombre VARCHAR(50) NOT NULL,
    creditos INT NOT NULL,
    CONSTRAINT pk_materia 
    PRIMARY KEY (materia_id)
);
GO

-- Crear la relación entre Alumno y Materia (muchos a muchos) llamada Inscripcion
CREATE TABLE inscripcion (
    alumno_id INT NOT NULL,
    materia_id INT NOT NULL,
    fecha_inicio DATE NOT NULL,
    calif_final DECIMAL(4,2) NULL,
    CONSTRAINT pk_inscripcion 
    PRIMARY KEY (alumno_id, materia_id),
    CONSTRAINT fk_inscripcion_alumno 
    FOREIGN KEY (alumno_id) REFERENCES alumno(alumno_id),
    CONSTRAINT fk_inscripcion_materia 
    FOREIGN KEY (materia_id) REFERENCES materia(materia_id)
);
GO
```

![Escuela](../../img/construccion/escuela.jpg)
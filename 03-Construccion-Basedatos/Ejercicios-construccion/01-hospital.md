```sql

-- Creación de la Base de Datos Hospital
CREATE DATABASE hospital;
GO

-- Usar la base de datos Hospital
USE hospital;
GO  

-- Tabla Paciente
CREATE TABLE paciente(
    paciente_id INT NOT NULL IDENTITY(1,1),
    nombre VARCHAR(50) NOT NULL,
    apellido_paterno VARCHAR(50) NOT NULL,
    apellido_materno VARCHAR(50) NULL,
    fecha_nacimiento DATETIME2 NOT NULL,
    CONSTRAINT pk_paciente
    PRIMARY KEY (paciente_id)
);
GO

-- Tabla Expediente
CREATE TABLE expediente(
    expediente_id INT NOT NULL IDENTITY(1,1),
    fecha_apertura DATETIME2 NOT NULL
    CONSTRAINT df_expediente_fecha_apertura
    DEFAULT SYSDATETIME(),
    tipo_sangre CHAR(3) NOT NULL
    CONSTRAINT ck_expediente_tipo_sangre
    CHECK (tipo_sangre IN ('A+','A-','B+','B-','AB+','AB-','O+','O-')),
    paciente_id INT NOT NULL,
    CONSTRAINT pk_expediente
    PRIMARY KEY (expediente_id),
    CONSTRAINT fk_expediente_paciente
    FOREIGN KEY (paciente_id)
    REFERENCES paciente(paciente_id)
);
GO
```

![Hospital](../../img/construccion/hospital.png)
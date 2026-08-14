/* =======================================================================
    DQL (Data Query Lenguage) en SQLServer

    Archivo: 01-create-databse-sql

    Descripción: Crear la base de datos para la práctica de las consultas
   =======================================================================
*/ 


USE master;
GO

IF DB_ID('comercial_db') IS NOT NULL
BEGIN
    ALTER DATABASE comercial_db
    SET SINGLE_USER
    WITH ROLLBACK IMMEDIATE;

    DROP DATABASE comercial_db;
END
GO

CREATE DATABASE comercial_db;
GO

USE comercial_db;
GO

PRINT 'La base de datos comercial_db se creo correctamente';
GO
-- SELECT OBJECT_ID('comercial_db');
/* =======================================================================
    DQL (Data Query Lenguage) en SQLServer

    Archivo: 05-basic-querys.sql

    Descripción: Aquí se realizan consulatas básicas con SELECT
   =======================================================================
*/ 
CREATE DATABASE comercial_db;
GO

USE comercial_db;
GO
---- Uso de SELECT *
/*
===========================================================================================
= SINTAXIS:
= SELEC *
= FROM nombre_tabla;                                                                      =
= Nota: El "*" significa tods las columnas de la tabla                                    =
=                                                                                         =
= No se recomienda utilizar siempre:                                                      =
= 1) Reduce la claridad de la consulta                                                    =
= 2) Puede aumentar el consumo de recursos                                                =
= 3) Puede afectar aplicaciones futuras                                                   =
===========================================================================================
*/

SELECT * 
FROM productos;

-- Proyeccion de la tabla productos
SELECT 
    codigo, 
    nombre, 
    precio
FROM productos;
GO

---- Alias de columna (Sobrenombre que se le pone a un campo)

SELECT 
    codigo AS codigo_producto, 
    nombre AS nombre_producto, 
    precio AS precio_unitario
FROM productos;
GO

SELECT 
    codigo AS [codigo producto], 
    nombre AS [nombre producto], 
    precio AS [precio unitario]
FROM productos;
GO

SELECT 
    codigo AS 'codigo producto', 
    nombre AS 'nombre producto', 
    precio AS 'precio unitario'
FROM productos;
GO

---- Alias sin la instruccion AS (no recomendado)

SELECT 
    codigo codigo_producto, 
    nombre nombre_producto, 
    precio precio_unitario
FROM productos;
GO

SELECT 
    codigo [codigo producto], 
    nombre [nombre producto], 
    precio [precio unitario]
FROM productos;
GO

---- Alias de tabla
--- Es útil en los joins y en nombres ambigüos
SELECT 
    p.codigo, 
    p.nombre, 
    p.precio
FROM productos AS p;
GO

SELECT 
    categorias.id_categoria,
    categorias.nombre,
    producto.id_producto,
    producto.nombre,
    producto.precio
FROM categorias AS c
INNER JOIN
productos
ON id_categoria = id_categoria;
GO

SELECT 
    c.id_categoria,
    c.nombre,
    p.id_producto,
    p.nombre,
    p.precio
FROM categorias AS c
INNER JOIN
productos AS p
ON c.id_categoria = p.id_categoria;
GO

SELECT 
    p.codigo AS Código, 
    p.nombre AS [Nombre Producto], 
    p.precio AS 'Precio Unitario'
FROM productos AS p;
GO

-- Columnas Calculadas
-- Campos calculados y E-R (atributo Derivado)
-- Seleccionar el codigo, nombre , precio, existencia
-- y el valor del inventario
SELECT 
    p.codigo AS código_producto,
    p.nombre AS nombre_producto,
    p.precio AS precio_unitario,
    p.existencia, 
    (p.existencia * p.precio) AS precio_inventario
FROM productos AS p;
GO

/*
========================================================================================
Operadores Aritmeticos:
    + suma
    - resta
    * multiplicación
    / división
    % módulo o residuo de la división
===========================================================================================
*/

SELECT 
    e.nombre,
    e.apellido_paterno,
    e.salario AS salario_anual,
    (salario *12)
FROM empleados AS e;
GO

--  Seleccionar el datekka de las vebtas , mostrando
-- numero de venta, cantidad, precio, descuento
-- calcular el imporgtw bruto (cantidad por el precio)
-- calcular el importe d¿cin descuenti(importw_bruto * descuento / 100)
-- calcular el importe neti, (importe_bruto * 1 - el descuento entre 100)

SELECT
    dv.id_venta AS #venta,
    dv.cantidad AS cantidad_vendida,
    dv.precio AS [precio de venta],
    dv.descuento AS 'descuento de venta',
    (dv.cantidad * dv.precio) AS importe_bruto,
    ((dv.cantidad * dv.precio) / 100.0) AS importe_descuento,
    (dv.cantidad * dv.precio) * (1.0 - dv.descuento/100.0) AS importe_neto
FROM detalle_ventas AS dv;

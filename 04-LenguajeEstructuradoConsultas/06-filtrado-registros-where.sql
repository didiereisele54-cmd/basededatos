/* ========================================================================
    DQL (Data Query Lenguage) en SQLServer

    Archivo: 06-filtrado-registros-where.sql

    Descripción: Se recuperan unicamente las filas que cumplen determinadas
    condiciones mediante la clausula where

    ORDEN SINTACTICO
    SELECT / TOP
    FrOM
    JOIN / ON
    WHERE
    GROUP BY
    HAVING
    ORDER BY

    ORDEN DE EJECUCIÓN
    FROM / JOINS
    WHERE
    GROUP BY
    HAVING
    SELECT 
    DISTICT
    ORDER BY
    TOP
   ========================================================================
*/ 

/*
========================================================================================================
Sintaxis

SELECT 
    columna_1,
    columna_2,
    columna_n
FROM nombre_tabla
WHERE condición;

Nota: Condición puede ser relacional y a combinación de esta lógica

Nota: EL SELECT NO FILTRA REGISTROS

========================================================================================================
*/

USE comercial_db;
GO

-- Seleccionar el producto cuyo precio es de $200

SELECT 
    p.codigo AS [Código],
    p.nombre AS [Producto],
    p.precio AS [Precio]
FROM productos AS p
WHERE precio = 200;

-- Seleccionar el cliente cuyo identificador es 25
SELECT
    c.id_cliente,
    CONCAT (c.nombre, ' ',
            c.apellido_paterno, ' ',
            c.apellido_materno) AS nombre_completo,
    c.correo
FROM clientes AS c
WHERE c.id_cliente = 25;

-- Comparación de cadenas de Texto
-- los valores de twcto deben escribirse entre comillas simples
-- Seleccionar las categorias donde el nombre sea Cómputo

SELECT 
    c.nombre AS [Categoria]
FROM categorias AS c
WHERE c.nombre = 'Cómputo';

-- Seleccionar los datos del cliente con nombre Cliente1
SELECT
    c.id_cliente AS [Identificador del Cliente],
    CONCAT (c.nombre, ' ',
            c.apellido_paterno, ' ',
            c.apellido_materno) AS nombre_completo,
    c.fecha_nacimiento AS [Fecha de Nacimiento],
    c.correo AS [Correo Eléctronico],
    c.telefono AS [Teléfono]
FROM clientes AS c
WHERE c.nombre = 'Cliente1';

-- Seleccionar los datos del empleado que no pertenezcan al departamento 1
SELECT 
    e.id_empleado AS [Identificador del Empleado],
    CONCAT (e.nombre, ' ',
            e.apellido_paterno, ' ',
            e.apellido_materno) AS nombre_completo,
    e.fecha_nacimiento AS [Fecha de Nacimiento],
    e.correo AS [Correo Eléctronico],
    e.telefono AS [Teléfono]
FROM empleados AS e
WHERE e.id_empleado <> 1;

-- Seleccionar los datos de los productos donde el precio sea superior a $490

-- Seleccionar los datos de los productos donde con existencia crítica inferior
-- 10 unidades

-- Seleccionar los datos de los empleados donde el salario sea de $30,000 en
-- adelante

-- Sellecionar los datos de los productos donde sus precios sean de $10 o menos

-- COMPARACIÓN DE FECHAS
-- Las fechas deben escribirse entre comillas simples
-- se recomienda el formato AAAA-MM-DD

-- Selecionar los daros de las ventas realizadas el 24 de Diciembre de 2025
SELECT
    v.id_venta,
    v.fecha,
    v.id_cliente,
    v.id_empleado
FROM ventas AS v
WHERE fecha = '2025-12-24';

-- Seleccionar los datos de las ventas realizadas en 2025
SELECT
    v.id_venta,
    v.fecha,
    YEAR(v.fecha) AS [AÑO],
    MONTH(v.fecha) AS [MES],
    DAY(v.fecha) AS [DÍA],
    v.id_cliente,
    v.id_empleado
FROM ventas AS v
WHERE MONTH (fecha) = 04;

-- Seleccionar todas las ventas anteriores al 1 de febrero de 2025
SELECT
    v.id_venta,
    v.fecha,
    YEAR(v.fecha) AS [AÑO],
    MONTH(v.fecha) AS [MES],
    DAY(v.fecha) AS [DÍA],
    v.id_cliente,
    v.id_empleado
FROM ventas AS v
WHERE fecha < '2025-02-01';

--



-- DISCTINCT
-- QUITA ELEMENTOS REPETDIOS DE UNA COMBINACIÓN DE COLUMNAS

SELECT DISTINCT
    sexo
FROM clientes AS c;

SELECT DISTINCT
    id_ciudad
FROM clientes AS c;


SELECT DISTINCT
    cu.nombre
FROM clientes AS c
INNER JOIN ciudades AS cu
ON c.id_ciudad = cu.id_ciudad;

-- Seleccionear los descuentos únicos de las vejtas

SELECT DISTINCT
    dv.descuento
FROM detalle_ventas AS dv
ORDER BY dv.descuento DESC;


SELECT DISTINCT
    p.id_categoria,
    p.id_proveedor
FROM productos as p;

-- TOP
-- Limita la cantidad de filas devueltas por una consulta

SELECT TOP (56)
    dv.id_detalle_venta,
    dv.precio,
    dv.cantidad,
    dv.descuento
FROM detalle_ventas AS dv;


SELECT TOP (10) PERCENT
    dv.id_detalle_venta,
    dv.precio,
    dv.cantidad,
    dv.descuento
FROM detalle_ventas AS dv;


-- Seleccionar las ventas anterores al 1 de febrero del 2025

SELECT
    v.id_venta,
    v.fecha,
    YEAR(v.fecha) AS [AÑO],
    MONTH(v.fecha) AS [MES],
    DAY(v.fecha) AS [DÍA],
    v.id_cliente,
    v.id_empleado
FROM ventas AS v
WHERE v.fecha < '2025-02-01';



--- Seleccionar los datos de los productos mostrando el código y el valor
-- del inventariuo. donde el valor deol inventario debe ser mayor a 50000

SELECT
    p.codigo AS codig_producto,
    p.existencia AS existencia,
    p.precio AS precio,
    (p.precio * p.existencia) AS valor_inventario
FROM productos AS p
WHERE (p.precio * p-existencia) > 50000;


SELECT
    p.codigo AS codig_producto,
    p.existencia AS existencia,
    p.precio AS precio,
    (p.precio * p.existencia) AS valor_inventario
FROM productos AS p
WHERE precio >= 200 AND precio <=300;
-- OPERADOR BETWEEN
-- Permite comprobar si un valor se encuentra dentro de un rango inclusivo

/*==================================================================
WHERE columna BETWEEN limite_inferior AND limite_superior
====================================================================*/

-- Mostrar empleados con salario entre $15,000 y $20,000, incluyendo ambos limites

SELECT
    e.id_empleado,
    e.nombre,
    e.salario
FROM empleados AS e
WHERE salario BETWEEN 15000 AND 20000
ORDER BY 3 DESC;

SELECT
    e.id_empleado,
    e.nombre,
    e.salario
FROM empleados AS e
WHERE e.salario>=15000
      AND
      e.salario<=20000;

-- Mostrar los productos que los precios esten en el rango de 100 y 200
SELECT
    p.codigo,
    p.nombre,
    p.precio,
    p.existencia
FROM productos AS p
WHERE p.precio BETWEEN 100 AND 200;
-- Mostrar las ventas del 1 de enero de 2025 al 10 de enero de 2025
SELECT
    v.id_venta AS [numero_venta],
    v.id_cliente AS [cliente],
    v.id_empleado AS [vendedor],
    v.fecha AS [fecha_venta],
    UPPER(FORMAT(v.fecha, 'MMMM', 'es-ES')) AS [mes_venta],
    UPPER(FORMAT(v.fecha, 'dddd', 'es-ES')) AS [dia_venta],
    DATEPART(YEAR, v.fecha) AS [año_venta]
FROM ventas AS v
WHERE v.fecha BETWEEN '2025-01-01' AND '2025-01-10'
ORDER BY [cliente] ASC;

-- Mostrar los productos que su rango de precios no este entre 100 y 400

SELECT
    p.codigo,
    p.nombre,
    p.precio,
    p.existencia
FROM productos AS p
WHERE p.precio NOT BETWEEN 100 AND 400;

-- OPERADOR IN
-- permite comparar una columna con una lista de valores

/*==================================================================
WHERE columna IN (valor_1, valor_2, valor_3)
====================================================================*/

-- Mostrar productos pertenecientes a las categorias 1,7 o 12

SELECT
    p.codigo,
    p.nombre,
    p.precio,
    p.existencia,
    p.id_categoria
FROM productos AS p
WHERE p.id_categoria IN (1,7,12)
ORDER BY p.id_categoria;


SELECT
    p.codigo,
    p.nombre,
    p.precio,
    p.existencia,
    p.id_categoria
FROM productos AS p
WHERE p.id_categoria  = 1
      OR p.id_categoria = 7
      OR p.id_categoria = 12
ORDER BY p.id_categoria;

-- Mostrar todos los productos que no pertenecen a la categoria 1, 7 o 12

SELECT
    p.codigo,
    p.nombre,
    p.precio,
    p.existencia,
    p.id_categoria
FROM productos AS p
WHERE p.id_categoria NOT IN (1,7,12)
ORDER BY p.id_categoria;

--------
/*================================================== OPERADOR LIKE =======================================
    Permite buscar patrones dentro de valores de texto

    Sintaxis

    WHERE columna LIKE 'patron'

    Los patrones pueden contener comodines

    Comodin         Significado
       %            Cero o varios valores
       _            Escatamente un carácter
     [abc]          Un caácter incluido en la lista
     [a-f]          Un carácter incluido en el rango
     [^abc]         Un carácter no incluido en la lista
===========================================================================================================
*/

-- Comodin %
-- El simbolo representa cualquier cantudad de caracteres incluyendo cero caracteres

-- Comienza
-- WHERE nombre LIKE 'Cliente%'
-- valores que cominenzan con un cliente

-- Termina
-- WHERE correo LIKE '%mail.com'
-- Valores que terminan con mail.com

-- COntiene
-- WHERE nombre LIKE '%a%'
-- valoers que contienen el caracter a en cualquier posición

-- Buscar codigos de productos que comiencen con P001
SELECT
    p.codigo,
    p.nombre,
    p.precio
FROM productos AS p
WHERE p.codigo LIKE 'P001%';


-- Buscar los correos de los clientes con 10@mail.com
SELECT
    c.id_cliente,
    c.nombre,
    c.correo
FROM clientes AS c
WHERE c.correo LIKE '%10@mail.com';


-- Mostrar los nombres de los productos que contienen el caracter 1
SELECT
    p.codigo,
    p.nombre,
    p.precio
FROM productos AS p
WHERE p.nombre LIKE '%1%';

---- Comodin de un caracter
-- el guion bajo "_" representa exactamente un caracter

-- Mostrar los codigos con P000 y exactamente un caracter adicional
SELECT
    p.codigo,
    p.nombre,
    p.precio
FROM productos AS p
WHERE p.nombre LIKE 'P000_';

SELECT
    p.codigo,
    p.nombre,
    p.precio
FROM productos AS p
WHERE p.nombre LIKE 'P000%';

----- Patron con corchetes
SELECT
    p.codigo,
    p.nombre,
    p.precio
FROM productos AS p
WHERE p.codigo LIKE 'P000[1-5]';


SELECT
    p.codigo,
    p.nombre,
    p.precio
FROM productos AS p
WHERE p.codigo LIKE 'P000[^1-5]';

-- Buscar un guion bajo literal{
-- en LIKE, _ es un comodin
-- Las ciudades de esta base de datos , contienen guiones bajosn, por ejemplo:
-- Ciudada_1_1
-- Para buscar un guion bajo literal meduante corchetes se puede utilizar
SELECT
    *
FROM ciudades AS c
WHERE nombre LIKE '%[_]%'; -- Sifnifica un carácter de gion bajo literal
# construccion de Base de datos con SQL-LDD

SQL (strucuned query languaje) se divide en cinco grandes categorias:

1. *DLL (Data Definition languaje)*
2. *DML (Data Manipulation languaje)*
3. *DQL (Dta Query languaje)*
4. DCL (Data Control Languaje)
5. TCL (transaction Control Languaje)

## SQL-DDL

*Lenguaje de Definicion de Datos*
Se utiliza para *crear y modificar la estructura* de una base de datos
con DDL trabajamos sobre los objetos de la base de datos:

- Base de datos
- Tablas
- Vistas
- Indices
- Restrincciones
- Esquemas
- Store procedures
- trigger
- funtions

*Comandos principales*

| Comandos | Funciones |
| :--- | :--- |
| CREATE | Crea objetos |
| ALTER| Modifica objetos |
| DROP| Eliminar objetos |
| TRUNCATE| vaciar una tabla |

## SQL-MDL

*Lenguaje de Manipulacion de Datos*

sirve para *trabajar con la informacion almacenada*
aqui no cambia la estructura, si nos los registros

*comandos principales*

| Comandos | Funcion |
| :--- | :--- |
| INSERT | Inserta Registros |
| UPDATE| Actualizar Registros |
| DELETE| Eliminar Registros |

## SQL-DQL
*Lenguaje de consulta de datos*
su funcion es *consultar informacion*

*comando principal*
| Comando | Funcion |
| :--- | :--- |
| SELEC | Consultar informacion |

general se conbina con:

- WHERE
- OREDER BY
- GROUP BY
- HAVING
- JOIN (LEFT, RIGHT, INNER, CROSS Y FULL)
- DISTINCT
- TOP / LIMIT
- Funciones de Agregado (SUM, AVG, MAX, MIN, COUNT)
- Funcioes de ventana (window function)

## Nomenclatura snake_case

**snake_case** es la convencion mas recomendada de ahora si se busca una nomenclatura moderna, portable y alineada con buenas praticas en distintos motores de base de datos.

La razon en que funcina de forma consistente de **SQLServer,Mysql** y especialmente en **postgreSQL**. Con snake?case se evitan problemas de mayusculas y se hacen las consultas sean mas legibles.

**Estandae de construccion**

| Objeto | Convencion | Ejemplo 
| :--- | :--- | :--- |
| Base de datos | Snake_case | control_escolar |
| Esquema | snake_case | ventas, rh, seguridad |
| Tabla | singular en snake_case | cliente, pedido,
detalle
|
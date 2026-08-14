-- Crear la base de datos Comercio
CREATE DATABASE comercio;
GO

-- Usar la base de datos Comercio
USE comercio;
GO

-- Crear la tabla Cliente
CREATE TABLE cliente (
    id_cliente INT IDENTITY(1,1) NOT NULL,
    rfc VARCHAR(13) UNIQUE NOT NULL,
    razon_social VARCHAR(150) NOT NULL,
    CONSTRAINT pk_cliente 
    PRIMARY KEY (id_cliente),
    CONSTRAINT uq_cliente_rfc 
    UNIQUE (rfc)
);
GO

-- Crear la tabla Pedido
CREATE TABLE pedido (
    id_pedido INT IDENTITY(1,1) NOT NULL,
    fecha_pedido DATETIME2 NOT NULL 
    CONSTRAINT df_fecha_pedido
    DEFAULT SYSDATETIME(),
    id_cliente INT NOT NULL,
    CONSTRAINT pk_pedido 
    PRIMARY KEY (id_pedido),
    CONSTRAINT fk_pedido_cliente 
    FOREIGN KEY (id_cliente) 
    REFERENCES cliente(id_cliente)
);
GO

-- Crear la tabla Producto
CREATE TABLE producto (
    id_producto INT IDENTITY(1,1) NOT NULL,
    nombre_producto VARCHAR(100) NOT NULL,
    CONSTRAINT pk_producto 
    PRIMARY KEY (id_producto)
);
GO

-- Crear la tabla DetallePedido
CREATE TABLE detalle_pedido (
    id_pedido INT NOT NULL,
    id_producto INT NOT NULL,
    cantidad_solicitada INT NOT NULL
    CONSTRAINT df_cantidad_solicitada
    DEFAULT (1),
    CONSTRAINT ck_cantidad_solicitada 
    CHECK (cantidad_solicitada > 0),
    CONSTRAINT pk_detalle_pedido 
    PRIMARY KEY (id_pedido, id_producto),
    CONSTRAINT fk_detalle_pedido 
    FOREIGN KEY (id_pedido) 
    REFERENCES pedido(id_pedido),
    CONSTRAINT fk_detalle_producto 
    FOREIGN KEY (id_producto) 
    REFERENCES producto(id_producto)
);
GO